<?php

use \Firebase\JWT\JWT;

class SecureRoute extends BaseRoute
{
    function getAuthorizationHeader()
    {
        $headers = null;
        if (isset($_SERVER['Authorization'])) {
            $headers = trim($_SERVER["Authorization"]);
        } else if (isset($_SERVER['HTTP_AUTHORIZATION'])) { //Para Nginx o fast CGI
            $headers = trim($_SERVER["HTTP_AUTHORIZATION"]);
        } elseif (function_exists('apache_request_headers')) {
            $requestHeaders = apache_request_headers();
            // Corrección del lado del servidor para
            // errores en versiones antiguas de Android
            $requestHeaders = array_combine(
                array_map(
                    'ucwords',
                    array_keys($requestHeaders)),
                array_values($requestHeaders)
            );
            if (isset($requestHeaders['Authorization'])) {
                $headers = trim($requestHeaders['Authorization']);
            }
        }
        return $headers;
    }

    function getBearerToken()
    {
        $headers = $this->getAuthorizationHeader();
        // Obtiene el token de acceso del encabezado
        if (!empty($headers)) {
            $headersData = explode(" ", $headers);
            return $headersData[1];
        } else {
            return null;
        }
    }

    function validateToken($token)
    {
        try {
            $decoded = JWT::decode($token, $_ENV['SECRET_KEY'], array('HS256'));
            $this->account = $decoded;
        } catch (Exception $e) {
            return false;
        }
        return true;
    }

    function beforeroute()
    {
        $token = $this->getBearerToken();
        if (isset($token)) {
            if (!$this->validateToken($token)) {
                $output = [
                    'success' => false,
                    'payload' => 'Invalid Token'
                ];
                $this->f3->status(401);
                echo json_encode($output);
                die();
            }
        } else {
            $output = [
                'success' => false,
                'payload' => 'Please provide a token to access this resource'
            ];
            $this->f3->status(401);
            echo json_encode($output);
            die();
        }
    }
}

?>