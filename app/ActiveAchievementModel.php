<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class ActiveAchievementModel extends Model
{
    protected $table = 'active_achievement';
    protected $primaryKey = 'aa_id';
    protected $keyType = 'varchar';
    protected $fillable = ['aa_id', 'a_id','cc_id', 'c_id', 'aa_name', 'aa_scores', 'aa_active', 'created_at', 'updated_at'];


    /**
     * Lấy danh sách học viên tham gia sự kiện gôm nhóm theo phân công YES
     * @param $id
     * @return array
     */
    public function index($id){
        $achievement = $this::where('a_id',$id)
            ->where('aa_active',1)
            ->get();
        $user = [];
        if(sizeof($achievement))
            foreach ($achievement as $value){
            $temp_array = $this
                ::leftjoin('users_has_active_achievement','users_has_active_achievement.aa_id','=','active_achievement.aa_id')
                ->leftjoin('users','users_has_active_achievement.u_id','=','users.id')
                ->leftjoin('profile','users_has_active_achievement.u_id','=','profile.id')
                ->where('active_achievement.aa_active',1)
                ->where('active_achievement.aa_id',$value->aa_id)
                ->where('users.active',1)
                ->get();
            $user = array_merge($user,$temp_array->toArray());
        }
        $active = ActiveModel
            ::join('users','users.id','=', 'active.u_id')
            ->join('profile', 'profile.id','=','active.u_id')
            ->where('active.a_active','<>',0)
            ->where('active.a_id',$id)
            ->first();
        return [
            'active' => $active,
            'achievement' => $achievement,
            'users' => $user
        ];
    }

    /**
     * Thêm mới một vai trò YES
     * @param Request $request
     * @return bool
     */
    public function create(Request $request){
        $result = $this::insert([
            'aa_id' => time(),
            'a_id' => $request->a_id,
            'c_id' => $request->c_id,
            'cc_id' => $request->cc_id,
            'aa_name' => $request->aa_name,
            'aa_scores' => $request->aa_scores,
            'aa_active' => 1
        ]);
        return $result;
    }

    /**
     * Chỉnh sửa vai trò YES
     * @param Request $request
     * @return mixed
     */
    public function change(Request $request){
        $result = $this::where('aa_id',$request->aa_id)
            ->update([
                'a_id' => $request->a_id,
                'c_id' => $request->c_id,
                'cc_id' => $request->cc_id,
                'aa_name' => $request->aa_name,
                'aa_scores' => $request->aa_scores,
            ]);
        return $result;
    }

    /**
     * Ẩn một vai trò YES
     * @param $id
     * @return bool
     */
    public function hide($id){
        $result = $this::where('aa_id',$id)->where('aa_active', 1);
        if($result->count()>0) {
            $result->update([
                'aa_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục một vai trò YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('aa_id',$id)->where('aa_active', 0);
        if($result->count()>0){
            $result->update([
                'aa_active' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa vĩnh viễn một vai trò YES
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            ActiveAchievementModel::where('aa_id', $id)->delete();
            UsersHasActiveAchievementModel::where('aa_id', $id)->delete();
            return true;
        }
        return false;
    }

    /**
     * Tìm kiếm một vai trò YES
     */
    public function search($id){
        return $this::join('active','active_achievement.a_id','=', 'active.a_id')
            ->leftjoin('category', 'category.c_id','=', 'active_achievement.c_id')
            ->leftjoin('category_child', 'category_child.cc_id','=','active_achievement.cc_id')
            ->where('active_achievement.aa_active','<>',0)
            ->where('active_achievement.aa_id',$id)
            ->first();
    }

    /***
     * Lấy danh sách theo id của hoạt động YES
     * @param $id
     * @return array
     */
    public function users($id){
        $achievement = $this::where('a_id',$id)
            ->where('aa_active',1)
            ->get();
        $users = $this
            ::join('users_has_active_achievement','users_has_active_achievement.aa_id','=','active_achievement.aa_id')
            ->join('users','users_has_active_achievement.u_id','=','users.id')
            ->join('profile','users_has_active_achievement.u_id','=','profile.id')
            ->join('active','active.a_id', 'active_achievement.a_id')
            ->where('active_achievement.aa_active',1)
            ->where('active.a_active','<>',0)
            ->where('users.active',1)
            ->select(
                'users.*',
                'profile.name','profile.address','profile.gender','profile.birthday',
                'active_achievement.aa_name'
            )
            ->distinct()
            ->get();
        $active = ActiveModel
            ::join('users','users.id','=', 'active.u_id')
            ->join('profile', 'profile.id','=','active.u_id')
            ->where('active.a_active','<>',0)
            ->where('active.a_id',$id)
            ->first();
        $data = [
            'users' => $users,
            'active' => $active,
            'achievement' => $achievement,
        ];
        return $data;
    }

    /**
     * Danh sách thành viên của một vai trò YES
     * @param $id
     * @return mixed
     */
    public function list_member($id){
        return $list = UsersModel
            ::join('users_has_roles','users_has_roles.u_id','users.id')
            ->join('profile', 'profile.id', 'users.id')
            ->join('users_has_active_achievement','users.id','=','users_has_active_achievement.u_id')
            ->join('active_achievement','users_has_active_achievement.aa_id', 'active_achievement.aa_id')
            ->join('active','active_achievement.a_id', 'active.a_id')
            ->leftjoin('category', 'category.c_id','=', 'active_achievement.c_id')
            ->leftjoin('category_child', 'category_child.cc_id','=','active_achievement.cc_id')
            ->where('users_has_roles.r_id','1b83df7a91f51b3d32cf6bda5b0fd23f')
            ->where('users.active',1)
            ->where('active_achievement.aa_active',1)
            ->where('active.a_active','<>',0)
            ->where('active_achievement.aa_id',$id)
            ->get();
    }

    /**
     * Danh sách không phải thành viên của một vai trò YES
     * @param $id
     * @return mixed
     */
    public function non_member($id){
        $list = UsersModel
            ::join('users_has_roles','users_has_roles.u_id','users.id')
            ->join('users_has_active_achievement','users.id','=','users_has_active_achievement.u_id')
            ->join('active_achievement','users_has_active_achievement.aa_id', 'active_achievement.aa_id')
            ->where('users_has_active_achievement.aa_id',$id)
            ->select('users.id')
            ->get();
        $users = [];
        foreach ($list as $value){
            array_push($users,$value['id']);
        }

        return $list = UsersModel
            ::join('users_has_roles','users_has_roles.u_id','users.id')
            ->leftjoin('profile', 'profile.id', 'users.id')
            ->where('users_has_roles.r_id','1b83df7a91f51b3d32cf6bda5b0fd23f')
            ->where('users.active',1)
            ->whereNotIn('users.id', $users)
            ->select('users.*',
                'profile.name','profile.address','profile.gender','profile.birthday'
            )
            ->get();
    }

    /**
     * Thêm thành viên vào một vai trò YES
     * @param Request $request
     * @return array
     */
    public function add_member(Request $request){
        /**
         * Mảng chứa các tài khoản không hợp lệ
         */
        $err = [];
        foreach ($request->user_id as $key => $val){
            /**
             * Kiểm tra xem có thêm từ trước hay chưa
             */
            $isHave = UsersHasActiveAchievementModel
                ::where('aa_id',$request->aa_id)
                ->where('u_id',$val)
                ->first();
            /**
             * Kiểm tra có phải học viên hay không
             */
            $isStudent = UsersHasRolesModel
                ::where('r_id','1b83df7a91f51b3d32cf6bda5b0fd23f')
                ->where('u_id',$val)
                ->first();
            if(isset($isHave) || !$isStudent){
                array_push($err,$val);
            }
            else{
                UsersHasActiveAchievementModel::insert([
                    'uaa_id' => time()+$key,
                    'u_id' => $val,
                    'aa_id' => $request->aa_id
                ]);
            }
        }
        /**
         * Trả về mảng lỗi
         */
        return $err;
    }

    /**
     * Loại bỏ danh sách thành viên của một vai trò YES
     * @param Request $request
     * @return bool
     */
    public function remove_member(Request $request){
        foreach ($request->user_id as $key => $val){
            UsersHasActiveAchievementModel::where('aa_id', $request->aa_id)
                ->where('u_id',$val)
                ->delete();
        }
        return true;
    }

    /**
     *     //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
     */

    /**
     * Đếm số lượng các vai trò NO
     * @return mixed
     */
    public function count(){
        return $this::where('aa_active',1)->count();
    }






}
