<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


class ResultPointModel extends Model
{
    protected $table = 'result_point';
    protected $primaryKey = 'rp_id';
    protected $keyType = 'varchar';
    protected $fillable = [
        'rp_id',
        'rp_scores',
        'rp_note',
        'u_id',
        'c_id',
        'cc_id',
        'ec_id',
        'rp_make',
        'created_at',
        'updated_at'
    ];

    /***
     * Danh sách đầy đủ về điểm của một học viên thông qua id người đó YES
     * @param $id_student
     * @return array
     */
    public function result($id_student){
        //Lấy các mục điểm
        $result = CategoryModel::where('category.c_active',1)
            ->orderBy('category.c_item', 'ASC')
            ->get();
        $sum_category = 0;
        if(sizeof($result)>0){
            foreach ($result as $key => $value){
                $temp_scores = 0;
                $value['child'] = $this->child_of_result($value->c_id,$id_student);
                    //Điểm mục lớn nhất
                    if(sizeof($value['child']) !=0){
                        if($value->c_type==1) {
                            foreach ($value['child'] as $k => $val) {
                                $temp_scores = $temp_scores + $val['result_lsum'];
                            }
                        }
                        else if($value->c_type==0){
                            foreach ($value['child'] as $k => $val) {
                                $temp_scores = $val['result_lsum'] > $temp_scores ? $val['result_lsum'] : $temp_scores;
                            }
                        }
                    }
                $value['scores'] = $value->c_max_scores > $temp_scores ? $temp_scores : $value->c_max_scores ;
                $sum_category = $sum_category + $value['scores'];
            }
        }
        //Lưu điểm mới tính vào trong điểm sinh viên
        $student = UsersModel::where('users.id',$id_student)->first();
        $sum_category = $sum_category > $student->scores ? $sum_category : $student->scores;
         UsersModel::where('users.id',$id_student)
            ->update([
                'scores' => $sum_category
            ]);
        //Lấy thông tin học viên
        $user = UsersModel::leftjoin('profile', 'profile.id','=','users.id')
            ->where('users.id',$id_student)
            ->select('users.*','profile.name','profile.birthday','profile.address','profile.gender')
            ->first();
        return [
            'category' => $result,
            'user' => $user,
        ];
    }

