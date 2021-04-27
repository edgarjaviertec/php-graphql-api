<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = "usuarios";
    protected $fillable = [
        'nombre_usuario', 'correo_electronico', 'clave', 'clave', 'rol', 'avatar'
    ];
    protected $hidden = [
        'clave'
    ];
    const DELETED_AT = 'eliminado_en';
    const CREATED_AT = 'creado_en';
    const UPDATED_AT = 'actualizado_en';
}

?>