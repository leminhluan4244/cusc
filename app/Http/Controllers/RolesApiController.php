<?php

namespace App\Http\Controllers;

use App\RolesModel;
use Illuminate\Http\Request;

class RolesApiController extends Controller
{
    public $model;
    function __construct()
    {
        $this->model = new RolesModel();
    }

    public function index(){
        return [
            'status'=>'r00',
            'data' => $this->model->index(),
            'message' =>[]
        ];
    }

    public  function create(Request $request){
        //Kiểm tra validation của mảng thành viên
        $validate = RolesValidation::CreateForm($request);
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
                'message' => ['Khởi tạo thành công phân quyền']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Khởi tạo thất bại']
        ];

    }

    public  function change(Request $request){
        //Kiểm tra validation của mảng thành viên
        $validate = RolesValidation::UpdateForm($request);
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
                'data' => [],
                'message' => ['Cập nhật phân quyền thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Cập nhật phân quyền thất bại']
        ];
    }

    /**
     * Ẩn phân quyền YES
     * @param $id
     * @return array
     */
    public  function hide($id){
        //Kiểm tra phân quyền có thuộc diện không cho phép xóa hay không
        $isRoot = RolesModel
            ::where('r_id', $id)
            ->whereIn('r_id',[
                '0826eaf8086b01749bf7ff65742a200c', //teacher
                '08cd66cb6b012217ed32cb8662a2a1d9', //admin
                '1b83df7a91f51b3d32cf6bda5b0fd23f', //student
                'b2cba2a7a5499bd67320ba3d4046dc2e'  //wait
            ])
            ->first();
        if(isset($isRoot)){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Xóa thất bại, không được phép xóa hoặc ẩn phân quyền hệ thống']
            ];
        }
        $result = $this->model->hide($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Phân quyền đã bị xóa tạm, bạn có thể khôi phục từ Trash']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Khôi phục phân quyền YES
     * @param $id
     * @return array
     */
    public  function undo($id){
        $result = $this->model->undo($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Khôi phục phân quyền thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Khôi phục thất bại, phân quyền đã khôi phục từ trước hoặc đã bị xóa vĩnh viễn']
        ];
    }


    /**
     * Xóa vĩnh viễn phân quyền YES
     * @param $id
     * @return array
     */
    public  function remove($id){
        //Kiểm tra phân quyền có thuộc diện không cho phép xóa hay không
        $isRoot = RolesModel
            ::where('r_id', $id)
            ->whereIn('r_id',[
                '0826eaf8086b01749bf7ff65742a200c', //teacher
                '08cd66cb6b012217ed32cb8662a2a1d9', //admin
                '1b83df7a91f51b3d32cf6bda5b0fd23f', //student
                'b2cba2a7a5499bd67320ba3d4046dc2e'  //wait
            ])
            ->first();
        if(isset($isRoot)){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Xóa thất bại, không được phép xóa hoặc ẩn phân quyền hệ thống']
            ];
        }
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Phân quyền cùng các mục liên quan xóa']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Đếm số phân quyền trong hệ thống YES
     * @return array
     */
    public  function count(){

        return [
            'status'=>'r00',
            'data' => $this->model->count(),
            'message' => []
        ];

    }

}
