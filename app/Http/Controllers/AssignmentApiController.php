<?php

namespace App\Http\Controllers;

use App\AssignmentModel;
use App\Http\Controllers\Auth\arrayListRoute;
use App\ResultPointModel;
use Illuminate\Http\Request;


class AssignmentApiController extends Controller
{
    public $model;

    function __construct()
    {
        $this->model = new AssignmentModel();
        $this->modelResult = new ResultPointModel();

    }

    /**
     * Danh sách các lớp phân công cho cán bộ YES
     * @param $id : ID cán bộ
     * @return array : Mảng các lớp
     */
    public  function index($id){
        //Kiểm tra xem tài khoản truyền vào có phải là cán bộ hay không
        $checkRoles = ToolCtrl::accuracyRolesStaff($id);
        if($checkRoles==false){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Tài khoản truyền vào không phải là cán bộ']
            ];
        }
        //Nếu là cán bộ thì tìm các lớp mà người này được phân công
        $result = $this->model->index($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Danh sách lớp']
            ];
        return [
            'status'=>'r00',
            'data' => [],
            'message' => ['Cán bộ chưa được phân công lớp nào']
        ];

    }

    /**
     * Danh sách các lớp chưa thuộc quản lý điểm của một cán bộ YES
     * @param $id : ID cán bộ
     * @return array : Mảng các lớp
     */
    public  function non_member($id){
        //Kiểm tra xem tài khoản truyền vào có phải là cán bộ hay không
        $checkRoles = ToolCtrl::accuracyRolesStaff($id);
        if($checkRoles==false){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Tài khoản truyền vào không phải là cán bộ']
            ];
        }
        $result = $this->model->non_member($id);
        if(isset($result) && sizeof($result) > 0)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tìm kiếm thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['ID cán bộ sai hoặc cán bộ này đã được phân công tất cả các lớp']
        ];
    }

    /**
     * Thêm một danh sách các lớp vào phân công chấm điểm cho cán bộ YES
     * @param Request $request
     * @return array
     */
    public  function add_member(Request $request){
        //Kiểm tra xem tài khoản truyền vào có phải là cán bộ hay không
        $checkRoles = ToolCtrl::accuracyRolesStaff($request->u_id);
        if($checkRoles==false){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Tài khoản truyền vào không phải là cán bộ']
            ];
        }
        $result = $this->model->add_member($request);
        if(isset($result))
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Thêm lớp thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Khởi tạo thất bại']
        ];

    }

    /**
     * Loại bỏ danh sách phân công cho một cán bộ YES
     * @param Request $request
     * @return array
     */
    public  function remove_member(Request $request){
        //Kiểm tra xem tài khoản truyền vào có phải là cán bộ hay không
        $checkRoles = ToolCtrl::accuracyRolesStaff($request->u_id);
        if($checkRoles==false){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Tài khoản truyền vào không phải là cán bộ']
            ];
        }
        $result = $this->model->remove_member($request);
        if(isset($result))
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Xóa phân công lớp thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa phân công thất bại']
        ];

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
