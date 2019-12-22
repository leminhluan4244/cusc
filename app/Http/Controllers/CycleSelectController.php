<?php

namespace App\Http\Controllers;

use App\CycleSelectModel;
use Illuminate\Http\Request;

class CycleSelectController extends Controller
{
    private $apiControl;
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new CycleSelectApiController();
    }

    /**
     * Danh sách các bộ chọn gôm nhóm theo chu kỳ YES
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(){
        //Thực thi thao tác
        $result = $this->apiControl->index();
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            $data = $result['data'];
        return view('pages.select.index', compact('data'));
        }
    }

    /**
     * Thêm bộ chọn YES
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function create(Request $request){
        $result = $this->apiControl->create($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->back()
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect()->back()->with('success', $result['message']);
        }
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Sửa bộ chọn YES
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function change(Request $request){
        $result = $this->apiControl->change($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->back()
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect()->back()->with('success', $result['message']);
        }
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Ẩn mục YES
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function hide($id){
        $result = $this->apiControl->hide($id);
        if($result['status']=='r00')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Khôi phục YES
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function undo($id){
        $result = $this->apiControl->undo($id);
        if($result['status']=='r00')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Xóa bỏ bộ chọn YES
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function remove($id){
        $result = $this->apiControl->remove($id);
        if($result['status']=='r00')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('error', $result['message']);
    }
}
