<?php

use App\Models\Setting;
use App\Models\User;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

require_once(__DIR__ . '/types.php');
$queries = new ObjectType([
    'name' => 'Query',
    'fields' => [
        'user' => [
            'type' => $userType,
            'args' => [
                'id' => Type::nonNull(Type::int())
            ],
            'resolve' => function ($root, $args) {
                $user = User::find($args['id'])->toArray();
                return $user;
            }
        ],
        'users' => [
            'type' => Type::listOf($userType),
            'resolve' => function () {
                $users = User::get()->toArray();
                return $users;
            }
        ],
        'setting' => [
            'type' => $settingOptionType,
            'args' => [
                'option' => Type::nonNull(Type::string())
            ],
            'resolve' => function ($root, $args) {
                if ($root['user_logged_in']->role == 'admin') {
                    $setting_option = Setting::firstWhere('opcion', $args['option'])->toArray();
                    return $setting_option;
                }
                return null;
            }
        ],
        'settings' => [
            'type' => Type::listOf($settingOptionType),
            'resolve' => function ($root, $args) {
                if ($root['user_logged_in']->role == 'admin') {
                    $customers = Setting::get()->toArray();
                    return $customers;
                }
                return null;
            }
        ]
    ]
]);
?>