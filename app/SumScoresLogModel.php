<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SumScoresLogModel extends Model
{
    protected $table = 'sum_scores_log';
    protected $primaryKey = 'ss_id';
    protected $keyType = 'varchar';
    protected $fillable = ['ss_id', 'c_id', 'u_id', 'ss_scores', 'created_at', 'updated_at'];
}
