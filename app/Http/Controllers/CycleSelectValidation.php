<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class CycleSelectValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'cs_name' => 'required|max:255|unique:cycle_select',
                'cs_begin' => 'required|max:255',
                'cs_end' => 'required|max:255',
                'cy_id' => 'required|max:80|exists:cycle,cy_id',
            ],
            ToolCtrl::$messenger,
            [
                'cs_name' => 'Tên bộ chọn',
                'cs_begin' => 'Thời gian bắt đầu',
                'cs_end' => 'Thời gian kết thúc',
                'cy_id' => 'Chu kỳ',
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'cs_id' => 'required|max:80|exists:cycle_select,cs_id',
                'cs_name' => 'required|max:255',
                'cs_begin' => 'required|max:255',
                'cs_end' => 'required|max:255',
                'cy_id' => 'required|max:80|exists:cycle,cy_id',
            ],
            ToolCtrl::$messenger,
            [
                'cs_id' => 'ID bộ chọn',
                'cs_name' => 'Tên bộ chọn',
                'cs_begin' => 'Thời gian bắt đầu',
                'cs_end' => 'Thời gian kết thúc',
                'cy_id' => 'Chu kỳ',
            ]
        );
    }
}
