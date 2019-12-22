<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class MajorsValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'm_name' => 'required|max:255|unique:majors',
                'm_code' => 'required|max:255|unique:majors',
            ],
            ToolCtrl::$messenger,
            [
                'm_name' => 'Tên chuyên ngành',
                'm_code' => 'Mã chuyên ngành',
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'm_name' => 'required|max:255',
                'm_code' => 'required|max:255',
            ],
            ToolCtrl::$messenger,
            [
                'm_name' => 'Tên chuyên ngành',
                'm_code' => 'Mã chuyên ngành',
            ]
        );
    }
}
