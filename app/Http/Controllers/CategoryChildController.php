<?php

namespace App\Http\Controllers;

use App\CategoryChildModel;
use App\CategoryModel;
use Illuminate\Http\Request;

class CategoryChildController extends Controller
{
    private $apiControl;
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new CategoryChildApiController();
    }

    /**
     * Lấy index mục con NO
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(){
        $result = $this->apiControl->index();
        $data = $result['data'];
        return view('pages.category.index', compact('data'));
    }

    /**
     * Tạo mới mục con YES
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
        if($result['status']=='r00')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Cập nhật mục con YES
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
        if($result['status']=='r00')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Ẩn mục con YES
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
     * Khôi phục mục con YES
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
     * Xóa vĩnh viễn mục con YES
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
