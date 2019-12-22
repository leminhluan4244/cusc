<?php

namespace App\Http\Controllers;

use App\ActiveModel;
use Illuminate\Http\Request;

class ActiveController extends Controller
{

    private  $apiControl;
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new ActiveApiController();
    }

    /**
     * Danh sách các hoạt động truy xuất theo key YES
     * @param $key
     * @return view
     */
    public function index($key,$keyword){
        //Thực thi thao tác
        $result = $this->apiControl->index($key,$keyword);
        //Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            $data = $result['data'];
            $keyName = $result['key'];
            return view('pages.active.index', compact('data', 'keyName'));
        }
        else{
            return redirect()->back()->with('error', $result['message']);
        }
    }

    /**
     * Thêm sự kiện YES
     * @param Request $request
     * @return view
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
     * Sửa sự kiện YES
     * @param Request $request
     * @return view
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
     * Ẩn sự kiện YES
     * @param $id
     * @return view
     */
    public function hide($id){
        $result = $this->apiControl->hide($id);
        if($result['status']=='r00')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Khôi phục sự kiện YES
     * @param $id
     * @return view
     */
    public function undo($id){
        $result = $this->apiControl->undo($id);
        if($result['status']=='r00')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Xóa vĩnh viễn sự kiện YES
     * @param $id
     * @return view
     */
    public function remove($id){
        $result = $this->apiControl->remove($id);
        if($result['status']=='r00')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Xác nhận duyệt một sự kiện YES
     * @param $id
     * @return view
     */
    public function approved($id){
        $result = $this->apiControl->approved($id);
        if($result['status'])
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('error', $result['message']);
    }
}
