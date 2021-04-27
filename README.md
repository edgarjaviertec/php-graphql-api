# php-graphql-api

API GraphQL en PHP protegida con JWT.

## Requerimientos:

* MAMP, WAMP o LAMP
* phpMyAdmin
* Altair GraphQL Client
* Postman

## Instalación

### 1.- Clonar el proyecto

```bash
git clone https://github.com/edgarjaviertec/php-graphql-api.git
```

### 2.- Instalar las dependencias

```bash
composer install
```

### 3.- Ejecutar el proyecto en MAMP, WAMP o LAMP

### 4.- Inportar los archivos SQL en phpMyAdmin

* table_structure.sql
* table_content.sql

## Uso

### 1.- Obtener token

Para obtener nuestro token se debe utilizar estos credenciales

#### Credenciales

| ID | Nombre de usuario | Contraseña | 
|----|-------------------|------------|
| 1  | admin             |password123    |
| 2  | user1              |password123    |

#### Autenticación

```bash
curl -F "username=admin" -F "password=password123" http://localhost/login
```

```json
{
  "success": true,
  "payload": "Token generated successfully",
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInJvbGUiOiJhZG1pbiIsImV4cCI6MTYxOTY0OTE2N30.jxCDLSibKERniQUu7kkaM7qMUJIyC-CGo8UBfULJph8"
}
```

### 2.- Consultar en GraphQL

Para hacer consultas en GraphQL es importante incluir el token en la cabecera:

```bash
curl \
-X POST \
-H "Content-Type: application/json" \
-H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInJvbGUiOiJhZG1pbiIsImV4cCI6MTYxOTY0OTE2N30.jxCDLSibKERniQUu7kkaM7qMUJIyC-CGo8UBfULJph8" \
--data '{ "query": "{ users { id, nombre_usuario, rol } }" }' \
http://localhost/graphql
```

```json
{
    "data": {
        "users": [
            {
                "id": 1,
                "nombre_usuario": "admin",
                "rol": "admin"
            },
            {
                "id": 2,
                "nombre_usuario": "user1",
                "rol": "user"
            }
        ]
    }
}
```

