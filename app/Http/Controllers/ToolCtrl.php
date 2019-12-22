<?php

namespace App\Http\Controllers;

use App\RolesModel;
use App\UsersHasRolesModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class ToolCtrl extends Controller
{
    public static $messenger= [
        'required' => ':attribute không được để trống',
        'min' => ':attribute không được nhỏ hơn :min',
        'max' => ':attribute không được lớn hơn :max',
        'integer' => ':attribute chỉ được nhập số',
        'date' => ':attribute phải có định dạng ngày tháng',
        'before' => ':attribute phải trên :before tuổi',
        'email' => ':attribute phải có định dạng kiểu email',
        'phone' => ':attribute phải có kiểu số',
        'unique' => ':attribute đã bị trùng, vui lòng chọn giá trị khác',
        'exists' => 'Giá trị :attribute không tồn tại',
        'numeric' => 'Giá trị :attribute phải là giá trị số',
        'array' => 'Giá trị :attribute phải là mảng các key',
        'distinct' => 'Giá trị :attribute bị trùng',
    ];

    /**
     * Kiểm tra tài khoản có phải là cán bộ hay không YES
     */
    public static function accuracyRolesStaff($id){
        $result = UsersHasRolesModel
            ::whereNotIn('r_id',[
                '0826eaf8086b01749bf7ff65742a200c',
                '08cd66cb6b012217ed32cb8662a2a1d9',
                '1b83df7a91f51b3d32cf6bda5b0fd23f',
                'b2cba2a7a5499bd67320ba3d4046dc2e'
            ])
            ->where('u_id',$id)
            ->first();
        if(isset($result)) return true;
        return false;
    }

    /***
     * Kiểm tra xem tất cả tài khoản thuộc
     * $listScan có thuộc một trong các phân quyền trong mảng
     * $roleExpectationsList không YES
     * @param $listScan : Danh sách tài khoản cần quét
     * @param $roleExpectationsList : Mảng phân quyền mong đợi
     * @return bool, đúng thì trả ra true, sai trả false
     */
    public static  function accuracyRolesToListAccount($listScan,$roleExpectationsList){
        //Dò số dòng có tài khoản thuộc mảng account đưa vào, và phân quyền thuộc danh sách phân quyền truyền vào
        $listResult = UsersHasRolesModel
            ::whereIn('u_id',$listScan)
            ->whereIn('r_id',$roleExpectationsList)
            ->count();
        if(count($listScan) > $listResult) return false;
        return  true;
    }

    /**Kiểm tra tài khoản có thuộc lớp liên kết nào đó hay không YES
     * @param $accountID : id tài khoản
     * @param $tableName : tên bảng liên kết
     * @param $keyCode : trường kiểm tra liên kết
     * @param $keCodeExpectations : giá trị mong đợi để so sánh
     * @return bool : đúng trả về true, sai trả về falses
     */
    public static function accuracyAccount($accountID, $tableName, $keyCode, $keCodeExpectations ){
        //Nếu là admin thì không cần kiểm tra mà cho phép thực hiện
        $isAdmin = UsersHasRolesModel
            ::where('u_id', $accountID)
            ->where('r_id', '08cd66cb6b012217ed32cb8662a2a1d9')
            ->first();
        if(isset($isAdmin)) return true;
        //Kiểm tra id tài khoản có thuộc lớp liên kết mong đợi
        $findResult = DB
            //Dò với tên table
            ::table($tableName)
            //Kiểm tra trường $keyCode có kết quả nào bằng $keCodeExpectations hay không
            ->where($keyCode,$keCodeExpectations)
            //Với điều kiện là id tài khoản truyền vào
            ->where('u_id', $accountID)
            ->first();
        if(isset($findResult)) return true;
        else return false;
    }

    /**
     * Kiểm tra xem id đưa vào có phải của một cố vấn hay không
     * @param $accountID
     * @return bool
     */
    public static function isTeacher($accountID){
        $isRessult  =  UsersHasRolesModel
            ::where('u_id', $accountID)
            ->where('r_id', '0826eaf8086b01749bf7ff65742a200c')
            ->first();
        return isset($isRessult);
    }
    //Lấy key phân quyền của người đăng nhập
    public static function getRolesID(){
        $role = UsersHasRolesModel
            ::where('u_id', Auth::user()->id)
            ->select('users_has_roles.r_id')
            ->first();
        if(!empty($role)) return $role->r_id;
        return false;
    }

    //Kiểm tra phân quyền xem có tồn tại không
    public static function checkedRole($id){
        $role = RolesModel::find($id);
        if(!empty($role)) return $role->r_id;
        return false;
    }
}
