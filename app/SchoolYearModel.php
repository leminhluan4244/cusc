<?php

namespace App;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;

class SchoolYearModel extends Model
{
    protected $table = 'school_year';
    protected $primaryKey = 'sy_id';
    protected $keyType = 'varchar';
    protected $fillable = [
        'sy_id',
        'sy_name',
        'sy_begin',
        'created_at',
        'updated_at'
    ];

    /**
     * Lấy dữ liệu đồng thời bỏ qua các mục ẩn YES
     * @return mixed
     */
    public function index(){
        return $this::where('sy_active',1)->get();
    }

    /**
     * Xóa niên khóa YES
     * @param Request $request
     * @return mixed
     */
    public function create(Request $request){
        $result = $this::insert([
            'sy_id' => time(),
            'sy_name' => $request->sy_name,
            'sy_begin' => date($request->sy_begin),
            'sy_active' => 1
        ]);
        return $result;
    }

    /**
     * Cập nhật niên khóa YES
     * @param Request $request
     * @return mixed
     */
    public function change(Request $request){
        $result = $this::where('sy_id',$request->sy_id)
            ->where('sy_active',1)
            ->update([
                'sy_name' => $request->sy_name,
                'sy_begin' => $request->sy_begin,
                'sy_active' => 1
            ]);
        return $result;
    }

    /**
     * Xóa tạm niên khóa YES
     * @param $id
     * @return bool
     */
    public function hide($id){
        $result = $this::where('sy_id',$id)
            ->where('sy_active',1);
        if($result->count()>0) {
            $result->update([
                'sy_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục niên khóa YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('sy_id',$id)
            ->where('sy_active',0);
        if($result->count()>0) {
            $result->update([
                'sy_active' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa vĩnh viên niên khóa YES
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            $isClass = ClassModel::where('sy_id', $id)->select('cl_id')->get();
            if(sizeof($isClass) > 0){
                UsersHasClassModel::whereIn('cl_id',$isClass)->delete();
                ClassModel::where('sy_id', $id)->delete();
            }
            $result->delete();
            return true;
        }
        return false;
    }

    /**
     * Tìm kiếm YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        return $this::where('sy_active',1)
            ->where('sy_id', $id)->first();
    }




    //**
    public function count(){
        return $this::where('sy_active',1)->count();
    }


}
