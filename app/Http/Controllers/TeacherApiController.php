<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TeacherApiController extends Controller
{
    public $model;

    function __construct()
    {
        $this->model = new TeacherModel();
        $this->modelResult = new ResultPointModel();

    }

    public  function index($id){
        $result = $this->model->index($id);
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

    public  function non_member($id){
        $result = $this->model->non_member($id);
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

    public  function add_member(Request $request){
        $result = $this->model->add_member($request);
        if(isset($result))
            return [
                'status'=>true,
                'data' => $result,
                'message' => ['Thêm lớp thành công']
            ];
//        return [
//            'status'=>false,
//            'data' => [],
//            'message' => ['Khởi tạo thất bại']
//        ];

    }
    public  function remove_member(Request $request){
        $result = $this->model->remove_member($request);
        if(isset($result))
            return [
                'status'=>true,
                'data' => $result,
                'message' => ['Xóa phân công lớp thành công']
            ];
//        return [
//            'status'=>false,
//            'data' => [],
//            'message' => ['Xóa phân công thất bại']
//        ];

    }

    public  function create(Request $request){
        if(!arrayListRoute::checkRolesToChild($request->cc_id,$request->u_id))
            return [
                'status'=>true,
                'data' => false,
                'message' => ['Bạn không được phép truy cập liên kết này']
            ];
        $result = $this->modelResult->create($request);
        if($result)
            return [
                'status'=>true,
                'data' => $result,
                'message' => ['Thêm kết quả cộng điểm thành công']
            ];
//        return [
//            'status'=>false,
//            'data' => [],
//            'message' => ['Khởi tạo thất bại']
//        ];

    }
    public function info($id){
        $cc_id = ResultPointModel::where('rp_id',$id)->first();
        if(!arrayListRoute::checkRolesToChild($cc_id->cc_id,$cc_id->u_id))
            return [
                'status'=>true,
                'data' => false,
                'message' => ['Bạn không được phép truy cập liên kết này']
            ];
        $result = $this->modelResult->info($id);
        return [
            'status'=>true,
            'data' => $result,
            'message' => ['Chi tiết điểm']
        ];
    }
    public function change(Request $request){
        $cc_id = ResultPointModel::where('rp_id',$request->rp_id)->first();
        if(!arrayListRoute::checkRolesToChild($cc_id->cc_id, $cc_id->u_id))
            return [
                'status'=>true,
                'data' => false,
                'message' => ['Bạn không được phép truy cập liên kết này']
            ];
        $result = $this->modelResult->change($request);
        return [
            'status'=>true,
            'data' => $result,
            'message' => ['Đã cập nhật']
        ];
    }
    public function remove($id){
        $cc_id = ResultPointModel::where('rp_id',$id)->first();
        if(!arrayListRoute::checkRolesToChild($cc_id->cc_id, $cc_id->u_id))
            return [
                'status'=>true,
                'data' => false,
                'message' => ['Bạn không được phép truy cập liên kết này']
            ];
        $result = $this->modelResult->remove($id);
        return [
            'status'=>true,
            'data' => $result,
            'message' => ['Xóa thành công']
        ];
    }
}
