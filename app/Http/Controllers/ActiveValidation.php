<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class ActiveValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'u_id' => 'required|max:80|exists:users,id',
                'a_name' => 'required|max:255|unique:active',
                'a_begin' => 'required|date',
                'a_end' => 'required|date',
                'a_number' => 'required|numeric|min:0|max:99999999',
            ],
            ToolCtrl::$messenger,
            [
                'u_id' => 'ID người tổ chức sự kiện',
                'a_name' => 'Tên sự kiện',
                'a_begin' => 'Ngày bắt đầu',
                'a_end' => 'Ngày kết thúc',
                'a_number' => 'Số lượng thành viên tham gia',
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'a_id' => 'required|max:80|exists:active,a_id',
                'a_name' => 'required|max:255',
                'a_begin' => 'required|date',
                'a_end' => 'required|date',
                'a_number' => 'required|numeric|min:0|max:99999999',
            ],
            ToolCtrl::$messenger,
            [
                'u_id' => 'ID người tổ chức sự kiện',
                'a_name' => 'Tên sự kiện',
                'a_begin' => 'Ngày bắt đầu',
                'a_end' => 'Ngày kết thúc',
                'a_number' => 'Số lượng thành viên tham gia',
            ]
        );
    }
}
