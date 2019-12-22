<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class EntityCycleValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'cs_id' => 'required|max:80|exists:cycle_select,cs_id',
                'cy_id' => 'required|max:80|exists:cycle,cy_id',
                'ec_name' => 'required|max:255',
                'ec_begin' => 'required|date',
                'ec_end' => 'required|date',
            ],
            ToolCtrl::$messenger,
            [
                'cs_id' => 'Mã bộ chọn',
                'cy_id' => 'Mã loại chu kỳ',
                'cs_name' => 'Tên giá trị chu kỳ',
                'cs_begin' => 'Thời gian bắt đầu',
                'cs_end' => 'Thời gian kết thúc',
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'ec_id' => 'required|max:80|exists:entity_cycle,ec_id',
                'cs_id' => 'required|max:80|exists:cycle_select,cs_id',
                'cy_id' => 'required|max:80|exists:cycle,cy_id',
                'ec_name' => 'required|max:255',
                'ec_begin' => 'required|date',
                'ec_end' => 'required|date',
            ],
            ToolCtrl::$messenger,
            [
                'ec_id' => 'Mã giá trị chu kỳ',
                'cs_id' => 'Mã bộ chọn',
                'cy_id' => 'Mã loại chu kỳ',
                'cs_name' => 'Tên giá trị chu kỳ',
                'cs_begin' => 'Thời gian bắt đầu',
                'cs_end' => 'Thời gian kết thúc',
            ]
        );
    }
}
