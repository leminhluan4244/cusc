<?php

namespace App\Http\Controllers;

use App\ClassModel;
use Illuminate\Http\Request;

class ClassApiController extends Controller
{
    private $model;
    function __construct()
    {
        $this->model = new ClassModel();
    }


    /**
     * Lấy danh sách lớp YES
     * @return array
     */
    public function index(){
        // ---Bỏ qua bước validation
        $result = $this->model->index();
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách các lớp']
        ];
    }

    /**
     * Lấy danh sách học sinh YES
     * @param $id
     * @return array
     */
    public function student($id, $id_manager){
        //Kiếm tra xem có phải cán bộ chấm điểm lớp này hay không
        $isStaff = ToolCtrl::accuracyAccount($id_manager, 'assignment','cl_id',$id);

        //Kiểm tra xem có phải cố vấn lớp này hay không
        $isManager = $this->model->search($id);

        //Nếu không phải cố vấn  và cũng không là cán bộ được quản lý lớp thì không cho truy cập
        if(!$isStaff && $isManager->u_manager_id != $id_manager){
            return [
                'status'=>'r03',
                'data' => [],
                'message' => ['Bạn không được phép xem danh sách sinh viên của lớp này']
            ];
        }

        // ---Lấy dữ liệu
        $result = $this->model->student($id);
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách học sinh lớp']
        ];
    }

    /**
     * Lấy danh sách học sinh không thuộc lớp
     * @param $id
     * @param $id_manager
     * @return array
     */
    public function exclude($id, $id_manager){
        //Kiếm tra xem có phải cán bộ chấm điểm lớp này hay không
        $isStaff = ToolCtrl::accuracyAccount($id_manager, 'assignment','cl_id',$id);

        //Kiểm tra xem có phải cố vấn lớp này hay không
        $isManager = $this->model->search($id);

        //Nếu không phải cố vấn  và cũng không là cán bộ được quản lý lớp thì không cho truy cập
        if(!$isStaff && $isManager->u_manager_id != $id_manager){
            return [
                'status'=>'r03',
                'data' => [],
                'message' => ['Bạn không được phép truy cập chức năng này']
            ];
        }
        // ---Bỏ qua bước validation
        // ---Lấy dữ liệu
        $result = $this->model->exclude($id);
        // ---Return kết quả thao tác post/get trên APIController
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Danh sách học sinh lớp không thuộc lớp']
        ];
    }

    /**
     * Thêm một lớp YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = ClassValidation::CreateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        //Kiểm tra đầu vào cho 1 user chủ nhiệm có đúng không
        $isTeacher = ToolCtrl::isTeacher($request->u_manager_id);
        if(!$isTeacher){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Tài khoản quản lý lớp truyền vào không phải là giáo viên chủ nhiệm']
            ];
        }
        $result = $this->model->create($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Tạo lớp thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];

    }

    /**
     * Sửa đổi thông tin lớp YES
     * @param Request $request
     * @return array
     */
    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = ClassValidation::UpdateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }

        //Kiểm tra đầu vào cho 1 user chủ nhiệm có đúng không
        $isTeacher = ToolCtrl::isTeacher($request->u_manager_id);
        if(!$isTeacher){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Tài khoản quản lý lớp truyền vào không phải là giáo viên chủ nhiệm']
            ];
        }
        $result = $this->model->change($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Cập nhật lớp thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

    /**
     * Ẩn YES
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
                'message' => ['Xóa tạm lớp thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Đã bị xóa vĩnh diễn hoặc đã xóa tạm từ trước']
        ];
    }

    /**
     * Khôi phục YES
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
                'message' => ['Khôi phục lớp thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Đã khôi phục từ trước hoặc đã bị xóa']
        ];
    }

    /**
     * Xóa vĩnh diễn YES
     * @param $id
     * @return array
     */
    public  function remove($id){
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Lớp cùng các thông tin liên quan đã xóa']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Xóa thất bại, chuyên ngành không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Thêm học sinh vào lớp YES
     * @param Request $request
     * @return array
     */
    public  function add_student(Request $request){
        //Kiểm tra validation của mảng thành viên
        $validate = ClassValidation::ArrayInput($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        $result = $this->model->add_student($request);
        if($result['isset'] ==0 && $result['notStudent'] ==0){
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Thêm học viên thành công']
            ];
        }
        else{
            return [
                'status'=>'r01',
                'data' => [],
                'message' => [
                    'Có '.$result['isset'].' tài khoản đã thuộc lớp',
                    'Có '.$result['notStudent'].' tài khoản không phải là học viên',
                ]
            ];
        }


    }

    /**
     * Loại bỏ tất cả học sinh trong lớp YES
     * @param $id
     * @return array
     */
    public  function remove_all($id){
        $result = $this->model->remove_all($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Lớp hiện tại đã rỗng']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền của bạn không được phép hoặc mục này đã bị xóa từ trước']
        ];
    }

    /**
     * Loại bỏ 1 học sinh khỏi lớp YES
     * @param $id_user
     * @param $id_class
     * @return array
     */
    public  function remove_one($id_user,$id_class){
        $result = $this->model->remove_one($id_user,$id_class);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Xóa học viên khỏi lớp thành công']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Xóa thất bại, phân quyền của bạn không được phép hoặc mục này đã bị xóa từ trước']
        ];
    }

    /**
     * Tìm kiếm thông tin lớp
     * @param $id
     * @return array
     */
    public  function search($id){
        $result = $this->model->search($id);
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

    //??
    public  function count(){

        return [
            'status'=>true,
            'data' => $this->model->count(),
            'message' => []
        ];

    }

}
