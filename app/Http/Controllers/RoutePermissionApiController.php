<?php

namespace App\Http\Controllers;

use App\RoutePermissionModel;
use Illuminate\Http\Request;

class RoutePermissionApiController extends Controller
{
    private $model;
    function __construct()
    {
        $this->model = new RoutePermissionModel();
    }
    /*
     * Khi có thay đổi và muốn reset route đặt tên lại thì gọi hàm này, danger YES
     */
    private function addData(){
        $routeCollection = Route::getRoutes();
        foreach ($routeCollection as $key => $value) {
            DB::table('route')->insert(
                [
                    'ro_id' => time()+$key,
                    'ro_value' => $value->uri(),
                    'ro_name' => ''
                ]
            );
        }
    }

    /**
     * Danh sách các route được phép truy cập YES
     * @param $id
     * @return array
     */
    public function index($id){
        $result = $this->model->index($id);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Danh sách các route được phép']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

    /**
     * Thêm một route vào dữ liệu YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        $result = $this->model->create($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tùy chỉnh truy cập thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

    /**
     * Xóa một route
     * @param $id
     * @return array
     */
    public function remove($id){
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Truy cập đã tắt']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Truy cập đã bị xóa từ trước, hoặc nó không tồn tại']
        ];
    }

    /**
     * Danh sách các route chưa được truy cập của một phân quyền YES
     * @param $id
     * @return array
     */
    public function getRouteList($id){
        $data = $this->model->getRouteList($id);
        return [
            'status'=>'r00',
            'data' => $data,
            'message' => ['Danh sách các route chưa được truy cập']
        ];
    }
}
