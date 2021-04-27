<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Authorization, Origin, Cache-Control, X-Requested-With, Content-Type, Access-Control-Allow-Origin');
header('Access-Control-Allow-Methods: *');
header('Content-type: application/json');

// Cargamos el autoload de clases de Composer
require __DIR__ . '/vendor/autoload.php';

// Inicializamos el micro-framework Fat-Free
$f3 = \Base::instance();
$f3->set('AUTOLOAD', 'app/controllers/|app/graphql/|app/helpers/|app/models/');
require_once 'app/routes.php';

// Cargamos el archivo .env
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . "/app");
$dotenv->load();

// Configuración del ORM Eloquent
use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule;

try {
    $capsule->addConnection([
        'driver' => $_ENV['DB_DRIVER'],
        'host' => $_ENV['DB_HOSTNAME'],
        'database' => $_ENV['DB_DATABASE'],
        'username' => $_ENV['DB_USERNAME'],
        'password' => $_ENV['DB_PASSWORD'],
        'charset' => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix' => '',
    ]);
} catch (Exception $e) {
    die("<h1>Error Establishing a Database Connection</h1>");
}

$capsule->setAsGlobal();
$capsule->bootEloquent();

// Configuración del validador
use Valitron\Validator as V;

V::langDir('vendor/vlucas/valitron/lang');
V::lang('es');

// Zona horaria
date_default_timezone_set($_ENV['TIMEZONE']);

$f3->run();
?>