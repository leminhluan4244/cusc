<?php

namespace App\Http\Controllers;

use App\RegistrationModel;
use App\UsersHasClassModel;
use App\UsersHasRolesModel;
use Illuminate\Http\Request;

class RegistrationApiController extends Controller
{
    public $model;

    function __construct()
    {
        $this->model = new RegistrationModel();
    }

    /**
     * Danh sách bảng đăng ký theo lớp kèm mục con NO
     * @return array
     */
//    public function index(){
//        $result = $this->model->index();
//        return [
//            'status'=>'r00',
//            'data' => $result,
//            'message' => ['Danh sách bảng đăng ký theo lớp kèm mục con']
//        ];
//    }

//    public function list(){
//        $result = $this->model->list();
//        return [
//            'status'=>'r00',
//            'data' => $result,
//            'message' => ['Danh sách chu kỳ']
//        ];
//    }


    /**
     * Lấy ra bảng đăng ký của một học viên YES
     * @param $id
     * @return array
     */
    public  function registration($id,$users_login){
        $role = UsersHasRolesModel
            ::where('u_id',$users_login)
            ->where('r_id', '08cd66cb6b012217ed32cb8662a2a1d9')
            ->first();
        if(!isset($role)){
            if($id  != $users_login ){
                //Kiểm tra xem có phải cố vấn học viên này hay không
                $isManager = UsersHasClassModel
                    ::join('class', 'class.cl_id', 'users_has_class.cl_id')
                    ->where('users_has_class.u_id',$id)
                    ->where('class.u_manager_id',$users_login)
                    ->where('class.cl_active',1)
                    ->first();
                //Kiếm tra xem có phải cán bộ chấm điểm học viên này hay không
                $isStaff = UsersHasClassModel
                    ::join('class', 'class.cl_id', 'users_has_class.cl_id')
                    ->join('assignment','assignment.cl_id', 'class.cl_id')
                    ->where('users_has_class.u_id',$id)
                    ->where('assignment.u_id',$users_login)
                    ->where('cl_active',1)
                    ->first();

                //Nếu không phải cố vấn  và cũng không là cán bộ được quản lý lớp thì không cho truy cập
                if(!isset($isStaff) && !isset($isManager)){
                    return [
                        'status'=>'r03',
                        'data' => [],
                        'message' => ['Bạn không được phép xem bảng đăng ký của sinh viên này ']
                    ];
                }

            }
        }

        $result = $this->model->registration($id);
        if(isset($result))
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Bảng đăng ký học viên']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Không tìm thấy bảng đăng ký']
        ];
    }

    public  function change($request){
        $result = $this->model->change($request);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Đăng ký thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Đăng ký thất bại, dữ liệu đầu vào sai định dạng']
        ];
    }

    /**
     * Chưa sửa dụng hàm này ??
     * @param Request $request
     * @return array
     */
    public function search_full_child(Request $request){
        $result = $this->model->search_full_child($request);
        if($result)
            return [
                'status'=>true,
                'data' => $result,
                'message' => ['Tìm kiếm thành công']
            ];
        return [
            'status'=>false,
            'data' => [],
            'message' => ['Không thể tìm thấy giá trị này']
        ];
    }
}
