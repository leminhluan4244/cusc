<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class AssignmentModel extends Model
{
    protected $table = 'assignment';
    protected $primaryKey = 'as_id';
    protected $keyType = 'varchar';
    protected $fillable = ['as_id', 'u_id', 'cl_id', 'created_at', 'updated_at'];

    /**
     * Bản phân công các lớp thuộc một cán bộ YES
     * @param $id : ID cán bộ
     * @return array : Mảng các lớp
     */
    public function index($id){
        return $this
            ::join('class', 'assignment.cl_id','=','class.cl_id')
            ->join('majors','majors.m_id','=','class.m_id')
            ->join('school_year','school_year.sy_id','=','class.sy_id')
            ->join('users','users.id','=', 'class.u_manager_id')
            ->join('profile', 'profile.id','=','users.id')
            ->where('assignment.u_id',$id)
            ->where('class.cl_active', 1)
            ->orderBy('class.cl_code')
            ->select('class.*','profile.name', 'users.id','school_year.sy_name', 'school_year.sy_id')
            ->get();
    }

    /**
     * Danh sách các lớp không thuộc quản lý cán bộ YES
     * @param $id
     * @return mixed
     */
    public function non_member($id){
        $listClass = $this
            ::join('class', 'assignment.cl_id','=','class.cl_id')
            ->where('assignment.u_id',$id)
            ->where('class.cl_active', 1)
            ->select('class.cl_id')
            ->get();
        return $list = ClassModel
            ::join('majors','majors.m_id','=','class.m_id')
            ->join('school_year','school_year.sy_id','=','class.sy_id')
            ->join('users','users.id','=', 'class.u_manager_id')
            ->join('profile', 'profile.id','=','users.id')
            ->where('class.cl_active',1)
            ->whereNotIn('class.cl_id', $listClass)
            ->orderBy('class.cl_code')
            ->select('class.*','profile.name', 'users.id','school_year.sy_name', 'school_year.sy_id')
            ->get();
    }

    /**
     * Thêm danh sách lớp vào danh sách đươc chấm của cán bộ YES
     * @param Request $request
     * @return bool
     */
    public function add_member(Request $request){
        if(isset($request->cl_id)){
            foreach ($request->cl_id as $key => $val){
                $this::insert([
                    'as_id' => time()+$key,
                    'cl_id' => $val,
                    'u_id' => $request->u_id
                ]);
            }
            return true;
        }
        else{
            return false;
        }

    }

    /**
     * Loại bỏ danh sách phân công cho một cán bộ YES
     * @param Request $request
     * @return bool
     */
    public function remove_member(Request $request){
        if(isset($request->cl_id)){
            foreach ($request->cl_id as $key => $val){
                $this::where('cl_id',$val)
                    ->where('u_id',$request->u_id)
                    ->delete();
            }
            return true;
        }
        else{
            return false;
        }

    }




    //Truyền vào user id lấy ra danh sách các lớp được chấm điểm
    public function list_class(){
        return $this::join('class','class.cl_id','assignment.cl_id')
            ->join('majors','majors.m_id','=','class.m_id')
            ->join('school_year','school_year.sy_id','=','class.sy_id')
            ->join('users','users.id','=', 'class.u_manager_id')
            ->join('profile', 'profile.id','=','users.id')
            ->where('class.cl_active',1)
            ->where('assignment.u_id', Auth::user()->id)
            ->get();
    }

    public function result($id_student){
        //Lấy các mục điểm
        $result = CategoryModel::where('category.c_active',1)
            ->orderBy('category.c_item', 'ASC')
            ->get();
        //Lấy thông tin học viên
        $user = UsersModel::leftjoin('profile', 'profile.id','=','users.id')
            ->where('users.id',$id_student)
            ->select('users.*','profile.name','profile.birthday','profile.address','profile.gender')
            ->first();
        if(sizeof($result)>0){
            $sum_category = 0;
            foreach ($result as $key => $value){
                $temp_scores = 0;
                $value['child'] = $this->child_of_result($value->c_id,$id_student);
                //Điểm mục lớn nhất
                if(sizeof($value['child']) !=0){
                    if($value->c_type==1) {
                        foreach ($value['child'] as $k => $val) {
                            $temp_scores = $temp_scores + $val['result_lsum'];
                        }
                    }
                    else if($value->c_type==0){
                        foreach ($value['child'] as $k => $val) {
                            $temp_scores = $val['result_lsum'] > $temp_scores ? $val['result_lsum'] : $temp_scores;
                        }
                    }
                }
                $value['scores'] = $value->c_max_scores > $temp_scores ? $temp_scores : $value->c_max_scores ;
                $sum_category = $sum_category + $value['scores'];
            }
        }
        //Lưu điểm mới tính vào trong điểm sinh viên
        UsersModel::where('users.id',$id_student)
            ->update([
                'scores' => $sum_category
            ]);
        return [
            'category' => $result,
            'user' => $user,
        ];
    }

    public function child_of_result($id,$id_student){
        $child = CategoryChildModel::
        where('category_child.cc_active',1)
            ->where('category_child.c_id',$id)
            ->orderBy('category_child.cc_item', 'ASC')
            ->get();

        if(sizeof($child)>0){
            foreach ($child as $key => $value){
                //Lấy ra loại chu kỳ cho mục con này
                $value['cycle'] = CategoryChildHasCycleModel
                    ::join('cycle','cycle.cy_id','=','category_child_has_cycle.cy_id')
                    ->where('category_child_has_cycle.cc_id',$value->cc_id)
                    ->first();
                //Lấy ra phân quyền được phép chấm
                $value['roles'] = CategoryChildHasRolesModel
                    ::join('roles','roles.r_id','=','category_child_has_roles.r_id')
                    ->where('category_child_has_roles.cc_id',$value->cc_id)
                    ->get();

                //Lấy ra xem có lựa chọn mục này từ bản đăng ký sinh viên không
                $value['select'] = RegistrationModel::where('cc_id',$value->cc_id)
                    ->where('u_id', $id_student)
                    ->first();

                //Lấy ra điểm hiện tại
                $value['result'] = ResultPointModel::join('entity_cycle','entity_cycle.ec_id','result_point.ec_id')
                    ->where('u_id', $id_student)
                    ->where('cc_id',$value->cc_id)
                    ->select('result_point.*','entity_cycle.ec_name')
                    ->get();
                //Lấy ra điểm ở hiện tại
                $value['result_psum'] = ResultPointModel::join('entity_cycle','entity_cycle.ec_id','result_point.ec_id')
                    ->where('u_id', $id_student)
                    ->where('cc_id',$value->cc_id)
                    ->sum('result_point.rp_scores');
                $value['result_psum'] = $value['result_psum'] > $value->cc_max_scores_cycle ? $value->cc_max_scores_cycle : $value['result_psum'];
                //Lấy ra điểm trong lịch sử
                $value['result_log'] = ResultLogModel::join('entity_cycle','entity_cycle.ec_id','result_log.ec_id')
                    ->where('u_id', $id_student)
                    ->where('cc_id',$value->cc_id)
                    ->select('result_log.*','entity_cycle.ec_name')
                    ->get();
                //Lấy ra điểm trong lịch sử
                $value['result_lsum'] = ResultLogModel::join('entity_cycle','entity_cycle.ec_id','result_log.ec_id')
                    ->where('u_id', $id_student)
                    ->where('cc_id',$value->cc_id)
                    ->select('result_log.*','entity_cycle.ec_name')
                    ->sum('result_log.rl_scores');
                //Lấy ra danh sách gợi ý cộng điểm
                //Lấy ra cái entity mặc định
                $default = DefaultEntityModel
                    ::join('entity_cycle','entity_cycle.ec_id','default_entity.ec_id')
                    ->join('category_child_has_cycle','category_child_has_cycle.cy_id','default_entity.cy_id')
                    ->where('category_child_has_cycle.cy_id',$value['cycle']->cy_id)
                    ->where('category_child_has_cycle.cc_id',$value->cc_id)
                    ->first();
                $value['entity'] = $default;
                if(isset($default))
                    $value['achievement'] = ActiveAchievementModel
                        ::join('active','active.a_id', 'active_achievement.a_id')
                        ->join('users_has_active_achievement','users_has_active_achievement.aa_id', 'active_achievement.aa_id')
                        ->where('users_has_active_achievement.u_id',$id_student)
                        ->where('active_achievement.cc_id',$value->cc_id)
                        ->whereRaw("`active`.`a_begin` <= '".$default->ec_end."'")
                        ->whereRaw("`active`.`a_begin` >= '".$default->ec_begin."'")
                        ->get();
                else{
                    $value['achievement'] = [];
                }
            }
        }
        return $child;
    }

}
