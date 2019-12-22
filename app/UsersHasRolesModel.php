<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UsersHasRolesModel extends Model
{
    protected $table = 'users_has_roles';
    protected $primaryKey = 'ur_id';
    protected $keyType = 'varchar';
    protected $fillable = ['ur_id', 'users_id', 'roles_r_id', 'created_at', 'updated_at'];
}
