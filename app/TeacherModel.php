<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class TeacherModel extends Model
{
    //Bản phân công các lớp thuộc một giáo viên
    public function index($id){
        return UsersModel::join('class', 'users.id','=','class.u_manager_id')
            ->join('majors','majors.m_id','=','class.m_id')
            ->join('school_year','school_year.sy_id','=','class.sy_id')
            ->where('users.id',$id)
            ->where('class.cl_active', 1)
            ->select('class.*')
            ->get();
    }
}
