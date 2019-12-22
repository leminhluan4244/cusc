<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RolesCreate extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'r_name' => 'required|unique:roles|max:255',
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @ return  array
     */
    public function messages()
    {
        return [
            'status'=>false,
            'data' => [],
            'message' => [
                'r_name.required' => 'Không được để trống tên phân quyền',
                'r_name.unique' => 'Tên phân quyền bị trùng',
                'r_name.max' => 'Tên không được dài hơn 255 ký tự',
            ]
        ];
//        return [
//            'r_name.required' => 'Không được để trống tên phân quyền',
//            'r_name.unique' => 'Tên phân quyền bị trùng',
//            'r_name.max' => 'Tên không được dài hơn 255 ký tự',
//        ];
    }


}
