<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class CycleValidation extends Controller
{
    public static function CreateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'cy_name' => 'required|max:255|unique:cycle',
                'cy_long' => 'required|max:255',
            ],
            ToolCtrl::$messenger,
            [
                'cy_name' => 'Tên chu kỳ',
                'cy_long' => 'Độ dài chu kỳ',
            ]
        );
    }

    public static function UpdateForm(Request $request){
        return Validator::make(
            $request->all(),
            [
                'cy_id' => 'required|max:255|exists:cycle,cy_id',
                'cy_name' => 'required|max:80',
                'cy_long' => 'required|max:255',
            ],
            ToolCtrl::$messenger,
            [
                'cy_id' => 'Mã chu kỳ',
                'cy_name' => 'Tên chu kỳ',
                'cy_long' => 'Độ dài chu kỳ',
            ]
        );
    }
}
