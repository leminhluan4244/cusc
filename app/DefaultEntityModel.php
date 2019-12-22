<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DefaultEntityModel extends Model
{
    protected $table = 'default_entity';
    protected $primaryKey = 'd_id';
    protected $keyType = 'varchar';
    protected $fillable = ['d_id', 'ec_id', 'cy_id', 'created_at', 'updated_at'];
    public function set_default($id){
        //Lấy ra chu kỳ cha
        $find = EntityCycleModel
            ::join('cycle','cycle.cy_id','=','entity_cycle.cy_id')
            ->where('entity_cycle.ec_id',$id)
            ->first();
        //Đặt mặc định
        if(isset($find)){
            $this->where('cy_id',$find->cy_id)->delete();
        }
        $this->insert([
            'd_id' => time(),
            'ec_id' =>$id,
            'cy_id' => $find->cy_id
        ]);

    }

}
