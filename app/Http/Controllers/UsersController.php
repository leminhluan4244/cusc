<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Auth\arrayListRoute;
use App\UsersHasRolesModel;
use App\UsersModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class UsersController extends Controller
{
    private $apiControl;
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new UsersApiController();
    }

    /**
     * Lấy danh sách theo roles YES
     * @param $role, mã phân quyền
     * @return view
     * pages.users.teacher
     * pages.users.admin
     * pages.users.student
     * pages.users.wait
     * pages.users.employee
     */
    public function index($role){
        $result = $this->apiControl->index($role);
        $data = $result['data'];
        //Nếu là cố vấn thì đổ vào trang cố vấn
        if($role == '0826eaf8086b01749bf7ff65742a200c')
            return view('pages.users.teacher', compact('data'));
        //Nếu là quản trị thì đổ vào trang quản trị
        else if($role == '08cd66cb6b012217ed32cb8662a2a1d9')
            return view('pages.users.admin', compact('data'));
        //Nếu là học viên thì cho vào trang học viên
        else if($role == '1b83df7a91f51b3d32cf6bda5b0fd23f')
            return view('pages.users.student', compact('data'));
        //Nếu là chờ cấp thì cho vào trang chờ
        else if($role == 'b2cba2a7a5499bd67320ba3d4046dc2e')
            return view('pages.users.wait', compact('data'));
        //Qua các trường hợp trên thì đổ vào trang cán bộ
        else if($role == 'default')
            return view('pages.users.employee', compact('data'));
        return redirect()->back()->with('error', ['Phân quyền bạn yêu cầu lấy danh sách tài khoản không hợp lệ']);
    }

    /***
     * Thêm tài khoản vào hệ thống
     * @param Request $request
     * @return view
     * pages.users.create
     * pages.users.create_employee
     */
    public function create(Request $request){
        // Gọi hàm thêm tài khoản
        $result = $this->apiControl->create($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->back()
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return back()->with('success', $result['message']);
        }
        return back()->with('error', $result['message']);
    }

    /**
     * Sửa tài khoản hệ thống
     * @param Request $request
     * @return view
     * pages.users.update
     * pages.users.employee_update
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
            return back()->with('success', $result['message']);
        }
        return back()->with('error', $result['message']);
    }

    /**
     * Xóa tạm một tài khoản YES
     * @param $id
     * @param $role
     * @return view
     * Các view danh sách trong users
     */
    public function hide($id){
        $result = $this->apiControl->hide($id);
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return back()->with('success', $result['message']);
        }
        return back()->with('error', $result['message']);
    }

    /**
     * Khôi phục tài khoản YES
     * @param $id
     * @param $role
     * @return view
     * Các view danh sách trong users
     */
    public function undo($id){
        $result = $this->apiControl->undo($id);
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return back()->with('success', $result['message']);
        }
        return back()->with('error', $result['message']);
    }

    /**
     * Xóa vĩnh viên tài khoản YES
     * @param $id
     * @return view
     * Các view danh sách trong users
     */
    public function remove($id){
        $result = $this->apiControl->remove($id);
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return back()->with('success', $result['message']);
        }
        return back()->with('error', $result['message']);
    }

    /**
     * Khôi phục phân quyền cho một tài khoản bị khóa phân quyền YES
     * @param Request $request
     * @return view
     */
    public function resetRoles(Request $request){
        $result = $this->apiControl->resetRoles($request);
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return back()->with('success', $result['message']);
        }
        return back()->with('error', $result['message']);
    }

    public function resetPass(Request $request){
        $request->auth_users = Auth::user()->id;
        $result = $this->apiControl->resetPass($request);
        // ---Return view báo lỗi validation nếu có trên Controller
        if ($result['status']=='r01') {
            return redirect()->back()
                ->withErrors($result['validate'])
                ->withInput();
        }
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            return back()->with('success', $result['message']);
        }
        return back()->with('error', $result['message']);
    }

}