    /*** Kéo về bộ dữ liệu con và điểm của một mục lớn YES
     * @param $id : mã mục cha
     * @param $id_student: mã sinh viên
     * @return $child: bộ dữ liệu đầy đủ tương ứng cho một mục con
     */
    public function child_of_result($id,$id_student){
        $child = CategoryChildModel::
            where('category_child.cc_active',1)
            ->where('category_child.c_id',$id)
            ->orderBy('category_child.cc_item', 'ASC')
            ->get();

        if(sizeof($child)>0){
            foreach ($child as $key => $value){
                //Lấy ra loại chu kỳ cho mục con này
                $value['cycle'] = CategoryChildHasCycleModel
                    ::join('cycle','cycle.cy_id','=','category_child_has_cycle.cy_id')
                    ->where('category_child_has_cycle.cc_id',$value->cc_id)
                    ->first();
                //Lấy ra phân quyền được phép chấm
                $value['roles'] = CategoryChildHasRolesModel
                    ::join('roles','roles.r_id','=','category_child_has_roles.r_id')
                    ->where('category_child_has_roles.cc_id',$value->cc_id)
                    ->get();

                //Lấy ra xem có lựa chọn mục này từ bản đăng ký sinh viên không
                $value['select'] = RegistrationModel::where('cc_id',$value->cc_id)
                    ->where('u_id', $id_student)
                    ->first();

                //Lấy ra điểm hiện tại
                $value['result'] = ResultPointModel::join('entity_cycle','entity_cycle.ec_id','result_point.ec_id')
                    ->where('u_id', $id_student)
                    ->where('cc_id',$value->cc_id)
                    ->select('result_point.*','entity_cycle.ec_name')
                    ->get();
                //Lấy ra điểm ở hiện tại
                $value['result_psum'] = ResultPointModel::join('entity_cycle','entity_cycle.ec_id','result_point.ec_id')
                    ->where('u_id', $id_student)
                    ->where('cc_id',$value->cc_id)
                    ->sum('result_point.rp_scores');
                $value['result_psum'] = $value['result_psum'] > $value->cc_max_scores_cycle ? $value->cc_max_scores_cycle : $value['result_psum'];
                    //Lấy ra điểm trong lịch sử
                $value['result_log'] = ResultLogModel::join('entity_cycle','entity_cycle.ec_id','result_log.ec_id')
                    ->where('u_id', $id_student)
                    ->where('cc_id',$value->cc_id)
                    ->select('result_log.*','entity_cycle.ec_name')
                    ->get();
                //Lấy ra điểm trong lịch sử
                $value['result_lsum'] = ResultLogModel::join('entity_cycle','entity_cycle.ec_id','result_log.ec_id')
                    ->where('u_id', $id_student)
                    ->where('cc_id',$value->cc_id)
                    ->select('result_log.*','entity_cycle.ec_name')
                    ->sum('result_log.rl_scores');
                //Lấy ra danh sách gợi ý cộng điểm
                //Lấy ra cái entity mặc định
                $default = DefaultEntityModel
                    ::join('entity_cycle','entity_cycle.ec_id','default_entity.ec_id')
                    ->join('category_child_has_cycle','category_child_has_cycle.cy_id','default_entity.cy_id')
                    ->where('category_child_has_cycle.cy_id',$value['cycle']->cy_id)
                    ->where('category_child_has_cycle.cc_id',$value->cc_id)
                    ->first();
                $value['entity'] = $default;
                if(isset($default))
                $value['achievement'] = ActiveAchievementModel
                    ::join('active','active.a_id', 'active_achievement.a_id')
                    ->join('users_has_active_achievement','users_has_active_achievement.aa_id', 'active_achievement.aa_id')
                    ->where('users_has_active_achievement.u_id',$id_student)
                    ->where('active_achievement.cc_id',$value->cc_id)
                    ->whereRaw("`active`.`a_begin` <= '".$default->ec_end."'")
                    ->whereRaw("`active`.`a_begin` >= '".$default->ec_begin."'")
                    ->get();
                else{
                    $value['achievement'] = [];
                }
            }
        }
        return $child;
    }

    /**
     * Tiến hành đặt mặt định chu kỳ tiếp theo và chốt chu kỳ hiện tại
     * @param $id
     * @param $child
     * @return mixed
     */
    public function nextEntity($id, $child){
        //Lọc lấy các phần đã có log để hủy
        $log = ResultLogModel::join('entity_cycle', 'entity_cycle.ec_id', 'result_log.ec_id')
            ->where('entity_cycle.cy_id', $id)
            ->select('entity_cycle.ec_id')
            ->groupBy('entity_cycle.ec_id')
            ->get();
        //Lọc ra các phần đang là mặc định
        $default = DefaultEntityModel::where('cy_id', $id)
            ->select('ec_id')
            ->groupBy('ec_id')
            ->get();
        $exclude = [];
        foreach ($log as $value){
            array_push($exclude,$value['ec_id']);
        }
        foreach ($default as $value){
            array_push($exclude,$value['ec_id']);
        }
        $list = EntityCycleModel
            ::where('ec_active',1)
            ->where('cy_id', $id)
            ->whereNotIn('ec_id', $exclude)
            ->get();
        return $list;
    }

