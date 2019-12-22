<?php

namespace App\Http\Controllers;
use App\RolesModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

class RolesController extends Controller
{
    public  $apiControl;
    function __construct()
    {
        $this->apiControl = new RolesApiController();
    }

    /**
     * Danh sách các phân quyền YES
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(){
        $result = $this->apiControl->index();
        $data = $result['data'];
        return view('pages.roles.index', compact('data'));
    }

    /**
     * Thêm phân quyền YES
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function create(Request $request){
        $result = $this->apiControl->create($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->route('class/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        if($result['status'] == 'r00')
            return redirect('roles/')->with('success', $result['message']);
        return redirect('roles/')->with('error', $result['message']);
    }

    /**
     * Thay đổi phân quyền YES
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function change(Request $request){
        $result = $this->apiControl->change($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->route('class/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        if($result['status'] == 'r00')
            return redirect('roles/')->with('success', $result['message']);
        return redirect('roles/')->with('error', $result['message']);
    }

    /**
     * Ẩn phân quyền
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function hide($id){
        $result = $this->apiControl->hide($id);
        if($result['status'] == 'r00')
            return redirect('roles/')->with('success', $result['message']);
        return redirect('roles/')->with('error', $result['message']);
    }

    /**
     * Khôi phục phân quyền
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function undo($id){
        $result = $this->apiControl->undo($id);
        if($result['status'] == 'r00')
            return redirect('roles/')->with('success', $result['message']);
        return redirect('roles/')->with('error', $result['message']);
    }

    /**
     * Xóa bỏ phân quyền
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function remove($id){
        $result = $this->apiControl->remove($id);
        if($result['status'] == 'r00')
            return redirect('roles/')->with('success', $result['message']);
        return redirect('roles/')->with('error', $result['message']);
    }


}
