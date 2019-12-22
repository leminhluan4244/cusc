<?php

namespace App\Http\Controllers;

use App\CategoryChildHasCycleModel;
use App\CycleModel;
use Illuminate\Http\Request;

class CycleApiController extends Controller
{
    public $model;
    function __construct()
    {
        $this->model = new CycleModel();
    }

    public function index(){
        // ---Bỏ qua bước validation
        // ---Lấy dữ liệu
        $result = $this->model->index();
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách các chu kỳ']
        ];
    }

    public  function create(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = CycleValidation::CreateForm($request);
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
                'message' => ['Tạo chu kỳ thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];

    }

    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = CycleValidation::UpdateForm($request);
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
                'message' => ['Cập chu kỳ thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

        public  function hide($id){
        $result = $this->model->hide($id);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Xóa tạm chu kỳ thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Chu kỳ đã bị xóa vĩnh diễn hoặc đã xóa tạm từ trước']
        ];
    }
    public  function undo($id){
        $result = $this->model->undo($id);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Khôi phục chu kỳ thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Chu kỳ đã bị xóa vĩnh diễn hoặc đã khôi phục từ trước']
        ];
    }
    //
    public  function remove($id){
        /**
         * Kiểm tra xem các mục con có được chuyển chưa
         */
        $categoryChild = CategoryChildHasCycleModel::where('cy_id', $id)->get();
        if(sizeof($categoryChild) > 0){
            $err = [];
            foreach ($categoryChild as $value){
                array_push($err, $value);
            }
            return [
                'status'=>'r02',
                'data' => $err,
                'message' => ['Vui lòng xóa hoặc thay đổi chu kỳ cho mục con liên quan tới mục này']
            ];
        }
        $result = $this->model->remove($id);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Chu kỳ cùng các thông tin liên quan đã xóa']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Xóa thất bại, chu kỳ không thể xóa hoặc đã bị xóa từ trước']
        ];
    }


    // Chưa sử dụng >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //***
    public  function count(){

        return [
            'status'=>true,
            'data' => $this->model->count(),
            'message' => []
        ];

    }
}
