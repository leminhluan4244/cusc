<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ResultLogModel extends Model
{
    protected $table = 'result_log';
    protected $primaryKey = 'rl_id';
    protected $keyType = 'varchar';
    protected $fillable = ['rl_id', 'rl_scores', 'rl_note', 'u_id', 'cc_id', 'c_id', 'ec_id', 'created_at', 'updated_at'];
}
