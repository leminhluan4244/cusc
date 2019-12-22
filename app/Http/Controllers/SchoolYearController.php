<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Auth\arrayListRoute;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SchoolYearController extends Controller
{
    private $apiControl;
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new SchoolYearApiController();
    }

    /**
     * Trang danh sách các năm học YES
     * @return
     */
    public function index(){
        $result = $this->apiControl->index();
        // ---Return kết quả dữ liệu
        $data = $result['data'];
        return view('pages.schoolyear.index', compact('data'));
    }

    /**
     * Thêm niên khóa YES
     * @param Dữ liệu form thêm niên khóa
     * @return Kết quả thêm
     */
    public function create(Request $request){
        $result = $this->apiControl->create($request);
        // ---Return view báo lỗi validation nếu có
        if (isset($result['validate'])) {
            return redirect()->route('year/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post
        if($result['status']=='r00'){
            return redirect('year')->with('success', $result['message']);
        }
        return redirect('year')->with('error', $result['message']);
    }

    /**
     * Sửa niên khóa YES
     * @param Dữ liệu form sửa niên khóa
     * @return Kết quả sửa
     */
    public function change(Request $request){
        $result = $this->apiControl->change($request);
        // ---Return view báo lỗi validation nếu có
        if (isset($result['validate'])) {
            return redirect()->route('year/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post trên Controller
        if($result['status']=='r00'){
            return redirect('year')->with('success', $result['message']);
        }
        return redirect('year')->with('error', $result['message']);
    }

    /**
     * Ẩn niên khóa YES
     * @param $id Niên khóa cần xóa logic
     * @return Kết quả thao tác xóa logic
     */
    public function hide($id){
        $result = $this->apiControl->hide($id);        
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect('year')->with('success', $result['message']);
        }
        return redirect('year')->with('error', $result['message']);
    }

    /**
     * Khôi phục niên khóa YES
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
	public function undo($id){
        $result = $this->apiControl->undo($id);        
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect('year')->with('success', $result['message']);
        }
        return redirect('year')->with('error', $result['message']);
    }

    /**
     * Xóa vĩnh viễn niên khóa YES
     * @param $id mục sẽ xóa vĩnh diễn
     * @return Kết quả thao tác xóa
     */
    public function remove($id){
        $result = $this->apiControl->remove($id);
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect('year')->with('success', $result['message']);
        }
        return redirect('year')->with('error', $result['message']);
    }

}
