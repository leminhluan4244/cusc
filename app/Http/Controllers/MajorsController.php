<?php

namespace App\Http\Controllers;

use App\MajorsModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MajorsController extends Controller
{
    private $apiControl;
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new MajorsApiController();
    }

    /**
     * Danh sách chuyên ngành YES
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(){
        //Thực thi thao tác
        $result = $this->apiControl->index();
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            $data = $result['data'];
            return view('pages.majors.index', compact('data'));
        }
    }

    /**
     * Thêm chuyên ngành YES
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function create(Request $request){
        $result = $this->apiControl->create($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->route('majors/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect()->route('majors/index')->with('success', $result['message']);
        }
        return redirect()->route('majors/index')->with('error', $result['message']);
    }

    /**
     * Sửa chuyên ngành YES
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function change(Request $request){
        $result = $this->apiControl->change($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->route('majors/index')
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return redirect()->route('majors/index')->with('success', $result['message']);
        }
        return redirect()->route('majors/index')->with('error', $result['message']);
    }

    /**
     * Xóa tạm chuyên ngành YES
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function hide($id){
        $result = $this->apiControl->hide($id);
        if($result['status']=='r00')
            return redirect()->route('majors/index')->with('success', $result['message']);
        return redirect()->route('majors/index')->with('error', $result['message']);
    }

    /**
     * Khôi phục chuyên ngành YES
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function undo($id){
        $result = $this->apiControl->undo($id);
        if($result['status']=='r00')
            return redirect()->route('majors/index')->with('success', $result['message']);
        return redirect()->route('majors/index')->with('error', $result['message']);
    }

    /**
     * Xóa vĩnh viễn chuyên ngành YES
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function remove($id){
        $result = $this->apiControl->remove($id);
        if($result['status']=='r00')
            return redirect()->route('majors/index')->with('success', $result['message']);
        return redirect()->route('majors/index')->with('error', $result['message']);
    }
}
