<?php

namespace App\Http\Controllers;

use App\TeacherModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TeacherController extends Controller
{
    public  $model;

    function __construct()
    {
        $this->middleware('auth');
        $this->model = new TeacherModel();
    }
    public function index($id){
        $data = $this->model->index($id);
        $idUser = $id;
        return view('pages.users.assignment', compact('data','idUser'));
    }
    public function list_class(){
        $data = $this->model->index(Auth::user()->id);
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