    /**
     * Thực thi chốt chu kỳ điểm học viên , Hàm cực kỳ quan trọng
     * @param Request $request
     * @return string
     */
    public function successPoint(Request $request){
        $entityClass = New EntityCycleModel();
        //1. Xác thực tài khoản người dùng
        $user = UsersModel
            ::where('cusc_id', $request->cusc_id)
            ->where('id', $request->id)
            ->first();

        //Nếu không có users hợp lệ thì kết thúc
        if(!isset($user)) return 'authUser';
        //Mật khẩu users không hợp lệ thì khế thúc
        if (!Hash::check($request->password, $user->password)) return 'authPass';

        //2 .Xác nhận chu kỳ tiếp theo có hợp lệ không
        //**Lấy ra chu kỳ mặc định hiện tại
        $defaultEnity = $entityClass->getDefaultEntityById($request->ec_id);
        //Nếu không tìm thấy thì kết thúc
        if(!isset($defaultEnity)) return 'notEntity';

        //** Xét xem chu kỳ tiếp theo có thỏa điều kiện không
        $entityAvailable = $entityClass
            ::whereNull('ec_commit')
            //Lọc ra các chu kỳ cùng bộ chọn chu kỳ
            ->where('cy_id', $defaultEnity->cy_id)
            //Loại trừ chu kỳ hiện tại
            ->where('ec_id', '<>', $request->ec_id)
            //Xác nhận với id chu kỳ tiếp theo
            ->where('ec_id', $request->next_ec)
            //Loại trừ các chu kỳ xóa tạm hoặc không hợp lệ
            ->where('ec_active','1')
            ->first();
        //Nếu không có chu kỳ hợp lệ sẵn sàng thì kết thúc
        if(!isset($entityAvailable)) return 'notNextEntity';
        //Ngược lại
        // 3. Lấy dữ liệu từ ResultPoint đưa vào ResultLog
        //**3.1 Lấy dữ liệu ResultPoint ứng với điều kiện user và giá trị chu kỳ
        $usersListForLog = ResultPointModel
            ::where('ec_id', $request->ec_id)
            ->groupBy('u_id', 'cc_id')
            ->get();
        foreach ($usersListForLog as $key => $val){
            $requestParam = New Request();
            $requestParam->cc_id = $val->cc_id;
            $requestParam->u_id = $val->u_id;
            $requestParam->c_id = $val->c_id;

            $insertParam = [
                'rl_id' => time().$key,
                'rl_scores' =>  $this->getSumPointOnChild($requestParam),
                'rl_note' => '',
                'u_id' => $val->u_id,
                'c_id' => $val->c_id,
                'cc_id' => $val->cc_id,
                'ec_id' => $val->ec_id,
            ];
            //Chèn vào log
            ResultLogModel::insert($insertParam);
            //Tính lại điểm cho chu kỳ chứa mục con này
            $point = $this->getSumLogOnCategory($requestParam);
            //Kiểm tra trong sum_scores_log có điểm chưa
            $getScoresCategorySave = SumScoresLogModel
                ::where('u_id', $insertParam['u_id'])
                ->where('c_id', $insertParam['c_id'])
                ->first();
            //Nếu đã có thì ghi đè
            if(isset($getScoresCategorySave)){
                if($point > $getScoresCategorySave->ss_scores ){
                    $getScoresCategorySave->ss_scores = $point;
                    $getScoresCategorySave->save();
                }
            }
            else{
                SumScoresLogModel::insert([
                    'ss_id' => time().$key,
                    'u_id' => $val->u_id,
                    'c_id' => $val->c_id,
                    'ss_scores' =>  $point
                ]);
            }
            //Tính điểm lại rồi lưu tài khoản
            $sum  = SumScoresLogModel::where('u_id', $val->u_id)
                ->sum('ss_scores');
            //Lấy ra điểm hiện tại nếu lớn hơn thì sẽ lưu
            $scores = UsersModel::where('id', $val->u_id)->first();
            UsersModel::where('id', $val->u_id)
                ->scores = $sum > $scores->scores ? $sum : $scores->scores ;
            //Chưa có thì insert

        }
        //Xóa dữ liệu trong ResultPoint
        ResultPointModel::where('ec_id',$defaultEnity->ec_id)->delete();
        //Chuyển chu kỳ mặc định
        $defaultEnity->ec_id = $request->next_ec;
        $defaultEnity->save();
        EntityCycleModel
            ::where('ec_id', $request->ec_id)
            ->update([
                'ec_commit' => 1
            ]);
        return 'Success';
    }

