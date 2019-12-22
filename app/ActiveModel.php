<?php

namespace App;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;

use DateTime;


class ActiveModel extends Model
{
    protected $table = 'active';
    protected $primaryKey = 'a_id';
    protected $keyType = 'varchar';
    protected $fillable = [
        'a_id',
        'u_id',
        'a_name',
        'a_note',
        'a_img',
        'a_begin',
        'a_end',
        'a_active',
        'created_at',
        'updated_at'
    ];

    /**
     * Lấy danh sách sự kiện theo yêu cầu YES
     * @param $key
     * @return array
     */
    public function index($key,$keyword){
        $data = [];
        switch ($key){
            case 'all':{
                $data = $this::leftjoin("users","users.id","=", "active.u_id")
                    ->leftjoin("profile", "profile.id","=","active.u_id")
                    ->where("active.a_active","<>",0);
                break;
            }

            case 'wait':{
                $data = $this::leftjoin("users","users.id","=", "active.u_id")
                    ->leftjoin("profile", "profile.id","=","active.u_id")
                    ->where("active.a_active",-1);
                break;
            }

            case 'coming':{
                $data = $this::leftjoin("users","users.id","=", "active.u_id")
                    ->leftjoin("profile", "profile.id","=","active.u_id")
                    ->where("active.a_active","<>",0)
                    ->whereRaw("`active`.`a_begin` > '".date("Y-m-d")."'");
                break;
            }

            case 'happen':{
                $data = $this::leftjoin("users","users.id","=", "active.u_id")
                    ->leftjoin("profile", "profile.id","=","active.u_id")
                    ->where("active.a_active","<>",0)
                    ->whereRaw("`active`.`a_begin` <= '".date("Y-m-d")."'")
                    ->whereRaw("`active`.`a_end` >= '".date("Y-m-d")."'");
                break;
            }

            case 'passed':{
                $data =$this::leftjoin("users","users.id","=", "active.u_id")
                    ->leftjoin("profile", "profile.id","=","active.u_id")
                    ->whereRaw("`active`.`a_end` < '".date("Y-m-d")."'")
                    ->where("active.a_active","<>",0);
                break;
            }

            case 'find':{
                $data =$this::leftjoin("users","users.id","=", "active.u_id")
                    ->leftjoin("profile", "profile.id","=","active.u_id")
                    ->where("active.a_active","<>",0)
                    ->where('active.a_name', 'like', '%' . $keyword . '%');
                break;
            }

            default:{
                break;
            }
        }
        $data = $data
            ->orderBy('active.a_name')
            ->select('active.*','profile.name','users.id', 'users.cusc_id')
            ->paginate(30);
        return $data;
    }

    /**
     * Thêm sự kiện YES
     * @param Request $request
     * @return bool
     */
    public function create(Request $request){
        $result = $this::insert([
            'a_id' => time(),
            'a_name' => $request->a_name,
            'a_number' => $request->a_number,
            'a_begin' => date_format(new DateTime($request->a_begin ),'Y-m-d'),
            'a_end' => date_format(new DateTime($request->a_end),'Y-m-d'),
            'u_id' => $request->u_id,
            'a_img' => 'not img',
            'a_note' => $request->a_note,
            'a_active' => -1
        ]);
        return $result;
    }

    /**
     * Sửa sự kiện YES
     * @param Request $request
     * @return bool
     */
    public function change(Request $request){
        $result = $this::where('a_id',$request->a_id)
            ->update([
                'a_name' => $request->a_name,
                'a_number' => $request->a_number,
                'a_begin' => date_format(new DateTime($request->a_begin ),'Y-m-d'),
                'a_end' => date_format(new DateTime($request->a_end),'Y-m-d'),
                'a_img' => 'not img',
                'a_note' => $request->a_note,
            ]);
        return $result;
    }

    /**
     * Ẩn sự kiện YES
     * @param $id
     * @return bool
     */
    public function hide($id){
        $result = $this::where('a_id',$id)->where('a_active','<>', 0);
        if($result->count()>0) {
            $result->update([
                'a_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục sự kiện YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('a_id',$id)->where('a_active', 0);
        if($result->count()>0){
            $result->update([
                'a_active' => -1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa vĩnh diện sự kiện YES
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            //Lấy danh sách vai trò của mục này
            $achievement = ActiveAchievementModel
                ::where('a_id', $id)
                ->select('aa_id')
                ->get();
            ActiveAchievementModel::where('a_id', $id)->delete();
            UsersHasActiveAchievementModel::whereIn('aa_id',$achievement)->delete();
            $this::where('a_id', $id)->delete();
            return true;
        }
        return false;
    }

    /***
     * Đếm số thành viên tham gia một sự kiện YES
     * @param $id
     * @return mixed
     */
    public function count($id){
        $countActive= $this
            ::join('active_achievement', 'active_achievement.a_id','active.a_id')
            ->join('users_has_active_achievement', 'users_has_active_achievement.aa_id','active_achievement.aa_id')
            ->where('active.a_id',$id)
            ->groupBy('users_has_active_achievement.u_id')
            ->select('users_has_active_achievement.u_id')
            ->get();
        return sizeof($countActive);
    }

    /**
     * Tìm một sự kiện theo id YES
     * Được gọi lại từ hàm lấy danh sách học viên tham gia sự kiện YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        $result =  $this::leftjoin('users','users.id','=', 'active.u_id')
            ->leftjoin('profile', 'profile.id','=','active.u_id')
            ->where('active.a_active','<>',0)
            ->where('active.a_id',$id)
            ->first();
        if(isset($result)){
            return $result;
        }
        else{
            return false;
        }
    }

    /**
     * Lấy danh sách sự kiện được duyệt YES
     * @param $id
     * @return mixed
     */
    public function approved($id){
        $result = $this::where('a_id',$id)->where('a_active', -1);
        if($result->count()>0){
            $this::where('a_id', $id)
            ->update([
                'a_active' => 1
            ]);
            return true;
        }
        return false;
    }
}
