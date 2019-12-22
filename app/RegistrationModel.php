<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RegistrationModel extends Model
{
    protected $table = 'registration';
    protected $primaryKey = 're_id';
    protected $keyType = 'varchar';
    protected $fillable = ['re_id', 'u_id', 'c_id','cc_id', 're_active', 'created_at', 'updated_at'];

//    public function index(){
//        return ClassModel::join('majors','majors.m_id','=','class.m_id')
//            ->join('school_year','school_year.sy_id','=','class.sy_id')
//            ->join('users','users.id','=', 'class.u_manager_id')
//            ->join('profile', 'profile.id','=','users.id')
//            ->where('class.cl_active',1)
//            ->get();
//    }

    public function registration($id_student){
        $result = CategoryModel::where('category.c_active',1)
            ->orderBy('category.c_item', 'ASC')
            ->get();
        $user = UsersModel::join('profile', 'profile.id','=','users.id')
            ->where('users.id',$id_student)
            ->where('users.active',1)
            ->select('users.*','profile.name','profile.birthday','profile.address','profile.gender')
            ->first();
        if(sizeof($result)>0){
            foreach ($result as $key => $value){
                $value['child'] = $this->child_of_registration($value->c_id,$id_student);
            }
        }
        return [
            'category' => $result,
            'user' => $user
        ];

    }

    /**
     * Hàm con
     * @param $id
     * @param $id_student
     * @return mixed
     */
    public function child_of_registration($id,$id_student){
        $child = CategoryChildModel::
        where('category_child.cc_active',1)
            ->where('category_child.c_id',$id)
            ->orderBy('category_child.cc_item', 'ASC')
            ->get();

        if(sizeof($child)>0){
            foreach ($child as $key => $value){
                $value['cycle'] = CategoryChildHasCycleModel
                    ::join('cycle','cycle.cy_id','=','category_child_has_cycle.cy_id')
                    ->where('category_child_has_cycle.cc_id',$value->cc_id)
                    ->where('cycle.cy_active',1)
                    ->get();
                $value['roles'] = CategoryChildHasRolesModel
                    ::join('roles','roles.r_id','=','category_child_has_roles.r_id')
                    ->where('category_child_has_roles.cc_id',$value->cc_id)
                    ->where('roles.r_active',1)
                    ->get();
                $select = $this::where('cc_id',$value->cc_id)
                    ->where('u_id', $id_student)
                    ->first();
                $value['select'] = $select;
            }
        }
        return $child;
    }

    /**
     * Thay đổi đăng ký
     * @param Request $request
     * @return bool
     */
    public function change(Request $request){
        try{
            $listCategory = (new CategoryModel())->list();
            foreach ($listCategory as $key => $value){
                $category =  $value->c_id;
                RegistrationModel::where('c_id',$category)->delete();
                if($value->c_type==0){
                    if(!empty($request[$category]>0)) {
                        RegistrationModel::insert([
                            're_id' => time()+rand(1,50000),
                            'u_id' => $request->u_id,
                            'c_id' => $category,
                            'cc_id' => $request[$category][0],
                            're_active' => 1
                        ]);
                    }
                }
                else if($value->c_type==1){
                    if(!empty($request[$category])>0) {
                        foreach ($request[$category] as $k => $val) {
                            RegistrationModel::insert([
                                're_id' => time()+rand(50001,100000),
                                'u_id' => $request->u_id,
                                'c_id' => $category,
                                'cc_id' => $val,
                                're_active' => 1
                            ]);
                        }
                    }
                }
            }
            return true;
        }
        catch(Exception $e) {
            return false;
        }

    }

    /**
     * Lấy ra một bảng đăng ký hoàn chỉnh của một tài khoản ??
     * @param Request $request
     * @return mixed
     */
    public function search_full_child(Request $request){
        //Lấy danh sách con của một mục cha
        $child = CategoryChildModel::
        where('category_child.cc_active',1)
            ->where('category_child.c_id',$request->c_id)
            ->orderBy('category_child.cc_item', 'ASC')
            ->get();
        //Chạy vòng foreach để lấy ra các chu kỳ và phân quyền được tác động
        if(sizeof($child)>0){
            foreach ($child as $key => $value){
                $value['cycle'] = CategoryChildHasCycleModel
                    ::join('cycle','cycle.cy_id','=','category_child_has_cycle.cy_id')
                    ->where('category_child_has_cycle.cc_id',$value->cc_id)
                    ->get();
                $value['roles'] = CategoryChildHasRolesModel
                    ::join('roles','roles.r_id','=','category_child_has_roles.r_id')
                    ->where('category_child_has_roles.cc_id',$value->cc_id)
                    ->get();
                $value['select'] = RegistrationModel::where('re_active',1)
                    ->where('cc_id',$value->cc_id)
                    ->where('u_id',$request->u_id)
                    ->count();
            }
        }
        return $child;
    }

}