    /**
     * Hàm hỗ trợ kiểm tra xem một tài khoản có được cộng điểm hoặc sửa mục với một sinh viên hay không
     * @param Request $request: dữ liệu đầu vào
     * @return bool kết quả thao tác thêm hoặc sửa được phép hay không
     */
    public  function  permissionsValidation(Request $request){
        $roles = UsersModel
            ::join('users_has_roles','users_has_roles.u_id','users.id')
            ->join('category_child_has_roles','users_has_roles.r_id','category_child_has_roles.r_id')
            ->where('users.id',$request->rp_make)
            ->where('category_child_has_roles.cc_id', $request->cc_id)
            ->first();
        if(!isset($roles)){
            return false;
        }
        //Kiểm tra xem có được phân công chấm sinh viên này hay không
        //Nếu là quản trị viên thì cho qua
        if ($roles->r_id == '08cd66cb6b012217ed32cb8662a2a1d9'){
            return true;
        }
        else//Nếu là cố vấn thì xem có được phân công lớp của sinh viên này hay không
            if ($roles == '0826eaf8086b01749bf7ff65742a200c'){
                $classTeacher = ClassModel
                    ::join('users_has_class','users_has_class.cl_id','class.cl_id')
                    ->where('users_has_class.u_id',$request->u_id)
                    ->where('class.u_manager_id',$request->rp_make)
                    ->first();
                if(!isset($classTeacher)) return false;
            }
            else //Nếu là tài khoản thì dò bảng phân công lớp
            {
                $classStaff = ClassModel
                    ::join('users_has_class','users_has_class.cl_id','class.cl_id')
                    ->join('assignment','assignment.cl_id','class.cl_id')
                    ->where('users_has_class.u_id',$request->u_id)
                    ->where('assignment.u_id',$request->rp_make)
                    ->first();
                if(!isset($classStaff)) return false;
            }
            //Trả về true nếu qua được tất cả các bước kiểm duyệt trên
        return true;
    }

    /***
     * Thêm một cột điểm vào mục điểm của chu kỳ
     * @param Request $request
     * id_child : id mục con
     * id_student : id học viên
     * @return boolean: kết quả thành công hay thất bại của thao tác thêm
     */
    public function create(Request $request){
        //Kiểm tra phân quyền của người đăng nhập có được phép thực hiện thao tác thêm này hay không
        if($this->permissionsValidation($request)==false){
            return false;
        }

        //Tìm chu kỳ mặc định cho mục con
        $default = CategoryChildModel
            ::join('category','category.c_id','category_child.c_id')
            ->join('category_child_has_cycle','category_child_has_cycle.cc_id','category_child.cc_id')
            ->join('default_entity','category_child_has_cycle.cy_id','default_entity.cy_id')
            ->where('category_child.cc_id',$request->cc_id)
            ->first();
        if(!isset($default)){
            return false;
        }
        //Lưu dữ liệu vào bảng điểm cho chu kỳ
        $input = [
            'rp_id' => time(),
            'rp_scores' => $request->rp_scores <= $default->cc_max_scores ? $request->rp_scores : $default->cc_max_scores ,
            'rp_note' => $request->rp_note,
            'u_id' => $request->u_id,
            'c_id' => $default->c_id,
            'cc_id' => $request->cc_id,
            'ec_id' => $default->ec_id,
            'rp_make' => $request->rp_make,
        ];
        //Lưu một dòng log vào trong history log
        ResultHistoryModel::insert([
            'rh_id' => time(),
            'rp_id' => $input['rp_id'],
            'rp_scores_old' => '',
            'rp_scores_new' => $input['rp_scores'],
            'rp_note_old' => '',
            'rp_note_new' => $input['rp_note'],
            'u_make' => $input['rp_make'],
            'u_id' => $input['u_id'],
            'u_change' => $input['rp_make'],
            'c_id' => $input['c_id'],
            'cc_id' => $input['cc_id'],
            'ec_id' => $input['ec_id'],
            'rh_action' => 'insert',
        ]);
        $result = $this::insert($input);

        return $result;
    }

    /**
     *Sửa đổi mục điểm của một sinh viên trong chu kỳ hiện tại
     *
     */
    public function change(Request $request){
        //Tìm kiếm điểm để chỉnh sửa
        $findPoint = $this::find($request->rp_id);
        if(!isset($findPoint)) return false;
        $request->cc_id = $findPoint->cc_id;
        //Kiểm tra phân quyền của người đăng nhập có được phép thực hiện thao tác thêm này hay không
        if($this->permissionsValidation($request)==false){
            return false;
        }
        $logHistory = [
            'rh_id' => time(),
            'rp_id' => $findPoint->rp_id,
            'rp_scores_old' => $findPoint->rp_scores,
            'rp_scores_new' => $request->rp_scores,
            'rp_note_old' => $findPoint->rp_note,
            'rp_note_new' => $request->rp_note,
            'u_make' => $findPoint->rp_make,
            'u_change' => $request->rp_make,
            'u_id' => $findPoint->u_id,
            'c_id' => $findPoint->c_id,
            'cc_id' => $findPoint->cc_id,
            'ec_id' => $findPoint->ec_id,
            'rh_action' => 'update',
        ];
        $findPoint->rp_scores = $request->rp_scores;
        $findPoint->rp_note = $request->rp_note;
        $findPoint->save();
        //Lưu một dòng log vào trong history log
        ResultHistoryModel::insert($logHistory);
        return true;
    }

