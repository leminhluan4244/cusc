<?php

namespace App;

use App\Http\Controllers\ToolCtrl;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class ClassModel extends Model
{
    protected $table = 'class';
    protected $primaryKey = 'cl_id';
    protected $keyType = 'varchar';
    protected $fillable = [
        'cl_id',
        'cl_code',
        'cl_name',
        'u_manager_id',
        'sy_id','m_id',
        'cl_active',
        'created_at',
        'updated_at'
    ];

    /**
     * Lấy danh sách các lớp YES
     * @return mixed
     */
    public function index(){
        //Lấy dữ liệu đồng thời bỏ qua các mục ẩn
        return $this::join('majors','majors.m_id','=','class.m_id')
            ->join('school_year','school_year.sy_id','=','class.sy_id')
            ->join('users','users.id','=', 'class.u_manager_id')
            ->join('profile', 'profile.id','=','users.id')
            ->where('class.cl_active',1)
            ->where('users.active',1)
            ->where('school_year.sy_active',1)
            ->where('majors.m_active',1)
            ->orderBy('class.cl_code', 'DESC')
            ->get();
    }

    /**
     * Danh sách học sinh trong lớp này YES
     * @param $id
     * @return mixed
     */
    public function student($id){
        $list = $this::join('majors','majors.m_id','=','class.m_id')
            ->join('school_year','school_year.sy_id','=','class.sy_id')
            ->join('users','users.id','=', 'class.u_manager_id')
            ->join('profile', 'profile.id','=','users.id')
            ->where('class.cl_active',1)
            ->where('users.active',1)
            ->where('school_year.sy_active',1)
            ->where('majors.m_active',1)
            ->where('class.cl_id', $id)
            ->first();
            $list['users'] =
                UsersModel::join('profile', 'profile.id','=','users.id')
                    ->leftjoin('users_has_class','users_has_class.u_id','=','users.id')
                    ->where('users.active',1)
                    ->where('users_has_class.cl_id',$id)
                    ->orderBy('users.id', 'DESC')
                    ->get();
        return $list;
    }

    /**
     * Danh sách học viên chưa là thành viên trong lớp YES
     * @param $id
     * @return mixed
     */
    public function exclude($id){
        $list = $this::join('majors','majors.m_id','=','class.m_id')
            ->join('school_year','school_year.sy_id','=','class.sy_id')
            ->join('users','users.id','=', 'class.u_manager_id')
            ->join('profile', 'profile.id','=','users.id')
            ->where('class.cl_active',1)
            ->where('users.active',1)
            ->where('school_year.sy_active',1)
            ->where('majors.m_active',1)
            ->where('class.cl_id', $id)
            ->first();
        $list['users'] =
            UsersModel::join('profile', 'profile.id','=','users.id')
            ->join('users_has_roles','users_has_roles.u_id', 'users.id')
            ->join('roles', 'roles.r_id', 'users_has_roles.r_id')
            ->where('users_has_roles.r_id','1b83df7a91f51b3d32cf6bda5b0fd23f')
            ->where('users.active',1)
            ->whereNotIn('users.id', UsersHasClassModel::where('cl_id',$id)->select('u_id as id')->pluck('id'))
            ->orderBy('users.id', 'DESC')
            ->paginate(30);
        return $list;
    }

    /**
     * Thêm một lớp YES
     */
    public function create(Request $request){
        $result = $this::insert([
            'cl_id' => time(),
            'cl_code' => $request->cl_code,
            'cl_name' => $request->cl_name,
            'u_manager_id' => $request->u_manager_id,
            'sy_id' => $request->sy_id,
            'm_id' => $request->m_id,
            'cl_active' => 1
        ]);
        return $result;
    }

    /**
     * Sửa đổi thông tin lớp YES
     * @param Request $request
     * @return mixed
     */
    public function change(Request $request){
        $result = $this::where('cl_id',$request->cl_id)
            ->where('cl_active',1)
            ->update([
                'cl_code' => $request->cl_code,
                'cl_name' => $request->cl_name,
                'u_manager_id' => $request->u_manager_id,
                'sy_id' => $request->sy_id,
                'm_id' => $request->m_id
            ]);
        return $result;
    }

    /**
     * Ẩn YES
     * @param $id
     * @return bool
     */
    public function hide($id){
        $result = $this::where('cl_id',$id)->where('cl_active', 1);
        if($result->count()>0) {
            $result->update([
                'cl_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục từ trạng thái ẩn YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('cl_id',$id)->where('cl_active', 0);
        if($result->count()>0){
            $result->update([
                'cl_active' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa vĩnh diễn YES
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            ClassModel::where('cl_id', $id)->delete();
            AssignmentModel::where('cl_id', $id)->delete();
            UsersHasClassModel::where('cl_id', $id)->delete();
            return true;
        }
        return false;
    }

    /**
     * Thêm học sinh vào lớp YES
     * @param Request $request
     * @return array
     */
    public function add_student(Request $request){
        //Tạo mảng chứa lỗi
        $isset = 0 ;
        $notStudent = 0;
        if(isset($request->list_id))
            foreach ($request->list_id as $key => $value){
                //Kiểm tra xem có không
                $findstudent = UsersHasClassModel::where('u_id',$value)
                    ->where('cl_id',$request->cl_id)
                    ->first();
                if(!isset($findstudent)){
                    //Xác thực xem có phải học viên không
                    $isStudent = UsersHasRolesModel
                    ::where('u_id', $value)
                    ->where('r_id', '1b83df7a91f51b3d32cf6bda5b0fd23f')
                    ->first();
                    if(isset($isStudent)){
                        UsersHasClassModel::insert([
                            'uc_id' => time()+$key,
                            'cl_id' => $request->cl_id,
                            'u_id' => $value
                        ]);
                    }
                    else{
                        $notStudent++;
                    }
                }
                else{
                    $isset++;
                }
            }
        return [
            'isset' => $isset,
            'notStudent' => $notStudent
        ];
    }

    /**
     * Xóa hết các user thuộc lớp này YES
     * @param $id
     * @return mixed
     */
    public function remove_all($id){
        $result = UsersHasClassModel::where('cl_id',$id)->get();
        if(isset($result)){
            UsersHasClassModel::where('cl_id',$id)->delete();
            return true;
        }
        return false;
    }

    /**
     * Xóa 1 users thuộc lớp này YES
     * @param $id_user
     * @param $id_class
     * @return bool
     */
    public function remove_one($id_user,$id_class){
        $result = UsersHasClassModel::where('u_id',$id_user)->where('cl_id',$id_class)->get();
        if(isset($result)){
            UsersHasClassModel::where('u_id',$id_user)->where('cl_id',$id_class)->delete();
            return true;
        }
        return false;
    }

    /**
     * Tìm kiếm một lớp YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        return $this::join('majors','majors.m_id','=','class.m_id')
            ->join('school_year','school_year.sy_id','=','class.sy_id')
            ->join('users','users.id','=', 'class.u_manager_id')
            ->join('profile', 'profile.id','=','users.id')
            ->where('class.cl_active',1)
            ->where('class.cl_id',$id)
            ->first();
    }


    public function count(){
        return $this::where('r_active',1)->count();
    }


}
