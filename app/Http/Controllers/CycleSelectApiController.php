<?php

namespace App\Http\Controllers;

use App\CategoryChildHasCycleModel;
use App\CategoryChildModel;
use App\CycleSelectModel;
use Illuminate\Http\Request;

class CycleSelectApiController extends Controller
{
    private $model;
    function __construct()
    {
        $this->model = new CycleSelectModel();
    }

    /**
     * Hiển thị danh sách bộ chọn
     * @return array
     */
    public function index(){
        $result = $this->model->index();
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách bộ chọn']
        ];
    }

    /**
     * Thêm một bộ chọn YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = CycleSelectValidation::CreateForm($request);
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
                'message' => ['Tạo bộ chọn thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];

    }

    /**
     * Sửa bộ chọn YES
     * @param Request $request
     * @return array
     */
    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = CycleSelectValidation::UpdateForm($request);
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
                'message' => ['Cập nhật bộ chọn thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

    /**
     * Ẩn bộ chọn YES
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
                'message' => ['Xóa tạm bộ chọn thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Bộ chọn đã bị xóa vĩnh diễn hoặc đã xóa tạm từ trước']
        ];
    }

    /**
     * Khôi phục bộ chọn từ trạng thái ẩn
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
                'message' => ['Khôi phục bộ chọn thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Bộ chọn đã khôi phục từ trước hoặc đã bị xóa']
        ];
    }

    /**
     * Xóa vĩnh viễn bộ chọn
     * @param $id
     * @return array
     */
    public  function remove($id){
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Bộ chọn cùng các thông tin liên quan đã xóa']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Xóa thất bại, bộ chọn không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Tìm kiếm bộ chọn theo id chu kỳ
     * @param $id
     * @return array
     */
    public  function search_by_cycle($id){
        $result = $this->model->search_by_cycle($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Danh sách bộ chọn']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Chu kỳ này rỗng bộ chọn']
        ];
    }





    //** Đếm số bộ chọn NO */
    public  function count(){
        return [
            'status'=>true,
            'data' => $this->model->count(),
            'message' => []
        ];
    }


}
