<?php

namespace App\Http\Controllers;

use App\PermissionModel;
use App\UsersHasRolesModel;
use App\UsersModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RouteViewController extends Controller
{
    public static function routeView($route){
        //Lấy ra phân quyền người dùng
        $role = UsersHasRolesModel::where('u_id',Auth::user()->id)->first();
        $role = $role->r_id;
        //Kiểm chức trong lớp Premission xem người này có được vào route này hay không
        $isAccess = PermissionModel
            ::where('r_id', $role)
            ->where('pm_route',$route)
            ->first();
        return isset($isAccess);
    }
}
