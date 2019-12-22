<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class ClassValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'cl_name' => 'required|max:255|unique:class',
                'cl_code' => 'required|max:255|unique:class',
                'u_manager_id' => 'required|max:80|exists:users,id',
                'sy_id' => 'required|max:80|exists:school_year,sy_id',
                'm_id' => 'required|max:80|exists:majors,m_id',
            ],
            ToolCtrl::$messenger,
            [
                'cl_name' => 'Tên lớp',
                'cl_code' => 'Mã lớp',
                'u_manager_id' => 'Giáo viên chủ nhiệm',
                'sy_id' => 'Niên khóa',
                'm_id' => 'Chuyên ngành',
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'cl_id' => 'required|max:255|exists:class,cl_id',
                'cl_name' => 'required|max:255',
                'cl_code' => 'required|max:255',
                'u_manager_id' => 'required|max:80|exists:users,id',
                'sy_id' => 'required|max:80|exists:school_year,sy_id',
                'm_id' => 'required|max:80|exists:majors,m_id',
            ],
            ToolCtrl::$messenger,
            [
                'cl_id' => 'Mã code lớp',
                'cl_name' => 'Tên lớp',
                'cl_code' => 'Mã lớp',
                'u_manager_id' => 'Giáo viên chủ nhiệm',
                'sy_id' => 'Niên khóa',
                'm_id' => 'Chuyên ngành',
            ]
        );
    }

    public static function ArrayInput(Request $request){
        return Validator::make(
            $request->all(),
            [
                'cl_id' => 'required|max:80|exists:class,cl_id',
                'list_id' => 'required|array',
                'list_id.*' => 'required|max:80|distinct|exists:users,id',
            ],
            ToolCtrl::$messenger,
            [
                'cl_id' => 'Mã lớp',
                'user_id' => 'Mã học viên',
            ]
        );
    }
}
