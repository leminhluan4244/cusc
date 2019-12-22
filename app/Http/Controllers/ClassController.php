<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ClassController extends Controller
{
    private $apiControl;
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new ClassApiController();
    }

    /**
     * Lấy danh sách lớp YES
     * @return array
     */
    public function index(){
        //Thực thi thao tác
        $result = $this->apiControl->index();
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            $data = $result['data'];
            return view('pages.class.index', compact('data'));
        }
    }

    /**
     * Lấy danh sách học viên YES
     * @param $id
     * @param $id_manager
     * @return view
     */
    public function student($id, $id_manager){
        //Thực thi thao tác
        $result = $this->apiControl->student($id, $id_manager);
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            $data = $result['data'];
            return view('pages.class.list_student', compact('data'));
        }
        else{
            return redirect()->back()->with('error', $result['message']);
        }
    }

    /**
     * Danh sách học viên không thuộc lớp
     * @param $id
     * @return view
     */
    public function exclude($id, $id_manager){
        //Thực thi thao tác
        $result = $this->apiControl->exclude($id,$id_manager);
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            $data = $result['data'];
            return view('pages.class.exclude', compact('data'));
        }
        else{
            return redirect()->back()->with('error', $result['message']);
        }
    }

    /**
     * Thêm một lớp  YES
     * @param Request $request
     * @return view
     */
    public function create(Request $request){
        $result = $this->apiControl->create($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->route('class/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect()->route('class/index')->with('success', $result['message']);
        }
        return redirect()->route('class/index')->with('error', $result['message']);
    }

    /**
     * Sửa đổi thông tin lớp YES
     * @param Request $request
     * @return view
     */
    public function change(Request $request){
        $result = $this->apiControl->change($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->route('class/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect()->route('class/index')->with('success', $result['message']);
        }
        return redirect()->route('class/index')->with('error', $result['message']);
    }

    /**
     * Ẩn YES
     * @param $id
     * @return view
     */
    public function hide($id){
        $result = $this->apiControl->hide($id);
        if($result['status']=='r00')
            return redirect()->route('class/index')->with('success', $result['message']);
        return redirect()->route('class/index')->with('error', $result['message']);
    }

    /**
     * Khôi phục YES
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function undo($id){
        $result = $this->apiControl->undo($id);
        if($result['status']=='r00')
            return redirect()->route('class/index')->with('success', $result['message']);
        return redirect()->route('class/index')->with('error', $result['message']);
    }

    /**
     * Xóa vĩnh viễn
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function remove($id){
        $result = $this->apiControl->remove($id);
        if($result['status']=='r00')
            return redirect()->route('class/index')->with('success', $result['message']);
        return redirect()->route('class/index')->with('error', $result['message']);
    }


    /**
     * Thêm học viên cho lớp YES
     * @param Request $request
     * @return view
     */
    public function add_student(Request $request){
        $result = $this->apiControl->add_student($request);
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect()->back()->with('success', $result['message']);
        }
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Xóa tất cả học viên trong lớp
     * @param $id
     * @return view
     */
    public function remove_all($id){
        $result = $this->apiControl->remove_all($id);
        if($result['status']=='r00') {
            return redirect()->back()->with('success', $result['message']);
        }
        return redirect()->back()->with('error', $result['message']);
    }

    /**
     * Xóa 1 học viên khỏi lớp
     * @param $id_user
     * @param $id_class
     * @return view
     */
    public function remove_one($id_user,$id_class){
        $result = $this->apiControl->remove_one($id_user,$id_class);
        if($result['status']=='r00') {
            return redirect()->back()->with('success', $result['message']);
        }
        return redirect()->back()->with('error', $result['message']);
    }
}
