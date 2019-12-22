<?php

namespace App\Http\Controllers;

use App\CategoryModel;
use Illuminate\Http\Request;

class CategoryApiController extends Controller
{
    private $model;

    function __construct()
    {
        $this->model = new CategoryModel();
    }

    /**
     * Hiển thị danh sách kèm mục con YES
     * @return array
     */
    public function index(){
        // ---Lấy dữ liệu
        $result = $this->model->index();
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách chu kỳ kèm mục con']
        ];
    }

    /**
     * Hiển thị danh sách YES
     * @return array
     */
    public function list(){
        // ---Bỏ qua bước validation
        // ---Lấy dữ liệu
        $result = $this->model->list();
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách chu kỳ']
        ];
    }

    /**
     * Thêm mục lớn YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = CategoryValidation::CreateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        //Bắt validation trường hợp đặc biệt
        if(
            ($request->c_max_scores==0 && !isset($request->max_scores_create)) ||
            ($request->c_max_scores==0 && $request->max_scores_create != 'max')
        )
        {
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Dữ liệu đầu vào cho điểm tối đa không hợp lệ']
            ];
        }
        $result = $this->model->create($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tạo mục lớn thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];

    }

    /**
     * Sửa mục lớn YES
     * @param Request $request
     * @return array
     */
    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = CategoryValidation::UpdateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        if(
            ($request->c_max_scores==0 && !isset($request->max_scores_create)) ||
            ($request->c_max_scores==0 && $request->max_scores_create != 'max')
        ){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Dữ liệu đầu vào cho điểm tối đa không hợp lệ']
            ];
        }
        $result = $this->model->change($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Cập nhật mục lớn thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

    /**
     * Xóa tạm mục lớn YES
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
                'message' => ['Mục lớn đã bị xóa tạm, bạn có thể khôi phục từ Trash']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền của bạn được phép hoặc mục này đã bị xóa từ trước']
        ];
    }

    /**
     * Khôi phục mục lớn YES
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
     * Xóa vĩnh viễn mục lớn
     * @param $id
     * @return array
     */
    public  function  remove($id){
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Mục này cùng các thông tin liên quan đã xóa']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Xóa thất bại, mục lớn không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Tìm kiếm YES
     * @param $id
     * @return array
     */
    public  function search($id){
        $result = $this->model->search($id);
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
     * Tìm kiếm có mục con đính kèm YES
     * @param $id
     * @return array
     */
    public function search_full_child($id){
        $result = $this->model->search_full_child($id);
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


    //??
    public  function count(){

        return [
            'status'=>'r00',
            'data' => $this->model->count(),
            'message' => []
        ];
    }

}
