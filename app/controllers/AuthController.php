<?php

namespace App\Controllers;

use App\Models\User;
use Firebase\JWT\JWT;
use Valitron\Validator;

class AuthController extends \BaseRoute
{
    function login()
    {
        $username = $this->f3->get('POST.username');
        $password = $this->f3->get('POST.password');
        $v = new Validator([
            'username' => $username,
            'password' => $password,
        ]);
        $v->rule('required', ['username', 'password']);
        if (!$v->validate()) {
            $output = [
                'success' => false,
                'payload' => $v->errors()
            ];
            $this->f3->status(422);
            echo json_encode($output);
            die();
        }
        $user = User::firstWhere('nombre_usuario', $username);
        if ($user && password_verify($password, $user->clave)) {
            $payload = array(
                "id" => $user->id,
                "username" => $user->nombre_usuario,
                "role" => $user->rol,
                "exp" => time() + ($_ENV['TOKEN_LIFE'] * 60 * 60)
            );
            $token = JWT::encode($payload, $_ENV['SECRET_KEY']);
            $output = [
                'success' => true,
                'payload' => 'Token generated successfully',
                'token' => '' . $token
            ];
            echo json_encode($output);
            die();

        } else {
            $output = [
                'success' => false,
                'payload' => 'Invalid username and/or password'
            ];
            $this->f3->status(400);
            echo json_encode($output);
            die();
        }
    }
}

?>