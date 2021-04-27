<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $table = "configuracion";
    protected $fillable = [
        'opcion', 'valor'
    ];
    const DELETED_AT = 'eliminado_en';
    const CREATED_AT = 'creado_en';
    const UPDATED_AT = 'actualizado_en';
}
?>