<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Auth\arrayListRoute;
use App\SchoolYearModel;
use Illuminate\Http\Request;

class SchoolYearApiController extends Controller
{
    public $model;
    function __construct()
    {
        $this->model = new SchoolYearModel();
    }

    /**
     * Danh sách niên khóa YES
     * @return array
     */
    public function index(){
        // ---Lấy dữ liệu
        $data = $this->model->index();
        // ---Return kết quả dữ liệu
        return [
            'status'=> 'r00',
            'data' => $data,
            'message' => ['Danh sách niên khóa']
        ];
    }

    /**
     * Thêm niên khóa YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        // ---Kiểm tra validation
        $validate = SchoolYearValidation::CreateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        $result = $this->model->create($request);
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tạo niên khóa thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi chèn dữ liệu']
        ];

    }

    /**
     * Cập nhật niên khóa YES
     * @param Request $request
     * @return array
     */
    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = SchoolYearValidation::UpdateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        $result = $this->model->change($request);
        // ---Return kết quả thao tác post trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Chỉnh sửa niên khóa thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Không tồn tại mục bạn muốn cập nhật']
        ];
    }

    /**
     * Ẩn niên khóa YES
     * @param $id
     * @return array
     */
    public  function hide($id){
        $result = $this->model->hide($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Niên khóa đã bị xóa tạm, bạn có thể khôi phục từ Trash']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, niên khóa không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Khôi phục niên khóa YES
     * @param $id
     * @return array
     */
	public  function undo($id){
        $result = $this->model->undo($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Khôi phục niên khóa thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Khôi phục thất bại, niên khóa đã bị xóa hoặc đã khôi phục từ trước']
        ];
    }

    /**
     * Xóa niên khóa vĩnh viễn YES
     * @param $id
     * @return array
     */
    public  function remove($id){
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Niên khóa đã bị xóa vĩnh viễn']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, niên khóa không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

}
