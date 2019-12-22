<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UsersHasActiveAchievementModel extends Model
{
    protected $table = 'users_has_active_achievement';
    protected $primaryKey = 'uaa_id';
    protected $keyType = 'varchar';
    protected $fillable = ['uaa_id', 'u_id', 'aa_id', 'created_at', 'updated_at'];
}