    /**
     *Xóa một mục điểm
     *
     */
    public function remove(Request $request){
        //Tìm kiếm điểm để xóa
        $findPoint = $this::find($request->rp_id);
        if(!isset($findPoint)) return false;
        $request->cc_id = $findPoint->cc_id;
        //Kiểm tra phân quyền của người đăng nhập có được phép thực hiện thao tác thêm này hay không
        if($this->permissionsValidation($request)==false){
            return false;
        }
        //Không tìm được thì thoát
        $logHistory = [
            'rh_id' => time(),
            'rp_id' => $findPoint->rp_id,
            'rp_scores_old' => $findPoint->rp_scores,
            'rp_scores_new' => '',
            'rp_note_old' => $findPoint->rp_note,
            'rp_note_new' => '',
            'u_make' => $findPoint->rp_make,
            'u_change' => $request->rp_make,
            'u_id' => $findPoint->u_id,
            'c_id' => $findPoint->c_id,
            'cc_id' => $findPoint->cc_id,
            'ec_id' => $findPoint->ec_id,
            'rh_action' => 'delete',
        ];
        $findPoint->delete();
        //Lưu một dòng log vào trong history log
        ResultHistoryModel::insert($logHistory);
        return true;
    }

    /***
     * Lấy ra dữ liệu điểm chu kỳ cho một học viên YES
     * @param Request $request
     * id_category : id mục lớn
     * id_child : id mục con
     * id_student : id học viên
     * @return array:  điểm hiện tại của một học viên
     */
    public function getPointOnChild(Request $request){
        //Sử dụng chu kỳ kích hoạt để tìm dữ liệu trong bảng result
        $nowActiveEntity = ResultPointModel
            ::join('entity_cycle','entity_cycle.ec_id','result_point.ec_id')
            ->join('category_child','category_child.cc_id','=', 'result_point.cc_id')
            ->join('users','users.id','=', 'result_point.rp_make')
            ->join('profile', 'profile.id','=','result_point.rp_make')
            ->where('result_point.u_id', $request->u_id)
            ->where('result_point.cc_id',$request->cc_id)
            ->select('profile.name','users.id','result_point.*','entity_cycle.ec_name')
            ->orderBy('result_point.updated_at', 'DESC')
            ->get();
        //Trả về dữ liệu
        return $nowActiveEntity;
    }

    /***
     * Lấy ra dữ liệu log cho một học viên YES
     * @param Request $request
     * id_category : id mục lớn
     * id_child : id mục con
     * id_student : id học viên
     * @return array : điểm tích lũy theo mục con của một học viên
     */
    public function getLogOnChild(Request $request){
        $logChild = ResultLogModel
            //Nối với bảng chu kỳ để lấy ra thông tin chu kỳ đã cộng
            ::join('entity_cycle','entity_cycle.ec_id','result_log.ec_id')
            //Nối với bảng mục con để lấy ra mục con đã cộng
            ->join('category_child','category_child.cc_id','=', 'result_log.cc_id')
            //Nối với bảng mục cha để lấy ra mục cha đã cộng, mục cha và con có thế khác nếu sau này mục con đổi mục cha
            ->join('category','category.c_id','=', 'result_log.c_id')
            //Điều kiện lọc theo user truyền vào
            ->where('result_log.u_id', $request->u_id)
            //Điều kiện lọc theo mục con truyền vào
            ->where('result_log.cc_id',$request->cc_id)
            //Các mục select cần thiết
            ->select('result_log.*','entity_cycle.ec_name','category_child.*','category.*')
            ->get();
        //Trả về dữ liệu
        return $logChild;
    }

