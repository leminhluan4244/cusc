<?php

namespace App;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;

class MajorsModel extends Model
{
    protected $table = 'majors';
    protected $primaryKey = 'm_id';
    protected $keyType = 'varchar';
    protected $fillable = [
        'm_id',
        'm_code',
        'm_name',
        'm_active',
        'created_at',
        'updated_at'
        ];

    /**
     * Hiển thị danh sách chuyên ngành YES
     * @return mixed
     */
    public function index(){
        //Lấy dữ liệu đồng thời bỏ qua các mục ẩn
        return $this::where('m_active',1)->get();
    }

    /**
     * Thêm chuyên ngành YES
     */
    public function create(Request $request){
        $result = $this::insert([
            'm_id' => time(),
            'm_code' => $request->m_code,
            'm_name' => $request->m_name,
            'm_active' => 1
        ]);
        return $result;
    }

    /**
     * Sửa chuyên ngành YES
     */
    public function change(Request $request){
        $result = $this::where('m_id',$request->m_id)
            ->where('m_active',1)
            ->update([
                'm_code' => $request->m_code,
                'm_name' => $request->m_name,
            ]);
        return $result;
    }

    /**
     * Ẩn , xóa logic chuyên ngành YES
     * @param $id
     * @return bool
     */
    public function hide($id){
        $result = $this::where('m_id',$id)->where('m_active', 1);
        if($result->count()>0) {
            $result->update([
                'm_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục chuyên ngành YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('m_id',$id)->where('m_active', 0);
        if($result->count()>0){
            $result->update([
                'm_active' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa vĩnh viễn chuyên ngành YES
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            // Xóa các lớp thuộc chuyên ngành này
            $isClass = ClassModel::where('m_id', $id)->select('cl_id')->get();
            if(sizeof($isClass) > 0){
                UsersHasClassModel::whereIn('cl_id', $isClass)->delete();
                ClassModel::where('m_id', $id)->delete();
            }
            $result->delete();
            return true;
        }
        return false;
    }

    /**
     * Tìm kiếm chuyên ngành YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        return $this::where('m_active',1)
            ->where('m_id', $id)->first();
    }

    //**
    public function count(){
        return $this::where('m_active',1)->count();
    }

}
