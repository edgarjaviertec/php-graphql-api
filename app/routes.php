<?php
$f3->route('GET /',
    function () {
        $output = [
            'success' => true,
            'payload' => 'Welcome to my API'
        ];
        echo json_encode($output);
        die();
    }
);
$f3->route('POST /graphql', 'App\Controllers\GraphQLController->index');
$f3->route('POST /login', 'App\Controllers\AuthController->login');
?>