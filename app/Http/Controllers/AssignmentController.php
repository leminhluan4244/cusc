<?php

namespace App\Http\Controllers;

use App\AssignmentModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AssignmentController extends Controller
{
    private $model;
    private $apiControl;

    function __construct()
    {
        $this->middleware('auth');
        $this->model = new AssignmentModel();
        $this->apiControl = new AssignmentApiController();
    }

    /**
     * Danh sách các lớp phân công cho một tài khoản chấm điểm YES
     * @param $id
     * @return array : danh sách kết quả
     */
    public function index($id){
        $result = $this->apiControl->index($id);
        if($result['status'] == 'r00'){
            $idUser = $id;
            $data = $result['data'];
            return view('pages.users.assignment', compact('data','idUser'));
        }
        else{
            return redirect()->back()->with('error', $result['message']);
        }

    }













    public function list_class(){
        $data = $this->model->list_class();
        return view('pages.employee.index', compact('data'));
    }

    public function result($id){
        //Kiểm tra xem sinh viên có thuộc lớp được phép không
        $checkOnClass =  $this
            ->model
            ->join('class','class.cl_id','assignment.cl_id')
            ->join('users_has_class','users_has_class.cl_id','=','class.cl_id')
            ->where('class.cl_active',1)
            ->where('users_has_class.u_id',$id)
            ->where('assignment.u_id', Auth::user()->id)
            ->get();
        if(sizeof($checkOnClass)<=0){
            return view('pages.profile.error');
        }
        $data = $this->model->result($id);
        return view('pages.employee.result', compact('data'));
    }

}