    /***
     * Tính toán điểm chu kỳ hiện tại cho một mục con của học sinh YES
     * @param Request $request
     * id_category : id mục lớn
     * id_child : id mục con
     * id_student : id học viên
     * @return number : điểm đã cộng theo tiêu chuẩn hiện tại của một học viên
     */
    public function getSumPointOnChild(Request $request){
        //Lấy ra quy ước về điểm của mục hiện tại
        $rule = CategoryChildModel::find($request->cc_id);
        //Kiểm tra số lần nếu số lần vượt quá quy định thì chỉ lấy các lần có điểm cao nhất
        if(isset($rule)){
            $sumData = ResultPointModel
                //Điều kiện lọc theo user truyền vào
                ::where('result_point.u_id', $request->u_id)
                //Điều kiện lọc theo mục con truyền vào
                ->where('result_point.cc_id',$request->cc_id)
                //Sắp xếp theo điểm giảm dần
                ->orderBy('rp_scores','desc')
                //Lấy số dòng cho phép theo mục con quy định
                ->take($rule->cc_max_amount)
                ->get();
            //Lấy tổng các dòng đã lấy
            $sumData = $sumData->sum('rp_scores');
            //Lấy điểm tối đa, (chọn điểm max nếu tổng hiện tại lớn hơn max)
            $sum = $sumData <= $rule->cc_max_scores_cycle ? $sumData : $rule->cc_max_scores_cycle;
            //Trả về kết quả đã tính
            return $sum;
        }
        else{
            //Ngược lại xem như 0 điểm
            return 0 ;
        }
    }

    /***
     * Trả về danh sách các mục gợi ý chấm thuộc chu kỳ hiện đang kích hoạt YES
     * @param Request $request
     * id_category : id mục lớn
     * id_child : id mục con
     * id_student : id học viên
     * @return array : Danh sách gợi ý chấm cho một sinh viên
     */
    public function getChildSuggest(Request $request){
        //Lấy ra entity mặc định của mục con đưa vào
        $default = DefaultEntityModel
            ::join('entity_cycle','entity_cycle.ec_id','default_entity.ec_id')
            ->join('category_child_has_cycle','category_child_has_cycle.cy_id','default_entity.cy_id')
            ->where('category_child_has_cycle.cc_id',$request->cc_id)
            ->first();

        //Nếu kết quả tìm kiếm là rỗng thì trả về mảng rỗng
        if(!isset($default)){
            return [];
        }
        //Lấy danh sách các gợi ý chấm
        //Lấy danh sách sự kiện để bắt đầu lọc
        $suggestList = ActiveModel
            //Join bảng phân công để lấy chi tiết vai trò
            ::join('active_achievement','active_achievement.a_id','active.a_id')
            //Join với bảng tài khoản để lấy ra tài khoản người dùng từ request đưa vào
            ->join('users_has_active_achievement','active_achievement.aa_id','users_has_active_achievement.aa_id')
            ->join('users','users.id','users_has_active_achievement.u_id')
            //Điều kiện sự kiện phải là sự kiện đã diễn ra và được duyệt
            ->where("active.a_active","<>",0)
            ->whereRaw("`active`.`a_end` < '".date("Y-m-d")."'")
            //Điều kiện để chỉ lấy các khung thời gian nằm trong khung thời gian của chu kỳ mặc định
            ->whereRaw("`active`.`a_end` <= '".date("Y-m-d", strtotime($default->ec_end))."'")
            ->whereRaw("`active`.`a_end` >= '".date("Y-m-d", strtotime($default->ec_begin))."'")
            //Điều kiện chỉ lấy cho user tryền vào
            ->where('users.id',$request->u_id)
            //Điều kiện chỉ lấy cho mục con truyền vào
            ->where('active_achievement.cc_id',$request->cc_id)
            ->get();
        return $suggestList;

    }

    /***
     * Tính toán điểm tích lũy một mục con của học sinh YES
     * @param Request $request
     * id_category : id mục lớn
     * id_child : id mục con
     * id_student : id học viên
     * @return number : điểm đã cộng theo tiêu chuẩn hiện tại của một học viên
     */
    public function getSumLogOnCategory(Request $request){
        //Lấy ra quy ước về điểm của mục hiện tại
        $rule = CategoryModel::find($request->c_id);
        //So sánh kết quả với yêu cầu về điểm tối đa của mục lớn
        if(isset($rule)){
            $sumData = ResultLogModel
                ::where('u_id', $request->u_id)
                ->where('c_id',$request->c_id)
                ->sum('rl_scores');
            $sum = $sumData <= $rule->c_max_scores ? $sumData : $rule->c_max_scores;
            return $sum;
        }
        else{
            return 0 ;
        }
    }

