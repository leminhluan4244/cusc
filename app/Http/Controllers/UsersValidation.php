<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;


class UsersValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'cusc_id' => 'required|max:20|unique:users',
                'name' => 'required|max:255',
                'email' => 'required|email|unique:users',
                'phone' => 'required|numeric|min:10',
                'birthday' => 'required|date|before:-5 years',
                'gender' => 'required|max:1|numeric',
                'address' => 'required',
                'r_id' => 'required|exists:roles,r_id'

            ],
            ToolCtrl::$messenger,
            [
                'cusc_id' => 'CUSC ID',
                'name' => 'Tên',
                'email' => 'Email',
                'phone' => 'SĐT',
                'birthday' => 'Ngày sinh',
                'gender' => 'Giới tính',
                'address' => 'Địa chỉ',
                'r_id' => 'Phân quyền'
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'id' => 'required|max:80|exists:users,id',
                'cusc_id' => 'required|max:20',
                'name' => 'required|max:255',
                'email' => 'required|email',
                'phone' => 'required|numeric|min:10',
                'birthday' => 'required|date|before:-13 years',
                'gender' => 'required|max:1|numeric',
                'address' => 'required',
                'r_id' => 'required|exists:roles,r_id'
            ],
            ToolCtrl::$messenger,
            [
                'id' => 'Mã tài khoản',
                'cusc_id' => 'CUSC ID',
                'name' => 'Tên',
                'email' => 'Email',
                'phone' => 'SĐT',
                'birthday' => 'Ngày sinh',
                'gender' => 'Giới tính',
                'address' => 'Địa chỉ',
                'r_id' => 'Phân quyền'
            ]
        );
    }

    public static function ResetPass(Request $request){
        return Validator::make(
            $request->all(),
            [
                'users_id' => 'required|max:80|exists:users,id',
                'old_pass' => 'required|max:255',
                'new_pass' => 'required|max:255',
                're_new_pass' => 'required|max:255',
            ],
            ToolCtrl::$messenger,
            [
                'users_id' => 'Mã tài khoản',
                'old_pass' => 'Mật khẩu cũ',
                'new_pass' => 'Mật khẩu mới',
                're_new_pass' => 'Nhập lại mật khẩu mới',
            ]
        );
    }
}
