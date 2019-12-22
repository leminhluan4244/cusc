<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class CategoryChildValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'c_id' => 'required|max:255|exists:category,c_id',
                'cc_item' => 'required|max:255',
                'cc_name' => 'required|max:255',
                'cc_max_scores' => 'required|numeric|max:10000000|min:1',
                'cc_max_amount' => 'required|numeric|max:10000000|min:1',
                'cc_max_scores_cycle' => 'numeric|max:10000000|min:0',
                'r_id' => 'required|array',
                'r_id.*' => 'required|max:80|distinct|exists:roles,r_id',
            ],
            ToolCtrl::$messenger,
            [
                'c_id' => 'ID mục lớn',
                'cc_item' => 'Đề mục',
                'cc_name' => 'Tên mục con',
                'cc_max_scores' => 'Điểm tối đa / 1 lần',
                'cc_max_amount' => 'Lần tối đa / chu kỳ',
                'cc_max_scores_cycle' => 'Điểm giới hạn',
                'r_id' => 'Mảng các phân quyền được phép chấm',
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'cc_id' => 'required|max:255|exists:category_child,cc_id',
                'c_id' => 'required|max:255|exists:category,c_id',
                'cc_item' => 'required|max:255',
                'cc_name' => 'required|max:255',
                'cc_max_scores' => 'required|numeric|max:10000000|min:1',
                'cc_max_amount' => 'required|numeric|max:10000000|min:1',
                'cc_max_scores_cycle' => 'numeric|max:10000000|min:0',
                'r_id' => 'required|array',
                'r_id.*' => 'required|max:80|distinct|exists:roles,r_id',
            ],
            ToolCtrl::$messenger,
            [
                'c_id' => 'ID mục lớn',
                'cc_id' => 'ID mục con',
                'cc_item' => 'Đề mục',
                'cc_name' => 'Tên mục con',
                'cc_max_scores' => 'Điểm tối đa / 1 lần',
                'cc_max_amount' => 'Lần tối đa / chu kỳ',
                'cc_max_scores_cycle' => 'Điểm giới hạn',
                'r_id' => 'Mảng các phân quyền được phép chấm',

            ]
        );
    }
}
