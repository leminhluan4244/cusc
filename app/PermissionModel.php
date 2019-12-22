<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class PermissionModel extends Model
{
    protected $table = 'permission';
    protected $primaryKey = 'id';
    protected $keyType = 'varchar';
    protected $fillable = ['pm_id', 'item','pm_route', 'r_id','created_at', 'updated_at'];

    public static function checkedRoute($r_id, $route){
        $checkedLog = self::where('r_id',$r_id)
            ->where('pm_route', $route)
            ->first();
        return $checkedLog;
    }

    public function index($r_id){
        return $this::where('r_id',$r_id)
            ->get();
    }

    public function create(Request $request){
        foreach ($request->pm_route as $key => $value){
            $exists = PermissionModel::where('r_id',$request->r_id)
                ->where('pm_route', $value)->first();
            if(!isset($exists)){
                $result = $this::insert([
                    'pm_id' => time()+$key,
                    'item' => $request->id,
                    'pm_route' => $value,
                    'r_id' => $request->r_id
                ]);
            }
        }
        return $result;
    }

    public function remove($id){
        $result = $this::find($id)->delete();
        return isset($result);
    }

    /**
     * Hàm cấp quyền mới YES
     */
    public function createNew(Request $request){
        foreach ($request->pm_route as $key => $value){
            $exists = PermissionModel::where('r_id',$request->r_id)
                ->where('pm_route', $value)->first();
            if(!isset($exists)){
                $result = $this::insert([
                    'pm_id' => time()+$key,
                    'item' => $request->item[$key],
                    'pm_route' => $value,
                    'r_id' => $request->r_id
                ]);
            }
        }
        return $result;
    }



}
