<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class CategoryValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'c_item' => 'required|max:255|unique:category',
                'c_name' => 'required|max:255|unique:category',
                'c_type' => 'required|max:1|min:0',
                'c_max_scores' => 'numeric|max:10000000|min:0',
            ],
            ToolCtrl::$messenger,
            [
                'c_item' => 'Đề mục',
                'c_name' => 'Tên mục lớn',
                'c_type' => 'Loại mục lớn',
                'c_type' => 'Điểm tối đa',
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'c_id' => 'required|max:255|exists:category,c_id',
                'c_item' => 'required|max:255',
                'c_name' => 'required|max:255',
                'c_type' => 'required|max:1|min:0',
                'c_max_scores' => 'numeric|max:10000000|min:0',
            ],
            ToolCtrl::$messenger,
            [
                'c_id' => 'ID mục lớn',
                'c_item' => 'Đề mục',
                'c_name' => 'Tên mục lớn',
                'c_type' => 'Loại mục lớn',
                'c_type' => 'Điểm tối đa',
            ]
        );
    }
}
