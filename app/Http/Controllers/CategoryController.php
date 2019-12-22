<?php

namespace App\Http\Controllers;

use App\CategoryModel;
use App\ClassModel;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    private $apiControl;
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new CategoryApiController();
    }

    /**
     * Danh sách kèm mục con YES
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(){
        //Thực thi thao tác
        $result = $this->apiControl->index();
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            $data = $result['data'];
            return view('pages.category.index', compact('data'));
        }
    }

    /**
     * Thêm mục lớn YES
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function create(Request $request){
        $result = $this->apiControl->create($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->route('category/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect()->route('category/index')->with('success', $result['message']);
        }
        return redirect()->route('category/index')->with('error', $result['message']);
    }

    /**
     * Sửa mục lớn YES
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function change(Request $request){
        $result = $this->apiControl->change($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->route('category/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect()->route('category/index')->with('success', $result['message']);
        }
        return redirect()->route('category/index')->with('error', $result['message']);
    }

    /**
     * Ẩn mục lớn YES
     */
    public function hide($id){
        $result = $this->apiControl->hide($id);
        if($result['status']=='r00')
            return redirect()->route('category/index')->with('success', $result['message']);
        return redirect()->route('category/index')->with('error', $result['message']);
    }

    /**
     * Khôi phục mục lớn
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function undo($id){
        $result = $this->apiControl->undo($id);
        if($result['status']=='r00')
            return redirect()->route('category/index')->with('success', $result['message']);
        return redirect()->route('category/index')->with('error', $result['message']);
    }

    /**
     * Xóa vĩnh diễn mục lớn
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function remove($id){
        $result = $this->apiControl->remove($id);
        if($result['status']=='r00')
            return redirect()->route('category/index')->with('success', $result['message']);
        return redirect()->route('category/index')->with('error', $result['message']);
    }
}
