<?php

namespace App\Http\Controllers;
use App\PermissionModel;
use App\UsersModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;

class PermissionApiController extends Controller
{
    private $model;
    function __construct()
    {
        $this->model = new PermissionModel();
    }
    /*
     * Khi có thay đổi và muốn reset route đặt tên lại thì gọi hàm này, danger YES
     */
    private function addData(){
        $routeCollection = Route::getRoutes();
        foreach ($routeCollection as $key => $value) {
//            dd($value);
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
     * Danh sách các route được phép truy cập
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
     * Thêm một route vào dữ liệu
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        $user = UsersModel::where('id', $request->users_id)->first();
        if (!Hash::check($request->password, $user->password)){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Nhập mật không chính xác']
            ];
        }
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
     * Danh sách các route chưa được truy cập
     * @param $id
     * @return array
     */
    public static function getRouteList($id){
        $routeCollection = Route::getRoutes();
        $data = array();
        foreach ($routeCollection as $key => $value) {
            //Kiểm tra sự tồn tại của route trong danh sách các route
            $pos1 = strpos($value->uri(), 'login');
            $pos2 = strpos($value->uri(), 'logout');
            $pos3 = strpos($value->uri(), 'register');
            $pos4 = strpos($value->uri(), 'password');
            $pos5 = strpos($value->uri(), 'auth');

            $exists = PermissionModel::where('r_id',$id)
                ->where('pm_route', $value->uri())->first();
            if ($pos1 === false  && $pos2 === false  && $pos3 === false  && $pos4 === false  && $pos5 === false  && !isset($exists)) {
                array_push($data,$value->uri());
            }
        }
        return [
            'status'=>'r00',
            'data' => $data,
            'message' => ['Danh sách các route']
        ];
    }

}
