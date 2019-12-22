<?php

namespace App\Http\Controllers;

use App\ActiveModel;
use Illuminate\Http\Request;

class ActiveApiController extends Controller
{
    private $model;
    function __construct()
    {
        $this->model = new ActiveModel();
    }

    /**
     * Hiển thị danh sách theo key YES
     * @param $key
     * @return array
     */
    public function index($key, $keyword){
        $text = "";
        //Kiểm tra sự hợp lệ của key
        switch ($key){
            case 'all':{
                $text = 'Tất cả sự kiện';
                break;
            }

            case 'wait':{
                $text = 'Đang chờ duyệt';
                break;
            }

            case 'coming':{
                $text = 'Sắp diễn ra';
                break;
            }

            case 'happen':{
                $text = 'Đang diễn ra';
                break;
            }

            case 'passed':{
                $text = 'Đã diễn ra';
                break;
            }

            case 'find':{
                $text = 'Danh sách sự kiện (Không bao gồm bản xóa tạm)';
                break;
            }

            default:{
                $text = 'Yêu cầu không hợp lệ';
                return [
                    'status'=>'r02',
                    'data' => [],
                    'key' => $text,
                    'message' => ['Yêu cầu của bạn không hợp lệ, không có nhóm sự kiện '.$key]
                ];
                break;
            }
        }
        $result = $this->model->index($key, $keyword);
        return [
            'status'=>'r00',
            'data' => $result,
            'key' => $text,
            'message' => ['Danh sách '.$text]
        ];
    }

    /**
     * Thêm sự kiện YES
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = ActiveValidation::CreateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        $begin = date('Y-m-d',strtotime($request->a_begin));
        $end = date('Y-m-d',strtotime($request->a_end));
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
                'message' => ['Tạo sự kiện thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Lỗi SQL']
        ];
    }

    /**
     * Sửa sự kiện YES
     * @param Request $request
     * @return array
     */
    public  function change(Request $request){
        // ---Kiểm tra validation trên APIController
        $validate = ActiveValidation::UpdateForm($request);
        if ($validate->fails()){
            return [
                'status'=>'r01',
                'validate' => $validate,
                'message' => ['Lỗi validate']
            ];
        }
        $begin = date('Y-m-d',strtotime($request->a_begin));
        $end = date('Y-m-d',strtotime($request->a_end));
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
                'message' => ['Cập nhật hoạt động thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Cập nhật thất bại']
        ];
    }

    /**
     * Ẩn sự kiện YES
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
                'message' => ['Xóa tạm hoạt động thành công, bạn có thể khôi phục từ Trash']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Xóa thất bại, hoạt động không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Khôi phục sự kiện YES
     * @param $id
     * @return array
     */
    public  function undo($id){
        $result = $this->model->undo($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Khôi phục hoạt động thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Hoạt động đã khôi phục từ trước hoặc đã bị xóa']
        ];
    }

    /**
     * Xóa vĩnh viễn sự kiện YES
     * @param $id
     * @return array
     */
    public  function remove($id){
        $result = $this->model->remove($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Hoạt động cùng các thông tin liên quan đã xóa']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Xóa thất bại, hoạt động không thể xóa hoặc đã bị xóa từ trước']
        ];
    }

    /**
     * Đếm số thành viên tham gia sự kiện YES
     */
    public  function count($id){
        return [
            'status'=>'r00',
            'data' => $this->model->count($id),
            'message' => []
        ];
    }

    /**
     * Tìm kiếm sự kiện YES
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
     * Duyệt sự kiện
     * @param $id
     * @return array
     */
    public  function approved($id){
        $result = $this->model->approved($id);
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Phê duyệt thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Phê duyệt thất bại']
        ];
    }
}
