<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class ActiveAchievementValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'a_id' => 'required|max:80|exists:active,a_id',
                'c_id' => 'required|max:80|exists:category,c_id',
                'cc_id' => 'required|max:80|exists:category_child,cc_id',
                'aa_name' => 'required|max:255',
                'aa_scores' => 'required|max:99999999|numeric',

            ],
            ToolCtrl::$messenger,
            [
                'a_id' => 'Mã hoạt động',
                'c_id' => 'Mã mục lớn',
                'cc_id' => 'Mã mục con',
                'aa_name' => 'Tên phân công',
                'aa_scores' => 'Số điểm cộng',
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'aa_id' => 'required|max:80|exists:active_achievement,aa_id',
                'a_id' => 'required|max:80|exists:active,a_id',
                'c_id' => 'required|max:80|exists:category,c_id',
                'cc_id' => 'required|max:80|exists:category_child,cc_id',
                'aa_name' => 'required|max:255',
                'aa_scores' => 'required|max:99999999|numeric',
            ],
            ToolCtrl::$messenger,
            [
                'aa_id' => 'Mã vai trò',
                'a_id' => 'Mã hoạt động',
                'c_id' => 'Mã mục lớn',
                'cc_id' => 'Mã mục con',
                'aa_name' => 'Tên phân công',
                'aa_scores' => 'Số điểm cộng',
            ]
        );
    }

    public static function ArrayInput(Request $request){
        return Validator::make(
            $request->all(),
            [
                'aa_id' => 'required|max:80|exists:active_achievement,aa_id',
                'user_id' => 'required|array',
                'user_id.*' => 'required|max:80|distinct|exists:users,id',
            ],
            ToolCtrl::$messenger,
            [
                'aa_id' => 'Mã vai trò',
                'user_id' => 'Mã học viên',
            ]
        );
    }
}
