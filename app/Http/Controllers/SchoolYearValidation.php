<?php

namespace App\Http\Controllers;

use Validator;
use Illuminate\Http\Request;

class SchoolYearValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'sy_name' => 'required|max:255|unique:school_year',
                'sy_begin' => 'required|max:255|date',

            ],
            ToolCtrl::$messenger,
            [
                'sy_name' => 'Tên niên khóa',
                'sy_begin' => 'Ngày bắt đầu',
            ]
        );
    }
    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'sy_id' => 'required|max:80|exists:school_year,sy_id',
                'sy_name' => 'required|max:255',
                'sy_begin' => 'required|max:255|date',

            ],
            ToolCtrl::$messenger,
            [
                'sy_id' => 'Mã niên khóa',
                'sy_name' => 'Tên niên khóa',
                'sy_begin' => 'Ngày bắt đầu',
            ]
        );
    }
}
