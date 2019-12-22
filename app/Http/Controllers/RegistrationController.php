<?php

namespace App\Http\Controllers;

use App\ClassModel;
use App\RegistrationModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RegistrationController extends Controller
{
    private $apiControl;
    function __construct()
    {

        $this->middleware('auth');
        $this->apiControl = new RegistrationApiController();
    }

    /**
     * Bảng đăng ký của một học viên YES
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
//    public function index(){
//        $data = $this->model->index();
//        return view('pages.point.index', compact('data'));
//    }

//    public function class($id){
//        $data = (new ClassModel())->student($id);
//        return view('pages.point.list_student', compact('data'));
//    }

    /**
     * Bảng đăng ký của một học viên YES
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function registration($id){
        $result = $this->apiControl->registration($id, Auth::user()->id);
        if($result['status']=='r00'){
            $data = $result['data'];
            return view('pages.point.registration', compact('data'));
        }
        else{
            return redirect()->back()->with('error', $result['message']);
        }
    }

    /**
     * Thay đổi đăng ký của một học viên YES
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function change(Request $request){
        $result = $this->apiControl->change($request);
        if($result['status'] = 'r00')
            return redirect()->route('point/registration',['id'=>$request->u_id])->with('success', $result['message']);
        return redirect()->route('point/registration',['id'=>$request->u_id])->with('error', $result['message']);
    }


}
