<?php

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

$userType = new ObjectType([
    'name' => 'User',
    'description' => 'Tipo de dato para el usuario',
    'fields' => [
        'id' => Type::int(),
        'nombre_usuario' => Type::string(),
        'correo_electronico' => Type::string(),
        'clave' => Type::string(),
        'rol' => Type::string(),
        'avatar' => Type::string()
    ]
]);
$settingOptionType = new ObjectType([
    'name' => 'Setting',
    'description' => 'Tipo de dato para una opción de configuración ',
    'fields' => [
        'opcion' => Type::string(),
        'valor' => Type::string(),
    ]
]);
?>