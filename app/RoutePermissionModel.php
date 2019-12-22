<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class RoutePermissionModel extends Model
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

    /**
     * Danh sách các route được phép truy cập YES
     * @param $r_id
     * @return mixed
     */
    public function index($r_id){
        return $this
            ::join('route', 'route.ro_value','permission.pm_route')
            ->where('permission.r_id',$r_id)
            ->get();
    }

    /**
     * Thêm một mảng các route vào
     * @param Request $request
     * @return mixed
     */
    public function create(Request $request){
        foreach ($request->pm_route as $key => $value){
            $exists = PermissionModel::where('r_id',$request->r_id)
                ->where('pm_route', $value)->first();
            if(!isset($exists)){
                //Dò từ trong bảng danh sách route
                $route = DB::table('route')->where('ro_value', $value)->first();
                if(isset($route))
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

    /**
     * Loại bỏ một route
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::where('pm_id', $id)->first();
        if(isset($result)){
            $this::where('pm_id', $id)->delete();
            return true;
        }
        return false;
    }

    /**
     * Danh sách các route mà phân quyền chưa được truy cập YES
     */
    public  function getRouteList($id){
        //Lấy ra các route đã được truy cập
        $accessRoute =  $this
            ::where('r_id',$id)
            ->select('pm_route')
            ->get();
        return DB
            ::table('route')
            ->whereNotIn('ro_value', $accessRoute)
            ->orderBy('ro_name')
            ->get();
    }
}
