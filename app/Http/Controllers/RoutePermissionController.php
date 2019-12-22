<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RoutePermissionController extends Controller
{
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new RoutePermissionApiController();
    }


    /**
     * Kết quả thao tác thêm YES
     * @param Request $request
     * @return Kết quả thao tác thêm
     */
    public function create(Request $request){
        $result = $this->apiControl->create($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->route('roles/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect('roles')->with('success', $result['message']);
        }
        return redirect('roles')->with('error', $result['message']);
    }
}
