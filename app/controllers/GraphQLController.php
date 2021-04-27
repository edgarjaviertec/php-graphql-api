<?php

namespace App\Controllers;

use GraphQL\GraphQL;
use GraphQL\Type\Schema;

class GraphQLController extends \SecureRoute
{

    public function index()
    {
        require_once(__DIR__ . '/../graphql/queries.php');
        require_once(__DIR__ . '/../graphql/mutations.php');
        try {
            $schema = new Schema([
                'query' => $queries,
                'mutation' => $mutations
            ]);

            $context = [
                'user_logged_in' => $this->account
            ];

            $rawInput = file_get_contents('php://input');
            $input = json_decode($rawInput, true);
            $query = $input['query'];
            $output = GraphQL::executeQuery($schema, $query, $context)->toArray();
            echo json_encode($output);
            die();
        } catch (\Exception $e) {
            $output = [
                'errors' => [
                    'message' => $e->getMessage()
                ]
            ];
            $this->f3->status(500);
            echo json_encode($output);
            die();
        }
    }
}

?>