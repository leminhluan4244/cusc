<?php

namespace App\Http\Controllers;

use App\ProfileModel;
use App\RolesModel;
use App\UsersHasRolesModel;
use App\UsersModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Excel;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpKernel\Profiler\Profile;


class ExcelImportController extends Controller
{
    /**
     * Import dữ liệu vào excel
     * @param Request $request
     * @return view
     */
    public function importExcel(Request $request)
    {
        if($request->hasFile('import_file')){
            $path = $request->file('import_file')->getRealPath();
            $data = Excel::load($path,function($reader) {})->get();
            $err = [];
            if(!empty($data) && $data->count()){
                foreach ($data as $key => $value) {
                    $user = [
                        'id' => time()+$key,
                        'cusc_id' => (string)$value->cusc_id,
                        'password' => Hash::make($value->password),
                        'phone' => (string)$value->phone,
                        'email' => (string)$value->email,
                        'active' => 1,
                        'scores' => 0
                    ];
                    $profile = [
                        'id' => $user['id'],
                        'name' => (string)$value->name,
                        'birthday' => $value->birthday->format('Y-m-d'),
                        'address' => (string)$value->address,
                        'gender' => (int)$value->gender
                    ];
                    $roles = [
                        'ur_id' => time()+$key,
                        'u_id' => $user['id'],
                        'r_id' => '1b83df7a91f51b3d32cf6bda5b0fd23f',
                    ];

                    $checkuser = UsersModel::insert($user);
                    $checkprofile = ProfileModel::insert($profile);
                    $checkrole = UsersHasRolesModel::insert($roles);

                    if(!$checkuser || !$checkprofile || !$checkrole){
                        UsersModel::find($user['id'])->delete();
                        ProfileModel::find($user['id'])->delete();
                        array_push($err, $key+1);
                    }
                }
            }
            return redirect()->route('users/index', ['role' => '1b83df7a91f51b3d32cf6bda5b0fd23f'])->with('error', $err);
        }
    }
}