    public function child_detail(Request $request){
        //Lấy ra mục con theo yêu cầu
        $child = CategoryChildModel::find($request->cc_id);
        if(!isset($child)) return [];
        //Lấy ra loại chu kỳ cho mục con này
        $child['cycle'] = CategoryChildHasCycleModel
            ::join('cycle','cycle.cy_id','=','category_child_has_cycle.cy_id')
            ->where('category_child_has_cycle.cc_id',$child->cc_id)
            ->first();
        //Lấy ra phân quyền được phép chấm
        $child['roles'] = CategoryChildHasRolesModel
            ::join('roles','roles.r_id','=','category_child_has_roles.r_id')
            ->where('category_child_has_roles.cc_id',$child->cc_id)
            ->get();

        //Lấy ra xem có lựa chọn mục này từ bản đăng ký sinh viên không
        $child['select'] = RegistrationModel::where('cc_id',$child->cc_id)
            ->where('u_id', $request->id)
            ->first();

        //Lấy ra điểm hiện tại
        $child['result'] = ResultPointModel::join('entity_cycle','entity_cycle.ec_id','result_point.ec_id')
            ->where('u_id', $request->id)
            ->where('cc_id',$child->cc_id)
            ->select('result_point.*','entity_cycle.ec_name')
            ->get();
        //Lấy ra điểm ở hiện tại
        $child['result_psum'] = ResultPointModel::join('entity_cycle','entity_cycle.ec_id','result_point.ec_id')
            ->where('u_id', $request->id)
            ->where('cc_id',$child->cc_id)
            ->sum('result_point.rp_scores');

        $child['result_psum'] = $child['result_psum'] > $child->cc_max_scores_cycle ? $child->cc_max_scores_cycle : $child['result_psum'];
        //Lấy ra điểm trong lịch sử
        $child['result_log'] = ResultLogModel::join('entity_cycle','entity_cycle.ec_id','result_log.ec_id')
            ->where('u_id', $request->id)
            ->where('cc_id',$child->cc_id)
            ->select('result_log.*','entity_cycle.ec_name')
            ->get();
        //Lấy ra tổng điểm trong lịch sử
        $child['result_lsum'] = ResultLogModel::join('entity_cycle','entity_cycle.ec_id','result_log.ec_id')
            ->where('u_id', $request->id)
            ->where('cc_id',$child->cc_id)
            ->select('result_log.*','entity_cycle.ec_name')
            ->sum('result_log.rl_scores');
        //Lấy ra danh sách gợi ý cộng điểm
        //Lấy ra cái entity mặc định
        $default = DefaultEntityModel
            ::join('entity_cycle','entity_cycle.ec_id','default_entity.ec_id')
            ->join('category_child_has_cycle','category_child_has_cycle.cy_id','default_entity.cy_id')
            ->where('category_child_has_cycle.cy_id',$child['cycle']->cy_id)
            ->where('category_child_has_cycle.cc_id',$child->cc_id)
            ->first();
        $child['entity'] = $default;
        if(isset($default))
            $child['achievement'] = ActiveAchievementModel
                ::join('active','active.a_id', 'active_achievement.a_id')
                ->join('users_has_active_achievement','users_has_active_achievement.aa_id', 'active_achievement.aa_id')
                ->where('users_has_active_achievement.u_id',$request->id)
                ->where('active_achievement.cc_id',$child->cc_id)
                ->whereRaw("`active`.`a_begin` <= '".$default->ec_end."'")
                ->whereRaw("`active`.`a_begin` >= '".$default->ec_begin."'")
                ->get();
        else{
            $child['achievement'] = [];
        }
        return $child;
    }

    /**
     * Chi tiết điểm cho một mục
     * @param $id
     * @return mixed
     */
    function info($id){
        $result = ResultPointModel
            ::join('entity_cycle','entity_cycle.ec_id','result_point.ec_id')
            ->join('category_child','category_child.cc_id','result_point.cc_id')
            ->where('result_point.rp_id',$id)
            ->select('result_point.*','entity_cycle.ec_name', 'category_child.cc_name','category_child.cc_max_scores')
            ->first();
        return $result;
    }

}
