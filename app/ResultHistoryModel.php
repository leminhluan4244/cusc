<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ResultHistoryModel extends Model
{
    protected $table = 'result_history';
    protected $primaryKey = 'rh_id';
    protected $keyType = 'varchar';
    protected $fillable = [
        'rh_id',
        'rp_id',
        'rp_scores_old',
        'rp_scores_new',
        'rp_note_old',
        'rp_note_new',
        'u_make',
        'u_change',
        'u_id',
        'cc_id',
        'ec_id',
        'rh_action',
        'created_at',
        'updated_at'
    ];
}
