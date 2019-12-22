<?php

namespace App\Http\Controllers;

use App\DefaultEntityModel;
use App\EntityCycleModel;
use Illuminate\Http\Request;

class EntityCycleController extends Controller
{
    private $apiControl;
    function __construct()
    {
        $this->middleware('auth');
        $this->apiControl = new EntityCycleApiController();
    }

    /**
     * Danh sách giá trị chu kỳ
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(){
        //Thực thi thao tác
        $result = $this->apiControl->index();
        // ---Return kết quả thao tác post/get trên Controller
        if($result['status']=='r00'){
            $data = $result['data'];
            return view('pages.entity.index', compact('data'));
        }
    }

    /**
     * Tạo giá trị chu kỳ
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
        if($result['status'] == 'r00')
            return redirect('/entity')->with('success', $result['message']);
        return redirect('/entity')->with('error', $result['message']);
    }

    /**
     * Chỉnh sửa giá trị chu kỳ
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
        if($result['status'] == 'r00')
            return redirect('/entity')->with('success', $result['message']);
        return redirect('/entity')->with('error', $result['message']);
    }

    /**
     * Ẩn giá trị chu kỳ YES
     */
    public function hide($id){
        $result = $this->apiControl->hide($id);
        if($result['status'] == 'r00')
            return redirect('/entity')->with('success', $result['message']);
        return redirect('/entity')->with('success', $result['message']);
    }

    /**
     * Khôi phục giá trị chu kỳ YES
     */
    public function undo($id){
        $result = $this->apiControl->undo($id);
        if($result['status'] == 'r00')
            return redirect('/entity')->with('success', $result['message']);
        return redirect('/entity')->with('error', $result['message']);
    }

    public function remove($id){
        $result = $this->apiControl->remove($id);
        if($result['status'] == 'r00')
            return redirect('/entity')->with('success', $result['message']);
        return redirect('/entity')->with('error', $result['message']);
    }

    /**
     * Đặt giá trị chu kỳ mặc định ???
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function set_default($id){
        $result = $this->apiControl->set_default($id);
        if($result['status'] == 'r00')
            return redirect('/entity')->with('success', $result['message']);
        return redirect('/entity')->with('error', $result['message']);
    }


}
