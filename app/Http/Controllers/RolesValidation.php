<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class RolesValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'r_name' => 'required|max:255|unique:roles',
                'r_note' => 'required|max:255',
            ],
            ToolCtrl::$messenger,
            [
                'r_name' => 'Tên phân quyền',
                'r_note' => 'Chú thích phân quyền',
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'r_id' => 'required|max:80|exists:roles,r_id',
                'r_name' => 'required|max:255|unique:roles',
                'r_note' => 'required|max:255',
            ],
            ToolCtrl::$messenger,
            [
                'r_id' => 'Mã phân quyền',
                'r_name' => 'Tên phân quyền',
                'r_note' => 'Chú thích phân quyền',
            ]
        );
    }
}
