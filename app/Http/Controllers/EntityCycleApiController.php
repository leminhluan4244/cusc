<?php

namespace App\Http\Controllers;

use App\DefaultEntityModel;
use App\EntityCycleModel;
use Illuminate\Http\Request;

class EntityCycleApiController extends Controller
{
    private $model;
    function __construct()
    {
        $this->model = new EntityCycleModel();
    }

    /**
     * Hiển thị danh sách YES
     * @return array
     */
    public function index(){
        // ---Lấy dữ liệu
        $result = $this->model->index();
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách các giá trị chu kỳ']
        ];
    }

    /**
     * Tạo giá trị chu kỳ YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = EntityCycleValidation::CreateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        $begin = date('Y-m-d',strtotime($request->ec_begin));
        $end = date('Y-m-d',strtotime($request->ec_end));
        if($begin > $end){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Thao tác thất bại, ngày bắt đầu phải nhỏ hơn hoặc bằng ngày kết thúc']
            ];
        }
        $result = $this->model->create($request);
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tạo giá trị chu kỳ thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Khởi tạo thất bại']
        ];

    }

    /**
     * Cập nhật giá trị chu kỳ YES
     * @param Request $request
     * @return array
     */
    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = EntityCycleValidation::UpdateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        $begin = date('Y-m-d',strtotime($request->ec_begin));
        $end = date('Y-m-d',strtotime($request->ec_end));
        if($begin > $end){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Thao tác thất bại, ngày bắt đầu phải nhỏ hơn hoặc bằng ngày kết thúc']
            ];
        }
        $result = $this->model->change($request);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Cập nhật giá trị chu kỳ thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Cập nhật thất bại']
        ];
    }

    /**
     * Ẩn giá trị chu kỳ YES
     * @param $id
     * @return array
     */
    public  function hide($id){
        $result = $this->model->hide($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Giá trị chu kỳ đã bị xóa tạm, bạn có thể khôi phục từ Trash']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Khôi phục giá trị chu kỳ YES
     * @param $id
     * @return array
     */
    public  function undo($id){
        $result = $this->model->undo($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Khôi phục giá trị chu kỳ thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Khôi phục thất bại, chu kỳ đã bị xóa hoặc đã khôi phục từ trước']
        ];
    }

    /**
     * Xóa vĩnh viễn một gái trị chu kỳ YES
     * @param $id
     * @return array
     */
    public  function remove($id){
        $defaultEntity = DefaultEntityModel::where('ec_id', $id)->first();
        if(isset($defaultEntity)){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Không được phép xóa chu kỳ mặc định, hãy chốt chu kỳ này trước khi xóa nó']
            ];
        }
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Phân quyền đã bị']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Tìm kiếm giá trị chu kỳ YES
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

    /***
     * Lấy ra chu kỳ sẵn sàng tiếp theo chuẩn bị cho xác nhận chu kỳ YES
     * @param Request $request
     * ec_id : id chu kỳ sắp xác nhận
     * @return array
     */
    public function getAvailableNextEntity(Request $request){
        // ---Lấy dữ liệu
        $result = $this->model->getAvailableNextEntity($request);
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách các giá trị chu kỳ có thể trở thành mặc định tiếp theo']
        ];
    }

    public  function count(){

        return [
            'status'=>'r00',
            'data' => $this->model->count(),
            'message' => []
        ];

    }
}
