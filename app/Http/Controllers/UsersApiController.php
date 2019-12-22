<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Auth\arrayListRoute;
use App\RolesModel;
use App\UsersModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UsersApiController extends Controller
{
    public $model;

    function __construct()
    {
        $this->model = new UsersModel();
    }

    /***
     * Lấy ra danh sách tài khoản theo phân quyền truyền vào YES
     * @param $role
     * @return array
     */
    public function index($role){
        $data = $this->model->index($role);
        return [
            'status'=>'r00',
            'data' => $data,
            'message' => ['Danh sách người dùng']
        ];
    }

    /***
     * Thêm tài khoản YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = UsersValidation::CreateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        //Gọi model
        $result = $this->model->create($request);

        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Khởi tạo tài khoản thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Khởi tạo thất bại']
        ];
    }

    /***
     * Cập nhật tài khoản YES
     * @param Request $request
     * @return mixed
     */
    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = UsersValidation::UpdateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        $result = $this->model->change($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Cập nhật tài khoản thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

    /***
     * Xóa tạm tài khoản YES
     * @param $id
     * @return array
     */
    public  function hide($id){
        $result = $this->model->hide($id);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tài khoản đã bị xóa tạm, bạn có thể khôi phục từ Trash']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, Tài khoản này không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /***
     * Khôi phục tài khoản YES
     * @param $id
     * @return array
     */
    public  function undo($id){
        $result = $this->model->undo($id);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Khôi phục tài khoản thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Đã khôi phục từ trước hoặc đã bị xóa']
        ];
    }

    /***
     * Xóa tài khoản YES
     * @param $id
     * @return array
     */
    public  function remove($id){
        $result = $this->model->remove($id);
        if($result['error'] == 'unknow')
            return [
                'status' => 'r01',
                'data' => [],
                'message' => ['Tài khoản không tồn tại']
            ];
        if($result['error'] == 'admin')
            return [
                'status' => 'r01',
                'data' => [],
                'message' => ['Không thể xóa vĩnh viễn tài khoản admin']
            ];
        if($result['error'] == 'class')
            return [
                'status' => 'r01',
                'data' => [],
                'message' => [
                    'Tài khoản này đang là chủ nhiệm, vui lòng đổi tài khoản khác hoặc xóa lớp'
                ]
            ];
        if($result['error'] == 'active')
            return [
                'status' => 'r01',
                'data' => [],
                'message' => ['Tài khoản này đang tổ chức hoạt động, vui lòng đổi tài khoản khác hoặc xóa hoạt động']
            ];
        if($result['error'] == 'none')
            return [
                'status' => 'r00',
                'data' => [],
                'message' => ['Xóa thành công']
            ];
    }

    /**
     * Danh sách các phân quyền thuộc nhóm cán bộ (đỗ vào form thêm và sửa) YES
     * @return array
     * pages.users.create_employee
     * pages.users.update_employee
     */
    public function employee(){
        $data = $this->model->employee();
        return [
            'status' => true,
            'data' => $data,
            'message' => ['Danh sách các loại cán bộ']
        ];
    }

    /**
     * Cấp lại phân quyền cho users YES
     * @param Request $request
     * @return array
     */
    public function resetRoles(Request $request){
        $result = $this->model->resetRoles($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Cấp lại phân quyền thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Bạn nhập phân quyền chưa đúng hoặc lựa chọn loại cấp lại sai']
        ];
    }

    /**
     * Tìm kiếm tài khoản theo id, sử dụng cho form sửa và info YES
     * @param $id
     * @return array
     */
    public function search($id){
        $result = $this->model->search($id);
        if(isset($result)){
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Dữ liệu tìm kiếm']
            ];
        }
        else{
            return [
                'status'=>'r02',
                'data' => $result,
                'message' => ['Không thể tìm được tài khoản này']
            ];
        }

    }

    public  function resetPass(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = UsersValidation::ResetPass($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        if($request->users_id != $request->auth_users){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Bạn không được đổi mật khẩu của tài khoản người khác']
            ];
        }
        /**
         * Kiểm tra nhập lại
         */
        if($request->new_pass != $request->re_new_pass){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Nhập lại mật khẩu không khớp']
            ];
        }

        /**
         * Kiểm tra nhập mật khẩu
         */
        $user = UsersModel::where('id', $request->users_id)->first();
        if (!Hash::check($request->old_pass, $user->password)){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Nhập mật khẩu cũ không chính xác']
            ];
        }

        $result = $this->model->resetPass($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Cập nhật thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

//    >>>>>>>>>> Chưa sử dụng
    public  function count(){

        return [
            'status'=>true,
            'data' => $this->model->count(),
            'message' => []
        ];

    }



}
