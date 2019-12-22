<?php

namespace App\Http\Controllers;

use App\ResultPointModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ResultPointApiController extends Controller
{
    public $model;
    function __construct()
    {
        $this->model = new ResultPointModel();
    }

    public function result($id){
        $data = $this->model->result($id);
        return $data;
    }
    public function info($id){
        $result = $this->model->info($id);
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Chi tiết điểm']
        ];
    }

    public function child_detail(Request $request){
        $result = $this->model->child_detail($request);
        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Chi tiết điểm mục con']
        ];
    }

    /***
     * API gọi đến hàm thêm điểm học viên trong chu kỳ
     * @param Request $request
     * @return array
     */
    public  function create(Request $request){
        $request->users_id = Auth::user()->id;
        $result = $this->model->create($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Thêm kết quả cộng điểm thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Bạn không được phép chấm mục này']
        ];
    }

    /***
     * API gọi đến hàm thêm điểm học viên trong chu kỳ
     * @param Request $request
     * @return array
     */

    public function change(Request $request){
        $result = $this->model->change($request);
        // ---Return kết quả thao tác post/get trên APIController
        if($result)
            return [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Cập nhật điểm thành công']
            ];
        return [
            'status'=>'r02',
            'data' => [],
            'message' => ['Tài khoản của bạn không được phép thực hiện thao tác này']
        ];
    }

    public function remove(Request $request){
        $result = $this->model->remove($request);
        if($result)
            return [
                'status'=>'r00',
                'data' => [],
                'message' => ['Điểm đã xóa']
            ];
        return [
            'status'=>'r01',
            'data' => [],
            'message' => ['Xóa thất bại, mục đã xóa từ trước hoặc tài khoản của bạn không được phép']
        ];
    }

    /***
     * Gọi đến lớp thực thi chốt chu kỳ hiện tại và khởi động chu kỳ mới
     * @param Request $request : Dữ liệu đầu vào
     * id_cusc, password, id giá trị chu kỳ tiếp theo
     * @return array: mảng chứa kết quả thực thi
     */
    public function success(Request $request){
        $result = $this->model->successPoint($request);
        if($result === 'authUser'){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Tài khoản này không tồn tại, hoặc bạn đang nhập tài khoản từ người khác']
            ];
        }
        else if($result==='authPass'){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Nhập sai mật khẩu']
            ];
        }
        else if($result === 'notEntity'){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Chu kỳ mặc định không tồn tại']
            ];
        }
        else if ($result==='notNextEntity'){
            return [
                'status'=>'r02',
                'data' => [],
                'message' => ['Chu kỳ tiếp theo không tồn tại']
            ];
        }

        return [
            'status'=>'r00',
            'data' => $result,
            'message' => ['Chốt chu kỳ thành công, chu kỳ mới của bạn đã được khởi động']
        ];

    }


    /***
     * Lấy ra danh sách các chu kỳ có thể làm chu kỳ mặc định
     * @param $id
     * @param $child
     * @return array
     */
    public function nextEntity($id, $child){
            $result = $this->model->nextEntity($id, $child);
            if(sizeof($result))
                return [
                    'status'=>true,
                    'data' => $result,
                    'message' => ['Danh sách chu kỳ']
                ];
            return [
                'status'=>false,
                'data' => [],
                'message' => ['Không tìm ra danh sách chu kỳ khác']
            ];
    }

    /***
     * @param Request $request
     * id_category : id mục lớn
     * id_child : id mục con
     * id_student : id học viên
     * @return array : mục điểm hiện tại của một học viên
     */
    public function getPointOnChild(Request $request){
        //Lấy dữ liệu đồng thời bỏ qua các mục ẩn
        $result = $this->model->getPointOnChild($request);
        if(!isset($result) || sizeof($result) == 0){
            return
            [
                'status'=>'r00',
                'data' => [],
                'message' => ['Danh sách các rỗng']
            ];

        }else{
        //Return kết quả thao tác post/get trên APIController
            return
            [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Danh sách các cột điểm']
            ];
        }
    }

    /***
 * @param Request $request
 * id_category : id mục lớn
 * id_child : id mục con
 * id_student : id học viên
 * @return array : mục điểm tích lũy của một học viên
 */
    public function getLogOnChild(Request $request){
        //Lấy dữ liệu đồng thời bỏ qua các mục ẩn
        $result = $this->model->getLogOnChild($request);
        if(!isset($result) || sizeof($result) == 0){
            return
                [
                    'status'=>'r00',
                    'data' => [],
                    'message' => ['Danh sách các rỗng']
                ];

        }else{
            //Return kết quả thao tác post/get trên APIController
            return
                [
                    'status'=>'r00',
                    'data' => $result,
                    'message' => ['Danh sách các cột điểm']
                ];
        }
    }

    /***
     * @param Request $request
     * id_category : id mục lớn
     * id_child : id mục con
     * id_student : id học viên
     * @return array : mục điểm tích lũy của một học viên
     */
    public function getChildSuggest(Request $request){
        //Lấy dữ liệu đồng thời bỏ qua các mục ẩn
        $result = $this->model->getChildSuggest($request);
        if(!isset($result) || sizeof($result) == 0){
            return
                [
                    'status'=>'r00',
                    'data' => [],
                    'message' => ['Danh sách các rỗng']
                ];

        }else{
            //Return kết quả thao tác post/get trên APIController
            return
                [
                    'status'=>'r00',
                    'data' => $result,
                    'message' => ['Danh sách các gợi ý']
                ];
        }
    }

    /***
     * @param Request $request
     * id_category : id mục lớn
     * id_child : id mục con
     * id_student : id học viên
     * @return array điểm chu kỳ hiện tại cho một mục con của học sinh
     */
    public function getSumPointOnChild(Request $request){
        //Lấy dữ liệu đồng thời bỏ qua các mục ẩn
        $result = $this->model->getSumPointOnChild($request);
        if(!isset($result)){
            return
            [
                'status'=>'r02',
                'data' => 0,
                'message' => ['Dữ liệu không hợp lệ khi tiến hành tính điểm']
            ];

        }else{
        //Return kết quả thao tác post/get trên APIController
            return
            [
                'status'=>'r00',
                'data' => $result,
                'message' => ['Danh sách các cột điểm']
            ];
        }
    }

}
