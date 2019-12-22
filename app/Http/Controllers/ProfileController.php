<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function index(){
        $data = $this->model->index();
            return view('pages.profile.index', compact('data'));
    }

    public function change(Request $request){
        $data = $this->model->change($request);
        return redirect()->route('profile/index')->with('success', 'Cập nhật thành công');;
    }
}
