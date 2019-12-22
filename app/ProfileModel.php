<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class ProfileModel extends Model
{
    protected $table = 'profile';
    protected $primaryKey = 'id';
    protected $keyType = 'varchar';
    protected $fillable = ['id', 'name', 'birthday', 'address', 'gender', 'scores', 'created_at', 'updated_at'];

    public function index(){
        $data = $this
            ::join('users_has_roles','users_has_roles.u_id','users.id')
            ::join('roles','roles.r_id','=','users_has_roles.r_id')
            ->join('profile', 'profile.id', 'users.id')
            ->where('users.id',Auth::user()->id)
            ->where('users.active',1)
            ->get();
        return $data;
    }
    public function change(Request $request){
        //cập nhật
        $result = $this::find(Auth::user()->id)
            ->update([
                'phone' => $request->phone,
                'email' => $request->email,
            ]);
        //Tạo profile
        $profile = ProfileModel::find($request->id)
            ->update([
                'name' => $request->name,
                'birthday' => date_format(new DateTime($request->birthday),'Y-m-d'),
                'address' => $request->address,
                'gender' => $request->gender
            ]);
        return isset($result);
    }
}
