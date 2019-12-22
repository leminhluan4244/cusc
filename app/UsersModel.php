<?php

namespace App;
use App\Http\Controllers\RegistrationApiController;
use DateTime;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UsersModel extends Model
{
    protected $table = 'users';
    protected $primaryKey = 'id';
    protected $keyType = 'varchar';
    protected $fillable = [
        'id',
        'cusc_id',
        'password',
        'phone',
        'email',
        'active',
        'scores',
        'token',
        'device_token',
        'remember_token',
        'created_at',
        'updated_at'
    ];

    /***
     * Lấy tất cả tài khoản từ hệ thống NO
     * @return array tài khoản
     */
    public function all_index(){
        return $this::all();
    }

    /***
     * Mảng danh sách tài khoản theo id roles YES
     * @param $role
     * @return array
     */
    public function index($role){
        //***** Luồng vào tài khoản cán bộ
        if($role == "default"){
            $list = $this
                //Liên kết bảng phân quyền
                ::join('users_has_roles','users_has_roles.u_id','users.id')
                ->join('roles','roles.r_id','users_has_roles.r_id')
                //Nối với thông tin người dùng
                ->join('profile', 'profile.id', 'users.id')
                //Không phải cố vấn
                ->where('users_has_roles.r_id',"<>","0826eaf8086b01749bf7ff65742a200c")
                //Không phải quản trị viên
                ->where('users_has_roles.r_id',"<>","08cd66cb6b012217ed32cb8662a2a1d9")
                //Không phải học viên
                ->where('users_has_roles.r_id',"<>","1b83df7a91f51b3d32cf6bda5b0fd23f")
                //Không phải chờ cấp
                ->where('users_has_roles.r_id',"<>","b2cba2a7a5499bd67320ba3d4046dc2e")
                //Được mở khóa
                ->where('users.active',1)
                //=> Cán bộ => lấy thông tin cán bộ
                ->orderBy('users.cusc_id', 'DESC')
                ->get();
        }
        //****Ngược lại lấy theo phân quyền truyền vào
        else{
            $list = $this
                ::join('users_has_roles','users_has_roles.u_id','users.id')
                ->join('profile', 'profile.id', 'users.id')
                ->where('users_has_roles.r_id',$role)
                ->where('users.active',1)
                ->orderBy('users.cusc_id', 'DESC');
                if($role=="1b83df7a91f51b3d32cf6bda5b0fd23f"){
                    $list = $list->paginate(40);
                }else{
                    $list = $list->get();
                }

        }
        //Gắn danh sách đã lấy được, kèm phân quyền
        $_role = (new RolesModel())->search($role);
        $data = [
            'list' => $list, //Danh sách tài khoản
            'role' => $_role //Chi tiết phân quyền
        ];
        //Trả data
        return $data;
    }

    /**
     * Thêm tài khoản YES
     * @param Request $request
     * @return bool
     */
    public function create(Request $request){
        //Thêm vào users
        $id = time();
        $result = $this::insert([
            'id' => $id,
            'cusc_id' => $request->cusc_id,
            'password' => Hash::make($request->cusc_id.'_123'),
            'phone' => $request->phone,
            'email' => $request->email,
            'active' => 1,
            'scores' => 0,
        ]);
        //Tạo profile
        $profile = ProfileModel::insert([
            'id' => $id,
            'name' => $request->name,
            'birthday' => date_format(new DateTime($request->birthday),'Y-m-d'),
            'address' => $request->address,
            'gender' => $request->gender
        ]);

        //Gắn phân quyền
        $relationship = UsersHasRolesModel::insert([
            'ur_id' => time(),
            'u_id' => $id,
            'r_id' => $request->r_id
        ]);
        return $result;
    }

    /**
     * Cập nhật tài khoản YES
     * @param Request $request
     * @return mixed
     */
    public function change(Request $request){
        //cập nhật
        $result = $this::find($request->id)
        ->update([
            'cusc_id' => $request->cusc_id,
            'phone' => $request->phone,
            'email' => $request->email,
        ]);
        //Tạo profile
        $profile = ProfileModel::find($request->id)
            ->update([
            'name' => $request->name,
            'birthday' => date_format(new DateTime($request->birthday),'Y-m-d'),
            'address' => $request->address,
            'gender' => $request->gender
        ]);

        //Gắn phân quyền
        $relationship = UsersHasRolesModel::where('u_id',$request->id)
        ->update([
            'r_id' => $request->r_id
        ]);

        return $result;
    }

    /**
     * Xóa tạm tài khoản YES
     * @param $id
     * @return bool
     */
    public function hide($id){
        $result = $this::where('id',$id)->where('active', 1);
        if($result->count()>0) {
            $result->update([
                'active' => 0
            ]);
            return true;
        }
        return false;
    }

    /***
     * Khôi phục tài khoản YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('id',$id)->where('active', 0);
        if($result->count()>0) {
            $result->update([
                'active' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa tài khoản YES
     * @param $id
     * @return array
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            //Xác minh xem có phải admin không, nếu là admin thì không cho xóa
            $rolesCheck = UsersHasRolesModel
                ::where('u_id', $id)
                ->where('r_id', '08cd66cb6b012217ed32cb8662a2a1d9')
                ->first();
            if(isset($rolesCheck)){
                return [
                    'error' => 'admin',
                    'data' => $rolesCheck,
                    'message' => ['Không thể xóa vĩnh viễn tài khoản admin']
                ];
            }
            //Tìm trong hoạt động nếu có thì yêu cầu xóa hoặc chuyển chủ hoạt động
            $activeList = ActiveModel::where('u_id',$id)->get();
            if(isset($activeList) && sizeof($activeList)>0){
                return [
                    'error' => 'active',
                    'data' => $activeList,
                    'message' => ['Tài khoản này đang tổ chức hoạt động, vui lòng đổi tài khoản khác hoặc xóa hoạt động']
                ];
            }
            //Nếu là cố vấn thì tiến hành yêu cầu chuyển cố vấn cho lớp hoặc xóa lớp
            $classList = ClassModel::where('u_manager_id', $id)->get();
            if(isset($classList) && sizeof($classList)>0){
                return [
                    'error' => 'class',
                    'data' => $classList,
                    'message' => ['Tài khoản này đang là chủ nhiệm, vui lòng đổi tài khoản khác hoặc xóa lớp']
                ];
            }
            AssignmentModel::where('u_id',$id)->delete();
            RegistrationModel::where('u_id', $id)->delete();
            ResultHistoryModel::where('u_id', $id)->delete();
            ResultLogModel::where('u_id', $id)->delete();
            ResultPointModel::where('u_id', $id)->delete();
            SumScoresLogModel::where('u_id', $id)->delete();
            ProfileModel::find($id)->delete();
            UsersHasRolesModel::where('u_id', $id)->delete();
            UsersHasClassModel::where('u_id', $id)->delete();
            UsersHasActiveAchievementModel::where('u_id', $id)->delete();
            $result->delete();

            return [
                'error' => 'none',
                'data' => []
            ];
        }
        return [
            'error' => 'unknow',
            'data' => []
        ];
    }

    /***
     * Tìm kiếm tài khoản theo id YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        return $this
            ::join('profile','profile.id','users.id')
            ->where('users.id', $id)
            ->where('users.active',1)
            ->first();
    }

    /**
     * Mảng các phân quyền thuộc nhóm cán bộ YES
     * @return mixed
     */
    public function employee(){
        return RolesModel
            //Khác quản trị viên
            ::where('r_id','<>','08cd66cb6b012217ed32cb8662a2a1d9')
            //Khác cố vấn
            ->where('r_id','<>','0826eaf8086b01749bf7ff65742a200c')
            //Khác học viên
            ->where('r_id','<>','1b83df7a91f51b3d32cf6bda5b0fd23f')
            //Khác chờ cấp
            ->where('r_id','<>','b2cba2a7a5499bd67320ba3d4046dc2e')
            // => Cán bộ và get
            ->get();
    }

    /**
     * Cấp lại quyền cho users YES
     * @param Request $request
     * @return bool
     */
    public function resetRoles(Request $request){
        $role = RolesModel::where('r_id',$request->r_id)->first();
        if($request->type=="1" && isset($role)){
            UsersHasRolesModel
                ::where('u_id', $request->u_id)
                ->update(['r_id'=> $request->r_id]);
            return true;
        }
        else if($request->type=="2" && isset($role)){
            UsersHasRolesModel
                ::where('r_id','b2cba2a7a5499bd67320ba3d4046dc2e')
                ->update(['r_id'=> $request->r_id]);
            return true;
        }
        else return false;
    }





//    >>>>>>>>>>>>>>>>>>>Các hàm chưa sử dụng
    /***
     * Đếm tổng số tài khoản không bị xóa tạm NO
     * @return mixed
     */
    public function count(){
        return $this::where('active',1)->count();
    }

    /***
     * Đếm theo phân quyền NO
     * @return mixed
     */
    public function count_roles($roles){
        return $this
            ::join('users_has_roles','users_has_roles.r_id',$roles)
            ->where('active',1)
            ->count();
    }

    /**
     * Đổi mật khẩu
     * @param Request $request
     * @return bool
     */
    public  function resetPass(Request $request){
        $this
            ::where('id', $request->users_id)
            ->update([
                'password' => Hash::make($request->new_pass)
            ]);
        return true;
    }
}
