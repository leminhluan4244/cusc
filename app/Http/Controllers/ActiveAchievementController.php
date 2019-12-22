<?php

namespace App\Http\Controllers;

use App\ActiveAchievementModel;
use Illuminate\Http\Request;

class ActiveAchievementController extends Controller
{
    private  $apiControl;

    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new ActiveAchievementApiController();
    }

    /**
     *Lấy danh sách các vai trò kèm theo số người tham gia gửi về view YES
     * @param $id
     * @return view
     */
    public function index($id){
        $result = $this->apiControl->index($id);
        $data = $result['data'];
        return view('pages.achievement.index', compact('data'));
    }

    /**
     * Tạo mới một vai trò YES
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
     * Chỉnh sửa một vai trò YES
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
     * Ẩn một vai trò YES
     * @param $id
     * @return view
     */
    public function hide($id){
        $result = $this->apiControl->hide($id);
        if($result['status']=='r01')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('success', $result['message']);
    }

    /**
     * Khôi phục vai trò bị ẩn YES
     * @param $id
     * @return view
     */
    public function undo($id){
        $result = $this->apiControl->undo($id);
        if($result['status']=='r01')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('success', $result['message']);
    }

    /**
     * Xóa vĩnh diễn một vai trò YES
     * @param $id
     * @return view
     */
    public function remove($id){
        $result = $this->apiControl->remove($id);
        if($result['status']=='r01')
            return redirect()->back()->with('success', $result['message']);
        return redirect()->back()->with('success', $result['message']);
    }

    /**
     * Danh sách các tài khoản thuộc một hoạt động
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function users($id){
        $result = $this->apiControl->users($id);
        $data = $result['data'];
        return view('pages.achievement.users', compact('data'));
    }
    /**
     *     //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
     */










}
