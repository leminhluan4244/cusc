<?php

namespace App\Http\Controllers;

use App\ActiveAchievementModel;
use Illuminate\Http\Request;

class ActiveAchievementApiController extends Controller
{
    public $model;

    function __construct()
    {
        $this->model = new ActiveAchievementModel();
    }

    /**
     * Lấy danh sách YES
     * @return array
     */
    public function index($id){
        // ---Bỏ qua bước validation
        $result = $this->model->index($id);
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách phân công và thành viên']
        ];
    }

    /**
     * Tạo mới vai trò YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = ActiveAchievementValidation::CreateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        $result = $this->model->create($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tạo vai trò thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

    /**
     * Thay đổi vai trò YES
     * @param Request $request
     * @return array
     */
    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = ActiveAchievementValidation::UpdateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        $result = $this->model->change($request);
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Cập nhật vai trò thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Cập nhật thất bại']
        ];
    }

    /**
     * Ẩn vai trò YES
     * @param $id
     * @return array
     */
    public  function hide($id){
        $result = $this->model->hide($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Vai trò đã bị xóa tạm, bạn có thể khôi phục từ Trash']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, Vai trò không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Khôi phục vai trò YES
     * @param $id
     * @return array
     */
    public  function undo($id){
        $result = $this->model->undo($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Vai trò đã khôi phục']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, vai trò đã bị xóa vĩnh viễn hoặc đã khôi phục từ trước']
        ];
    }


    /**
     * Xóa bỏ vai trò YES
     * @param $id
     * @return array
     */
    public  function remove($id){
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Vai trò đã bị xóa vĩnh viễn']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền của bạn không được phép hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Tìm kiếm NO
     * @param $id
     * @return array
     */
    public  function search($id){
        $result = $this->model->search($id);
        if(isset($result))
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tìm kiếm thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Không thể tìm thấy giá trị này']
        ];
    }

    /**
     * Danh sách điều hướng phân công YES
     * @return array
     */
    public function users($id){
        // ---Bỏ qua bước validation
        $result = $this->model->users($id);
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách điều hướng phân công']
        ];
    }

    /**
     * Danh sách thành viên của một bộ các vai trò thuộc một hoạt động YES
     * @param $id : id hoạt động
     * @return array
     */
    public  function list_member($id){
        $result = $this->model->list_member($id);
        if(isset($result))
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tìm kiếm thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Không thể tìm thấy giá trị này']
        ];
    }

    /**
     * Danh sách các tài khoản thuộc vai trò này YES
     * @param Request $request
     * @return array
     */
    public  function add_member(Request $request){
        //Kiểm tra validation của mảng thành viên
        $validate = ActiveAchievementValidation::ArrayInput($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        //Vượt qua thì tiến hành thêm
        $result = $this->model->add_member($request);
        if(empty($result)){
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Thêm thành viên thành công, không có tài khoản không hợp lệ']
            ];
        }
        else{
            return [
                'status'=>'r02',
                'data' => $result,
                'message' => ['Có '.sizeof($result).' tài khoản đã được thêm từ trước hoặc không phải là học viên']
            ];
        }


    }

    /**
     * Danh sách các tài khoản không thuộc vai trò này YES
     * @param $id
     * @return array
     */
    public  function non_member($id){
        $result = $this->model->non_member($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tìm kiếm thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Không thể tìm thấy giá trị này']
        ];
    }

    /**
     * Xóa danh sách thành viên
     * @param Request $request
     * @return array
     */
    public  function remove_member(Request $request){
        $result = $this->model->remove_member($request);
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Xóa hoàn tất']
            ];
    }

    /**
     *     //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
     */









    /**
     * Đếm NO
     * @return array
     */
    public  function count(){

        return [
            'status'=>true,
            'data' => $this->model->count(),
            'message' => []
        ];

    }









}
