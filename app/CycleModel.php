<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class CycleModel extends Model
{
    protected $table = 'cycle';
    protected $primaryKey = 'cy_id';
    protected $keyType = 'varchar';
    protected $fillable = ['cy_id', 'cy_name', 'cy_long', 'cy_active', 'created_at', 'updated_at'];

    /**
     * Danh sách chu kỳ YES
     * @return mixed
     */
    public function index(){
        return $this
            ::where('cy_active',1)
            ->orderBy('cy_name')
            ->get();
    }

    /**
     * Thêm chu kỳ YES
     * @param Request $request
     * @return mixed
     */
    public function create(Request $request){
        $result = $this::insert([
            'cy_id' => time(),
            'cy_name' => $request->cy_name,
            'cy_long' => $request->cy_long,
            'cy_active' => 1
        ]);
        return $result;
    }

    /**
     * Sửa chu kỳ YES
     * @param Request $request
     * @return mixed
     */
    public function change(Request $request){
        $result = $this::where('cy_id',$request->cy_id)
            ->where('cy_active',1)
            ->update([
                'cy_name' => $request->cy_name,
                'cy_long' => $request->cy_long,
                'cy_active' => 1
            ]);
        return $result;
    }

    /**
     * Ẩn chu kỳ YES
     * @param $id
     * @return bool
     */
    public function hide($id){
        $result = $this::where('cy_id',$id)->where('cy_active',1);
        if($result->count()>0){
            $result->update([
                'cy_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục chu kỳ YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('cy_id',$id)->where('cy_active',0);
        if($result->count()>0){
            $result->update([
                'cy_active' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa bỏ chu kỳ YES
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            /**
             * Tìm bộ chọn con
             */
            $selectChild = CycleSelectModel::where('cy_id',$id)->select('cs_id')->get();
            /**
             * Tìm giá trị chu kỳ con
             */
            $entityChild = EntityCycleModel::where('cy_id',$id)->select('ec_id')->get();
            /**
             * Xóa tất cả các mục liên quan tới select của mục này
             */

            CycleSelectModel::where('cy_id',$id)->delete();

            /**
             * Xóa tất cả các mục liên quan tới giá trị con của mục này
             */

            DefaultEntityModel::whereIn('ec_id',$entityChild)->delete();
            ResultLogModel::whereIn('ec_id',$entityChild)->delete();
            ResultHistoryModel::whereIn('ec_id',$entityChild)->delete();
            ResultPointModel::whereIn('ec_id',$entityChild)->delete();
            EntityCycleModel::where('cy_id',$id)->delete();

            //Xóa chính nó
            DefaultEntityModel::where('cy_id',$id)->delete();

            $result->delete();
            return true;
        }
        return false;
    }

    /**
     * Tìm kiếm chu kỳ YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        return $this::where('cy_active',1)
            ->where('cy_id', $id)->first();
    }


    // Chưa sử dụng  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    //***
    public function count(){
        return $this::where('cy_active',1)->count();
    }

}
