<?php

namespace App\Http\Controllers;

use App\CategoryChildModel;
use Illuminate\Http\Request;

class CategoryChildApiController extends Controller
{
    public $model;

    function __construct()
    {
        $this->model = new CategoryChildModel();
    }

    /**
     * Lấy danh sách YES
     * @return array
     */
    public function index(){
        // ---Lấy dữ liệu
        $result = $this->model->index();
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách các mục con đầy đủ']
        ];
    }

    /**
     * Thêm mục con YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = CategoryChildValidation::CreateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        //Bắt validation trường hợp đặc biệt
        if(
            (!isset($request->max_scores_cycle) && $request->cc_max_scores_cycle<=0) ||
            ($request->max_scores_cycle != 'max' && $request->cc_max_scores_cycle<=0)
        )
        {
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Dữ liệu đầu vào cho điểm giới hạn không hợp lệ']
            ];
        }
        $result = $this->model->create($request);
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tạo mục con thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];

    }

    /**
     * Sửa mục con YES
     * @param Request $request
     * @return array
     */
    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = CategoryChildValidation::UpdateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        //Bắt validation trường hợp đặc biệt
        if(
            (!isset($request->max_scores_cycle) && $request->cc_max_scores_cycle<=0) ||
            ($request->max_scores_cycle != 'max' && $request->cc_max_scores_cycle<=0)
        )
        {
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Dữ liệu đầu vào cho điểm giới hạn không hợp lệ']
            ];
        }
        $result = $this->model->change($request);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Cập nhật mục lớn thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Cập nhật thất bại']
        ];
    }

    /**
     * Ẩn mục con YES
     * @param $id
     * @return array
     */
    public  function hide($id){
        $result = $this->model->hide($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Mục lớn đã bị xóa tạm, bạn có thể khôi phục từ Trash']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền của bạn được phép hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Khôi phục mục con YES
     * @param $id
     * @return array
     */
    public  function undo($id){
        $result = $this->model->undo($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Mục lớn đã bị xóa tạm, bạn có thể khôi phục từ Trash']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền của bạn được phép hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Xóa vĩnh viễn mục con YES
     * @param $id
     * @return array
     */
    public  function remove($id){
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Mục lớn đã bị xóa']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền của bạn được phép hoặc đã bị xóa từ trước']
        ];
    }

    public  function count(){

        return [
            'status'=>'r00',
            'data' => $this->model->count(),
            'message' => []
        ];

    }
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
}
