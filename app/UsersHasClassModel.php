<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UsersHasClassModel extends Model
{
    protected $table = 'users_has_class';
    protected $primaryKey = 'uc_id';
    protected $keyType = 'varchar';
    protected $fillable = ['uc_id', 'u_id', 'cl_id', 'created_at', 'updated_at'];
}
