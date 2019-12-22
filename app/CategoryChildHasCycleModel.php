<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CategoryChildHasCycleModel extends Model
{
    protected $table = 'category_child_has_cycle';
    protected $primaryKey = 'ccc_id';
    protected $keyType = 'varchar';
    protected $fillable = ['ccc_id', 'cc_id', 'cy_id', 'created_at', 'updated_at'];
}
