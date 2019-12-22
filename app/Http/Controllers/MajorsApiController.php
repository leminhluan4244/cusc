<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Auth\arrayListRoute;
use App\MajorsModel;
use Illuminate\Http\Request;

class MajorsApiController extends Controller
{
    private $model;
    function __construct()
    {
        $this->model = new MajorsModel();
    }

    /**
     * Hiển thị danh sách chuyên ngành
     * @return array
     */
    public function index(){
        // ---Bỏ qua bước validation
        // ---Lấy dữ liệu
        $result = $this->model->index();
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách các chuyên ngành']
        ];
    }

    /**
     * Tạo chuyên ngành YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        // ---Kiểm tra validation trên APIController
            $validate = MajorsValidation::CreateForm($request);
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
                'message' => ['Tạo chuyên ngành thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];

    }

    /**
     * Chỉnh sửa chuyên ngành YES
     * @param Request $request
     * @return array
     */
    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = MajorsValidation::UpdateForm($request);
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
                'message' => ['Cập nhật ngành học thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

    /**
     * Ẩn chuyên ngành YES
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
                'message' => ['Xóa tạm ngành học thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Đã bị xóa vĩnh diễn hoặc đã xóa tạm từ trước']
        ];
    }

    /**
     * Khôi phục chuyên ngành YES
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
                'message' => ['Khôi phục ngành học thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Đã khôi phục từ trước hoặc đã bị xóa']
        ];
    }

    /**
     * Xóa vĩnh viễn chuyên  ngành
     * @param $id
     * @return array
     */
    public  function remove($id){
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Ngành học cùng các thông tin liên quan đã xóa']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Xóa thất bại, chuyên ngành không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

}
