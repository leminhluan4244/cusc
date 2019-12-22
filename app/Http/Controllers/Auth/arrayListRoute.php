<?php
/**
 * Created by PhpStorm.
 * User: lebui
 * Date: 12/10/2018
 * Time: 12:20 AM
 */

namespace App\Http\Controllers\Auth;
use App\AssignmentModel;
use App\CategoryChildHasRolesModel;
use App\UsersModel;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

class arrayListRoute
{
    public static function searchRoute($roles, $route){
        //Kiểm tra sự tồn tại của route trong danh sách các route
        $checkRoute = array_key_exists($route,self::$branchRoles);
        if($checkRoute){
            //Nếu tồn tại thì kiểm tra phân quyền
            $check = strlen(strstr(self::$branchRoles[$route], $roles));
                return ($check > 0);
        }
        return false;
    }
    public static function classifyRoles($id){
        $accountCode = $id;
        $roles = UsersModel
            ::join('users_has_roles','users_has_roles.u_id','users.id')
            ->where('users.id',$accountCode)
            ->where('users.active',1)
            ->first();
        if(isset($roles))
            switch ($roles->r_id){
                case '08cd66cb6b012217ed32cb8662a2a1d9':{
                    return 'admin';
                }
                case '0826eaf8086b01749bf7ff65742a200c':{
                    return 'teacher';
                }
                case '1b83df7a91f51b3d32cf6bda5b0fd23f':{
                    return  'student';
                }
                case 'b2cba2a7a5499bd67320ba3d4046dc2e':{
                    return 'wait';
                }
                default :{
                    return 'employee';
                }

            }
    }

    public static function getIdRole($user_id){
        $accountCode = $user_id;
        $roles = UsersModel
            ::join('users_has_roles','users_has_roles.u_id','users.id')
            ->where('users.id',$accountCode)
            ->where('users.active',1)
            ->first();
        if(isset($roles)) return $roles->r_id;
        else return 'error_roles';
    }

    public static function checkRoles($user_id){
        $role = self::classifyRoles($user_id);
        return self::searchRoute($role,Route::getFacadeRoot()->current()->uri());

    }

    //Kiểm tra xem id người đăng nhập có phải trong mảng phân quyền hay không
    public static function checkEmployee($arrayRoles, $user_id){
        if(sizeof($arrayRoles) != 0){
            foreach ($arrayRoles as $key => $value){
                if($value['r_id'] == self::getIdRole($user_id)) return true;
            }
            return false;
        }
        return false;
    }

