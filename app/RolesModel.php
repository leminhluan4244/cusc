<?php

namespace App;

use App\Http\Requests\RolesCreate;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class RolesModel extends Model
{
    protected $table = 'roles';
    protected $primaryKey = 'r_id';
    protected $keyType = 'varchar';
    protected $fillable = [
        'r_id',
        'r_name',
        'r_note',
        'r_active',
        'created_at',
        'updated_at'
    ];

    /**
     * Danh sách phân quyền hệ thống YES
     * @return mixed
     */
    public function index(){
        return $this
            ::where('r_active',1)
            ->get();
    }

    /**
     * Thêm phân quyền hệ thống YES
     * @param Request $request
     * @return bool
     */
    public function create(Request $request){
        $result = $this::insert([
            'r_id' => time(),
            'r_name' => $request->r_name,
            'r_note' => $request->r_note,
            'r_active' => 1
        ]);
        return $result;
    }

    /**
     * Thay đổi phân quyền hệ thống YES
     * @param Request $request
     * @return bool
     */
    public function change(Request $request){
        $result = $this::find($request->r_id)->update([
            'r_name' =>$request->r_name,
            'r_note' => $request->r_note
        ]);
        return $result;
    }

    /**
     * Xóa tạm phân quyền
     * @param $id
     * @return mixed
     */
    public function hide($id){
        $result = $this::where('r_id',$id)->where('r_active', 1);
        if($result->count()>0) {
            $result->update([
                'r_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục phân quyền từ trạng thái ẩn YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('r_id',$id)->where('r_active', 0);
        if($result->count()>0){
            $result->update([
                'r_active' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa vĩnh diễn YES
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            RolesModel::where('r_id', $id)->delete();
            CategoryChildHasRolesModel::where('r_id', $id)->delete();
            UsersHasRolesModel
                ::where('r_id', $id)
                ->update([
                    'r_id' => 'b2cba2a7a5499bd67320ba3d4046dc2e'
                ]);
            return true;
        }
        return false;
    }

    /**
     * Tìm kiếm phân quyền theo id YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        return $this::where('r_active','>=',1)
            ->where('r_id', $id)
            ->get();
    }

    public function count(){
        return $this::where('r_active',1)->count();
    }
}
