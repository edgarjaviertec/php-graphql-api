<?php

use App\Models\User;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

require_once(__DIR__ . '/types.php');
$mutations = new ObjectType([
    'name' => 'Mutation',
    'fields' => [
        'addUser' => [
            'type' => $userType,
            'args' => [
                'username' => Type::nonNull(Type::string()),
                'email' => Type::nonNull(Type::string()),
                'password' => Type::nonNull(Type::string()),
                'role' => Type::nonNull(Type::string()),
                'avatar' => Type::nonNull(Type::string()),
            ],
            'resolve' => function ($root, $args) {
                if ($root['user_logged_in']->role == 'admin') {
                    $hashedPassword = password_hash($args['password'], PASSWORD_DEFAULT);
                    $user = new User([
                        'nombre_usuario' => $args['username'],
                        'correo_electronico' => $args['email'],
                        'clave' => $hashedPassword,
                        'rol' => $args['role'],
                        'avatar' => $args['avatar']
                    ]);
                    $user->save();
                    return $user->toArray();
                }
                return null;
            }
        ],
        'modifyUser' => [
            'type' => $userType,
            'args' => [
                'id' => Type::nonNull(Type::int()),
                'username' => Type::nonNull(Type::string()),
                'email' => Type::nonNull(Type::string()),
                'password' => Type::nonNull(Type::string()),
                'role' => Type::nonNull(Type::string()),
                'avatar' => Type::nonNull(Type::string()),
            ],
            'resolve' => function ($root, $args) {
                if ($root['user_logged_in']->role == 'admin') {
                    $hashedPassword = password_hash($args['password'], PASSWORD_DEFAULT);
                    $user = User::find($args['id']);
                    $user->nombre_usuario = isset($args['username']) ? $args['username'] : $user->nombre_usuario;
                    $user->correo_electronico = isset($args['email']) ? $args['email'] : $user->correo_electronico;
                    $user->clave = isset($args['password']) ? $hashedPassword : $user->clave;
                    $user->rol = isset($args['role']) ? $args['role'] : $user->rol;
                    $user->avatar = isset($args['avatar']) ? $args['avatar'] : $user->avatar;
                    $user->save();
                    return $user->toArray();
                }
                return null;
            }
        ],
        'deleteUser' => [
            'type' => $userType,
            'args' => [
                'id' => Type::nonNull(Type::int())
            ],
            'resolve' => function ($root, $args) {
                if ($root['user_logged_in']->role == 'admin') {
                    $user = User::find($args['id']);
                    $user->delete();
                    return $user->toArray();
                }
                return null;
            }
        ],
    ]
]);
?>