    //Kiểm tra xem phân quyền của người đăng nhập có được phép tác động đến mục con hay không
    public static function checkRolesToChild($child_id, $student_id,$users_id){
        $checkOnClass =  AssignmentModel::join('class','class.cl_id','assignment.cl_id')
            ->join('users_has_class','users_has_class.cl_id','=','class.cl_id')
            //Chỉ tác động các lớp không khóa
            ->where('class.cl_active',1)
            //Xem học sinh được truyền vào có thuộc lớp này không
            ->where('users_has_class.u_id', $student_id)
            ->where('assignment.u_id', $users_id)
            ->get();
        if(sizeof($checkOnClass)==0)
            return false;
        //Lấy ra các phân quyền cho id child
        $categoryList = CategoryChildHasRolesModel::where('cc_id',$child_id)->get();
        if(sizeof($categoryList) != 0){
            foreach ($categoryList as $key => $value){
                if($value->r_id == self::getIdRole($users_id)){
                    //Xem user đưa vào có thuộc các lớp mà người đăng nhập được phép truy cập
                    //Kiểm tra xem sinh viên có thuộc lớp được phép không
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public static $branchRoles = [
        "users/{role}" => "admin",
        "users/create" => "admin",
        "users/change" => "admin",
        "users/hide/{id}/{role}" => "admin",
        "users/import" => "admin",
        "users/remove/{id}/{role}" => "admin",
        "users/api/{role}" => "admin",
        "users/api/search/{id}" => "admin",
        "users/api/get/roles/list" => "admin",
        "users/assignment/{id" => "admin",
        "users/api/assignment/{id}" => "admin",
        "users/api/nonassignment/{id}" => "admin",
        "users/api/assignment/add/{id}" => "admin",
        "users/api/assignment/remove/{id}" => "admin",

        "roles" => "admin",
        "roles/create" => "admin",
        "roles/change" => "admin",
        "roles/hide/{id}" => "admin",
        "roles/undo/{id}" => "admin",
        "roles/remove/{id}" => "admin",
        "roles/api" => "admin",

        "class" => "admin",
        "class/create" => "admin",
        "class/add_student" => "admin",
        "class/change" => "admin",
        "class/hide/{id}" => "admin",
        "class/undo/{id}" => "admin",
        "class/remove/{id}" => "admin",
        "class/remove_one/{id_user}/{id_class}" => "admin",
        "class/remove_all/{id}" => "admin",
        "class/student/{id}" => "admin",
        "class/exclude/{id}" => "admin",
        "class/api/search/{id}" => "admin",

        "point" => "admin",
        "point/class/{id}" => "admin",
        "point/registration/{id}" => "admin",
        "point/result/{id}" => "admin",
        "point/change" => "admin",
        "result/api/create" => "admin",
        "result/api/info/{id}" => "admin",
        "result/api/change" => "admin",
        "result/api/remove/{id}" => "admin",

        "active" => "admin",
        "active/create" => "admin",
        "active/change" => "admin",
        "active/hide/{id}" => "admin",
        "active/undo/{id}" => "admin",
        "active/remove/{id}" => "admin",
        "active/approved/{id}" => "admin",
        "active/api" => "admin",
        "active/api/search/{id}" => "admin",

        "achievement/{id}" => "admin",
        "achievement/create" => "admin",
        "achievement/change" => "admin",
        "achievement/" => "admin",
        "achievement/users/{id}" => "admin",
        "achievement/api/hide/{id}" => "admin",
        "achievement/api/undo/{id}" => "admin",
        "achievement/api/remove/{id}" => "admin",
        "achievement/api" => "admin",
        "achievement/api/search/{id}" => "admin",
        "achievement/api/list_member/{id}" => "admin",
        "achievement/api/non_member/{id}" => "admin",
        "achievement/api/add_member/{id}" => "admin",
        "achievement/api/remove_member/{id}" => "admin",

        "cycle" => "admin",
        "cycle/create" => "admin",
        "cycle/change" => "admin",
        "cycle/hide/{id}" => "admin",
        "cycle/undo/{id}" => "admin",
        "cycle/remove/{id}" => "admin",
        "cycle/api" => "admin",

        "select/" => "admin",
        "select/create" => "admin",
        "select/change" => "admin",
        "select/hide/{id}" => "admin",
        "select/undo/{id}" => "admin",
        "select/remove/{id}" => "admin",
        "select/api/search_cy/{id}" => "admin",

        "entity" => "admin",
        "entity/create" => "admin",
        "entity/change" => "admin",
        "entity/set_default/{id}" => "admin",
        "entity/hide/{id}" => "admin",
        "entity/success" => "admin",
        "entity/undo/{id}" => "admin",
        "entity/remove/{id}" => "admin",
        "entity/api/search/{id}" => "admin",
        "entity/select/get/{id}/{child}" => "admin",

        "year" => "admin", //Đã test
        "year/create" => "admin", // Đã test
        "year/change" => "admin", // Đã test
        "year/hide/{id}" => "admin", //Đã test
        "year/undo/{id}" => "admin",
        "year/remove/{id}" => "admin",  //Đã test
        "year/api" => "admin",

        "majors" => "admin", //Đã test
        "majors/create" => "admin", //Đã test
        "majors/change" => "admin", //Đã test
        "majors/hide/{id}" => "admin",
        "majors/undo/{id}" => "admin",
        "majors/remove/{id}" => "admin",
        "majors/api" => "admin",

        "category" => "admin",
        "category/create" => "admin",
        "category/change" => "admin",
        "category/hide/{id}" => "admin",
        "category/undo/{id}" => "admin",
        "category/remove/{id}" => "admin",
        "category/api" => "admin",
        "category/api/list" => "admin",
        "category/api/search/{id}" => "admin",
        "category/api/search_full/{id}" => "admin",

        "child" => "admin",
        "child/create" => "admin",
        "child/change" => "admin",
        "child/hide/{id}" => "admin",
        "child/undo/{id}" => "admin",
        "child/remove/{id}" => "admin",
        "child/api" => "admin",
        "child/api/search/{id}" => "admin",

        "assignment/list_class" => "employee",
        "assignment/result" => "employee",
        "assignment/api/create" => "employee",
        "assignment/api/info/{id}" => "employee",
        "assignment/api/change" => "employee",
        "assignment/api/remove/{id}" => "employee",

        "teacher/list_class" => "teacher",
        "teacher/result" => "teacher",
        "teacher/api/create" => "teacher",
        "teacher/api/info/{id}" => "teacher",
        "teacher/api/change" => "teacher",
        "teacher/api/remove/{id}" => "teacher",

    ];
}