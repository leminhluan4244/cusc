<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\UsersModel;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Session;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    protected function authenticated(){
        $accountCode = Auth::user()->id;
        $roles = UsersModel
            ::join('users_has_roles','users_has_roles.u_id','users.id')
            ->where('users.id',$accountCode)
            ->where('users.active',1)
            ->first();
        if(isset($roles)){
            session(['r_id' => $roles->r_id]);
            session(['id_user' => $roles->id]);
        }
        else{
            session(['r_id' => 'error_roles']);
            session(['id_user' => 'error_id']);
        }
        return redirect()->intended($this->redirectPath());
    }
}
