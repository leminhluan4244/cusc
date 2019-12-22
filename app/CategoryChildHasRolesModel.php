<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CategoryChildHasRolesModel extends Model
{
    protected $table = 'category_child_has_roles';
    protected $primaryKey = 'ccr_id';
    protected $keyType = 'varchar';
    protected $fillable = ['ccr_id', 'cc_id', 'r_id', 'created_at', 'updated_at'];
}
