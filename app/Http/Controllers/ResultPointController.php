<?php

namespace App\Http\Controllers;

use App\RegistrationModel;
use App\ResultPointModel;
use Illuminate\Http\Request;

class ResultPointController extends Controller
{
    private $apiControl;
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new ResultPointApiController();
    }

    /**
     * Bảng kết quả học viên YES
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function result($id){
        $data = $this->apiControl->result($id);
        return view('pages.result.index', compact('data'));
    }

    /***
     * Thực thi xác nhận chu kỳ khi gọi đến lớp API YES
     * @param Request $request : Đầu vào dữ liệu
     * id_cusc, password, id giá trị chu kỳ tiếp theo
     * @return \Illuminate\Http\RedirectResponse : Lại view giá trị chu kỳ sau khi submit thành công
     */
    public function success(Request $request){
        $result = $this->apiControl->success($request);
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect('/entity')->with('success', $result['message']);
        }
        return redirect('/entity')->with('success', $result['message']);
    }

}
