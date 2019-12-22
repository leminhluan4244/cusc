<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class CycleSelectModel extends Model
{
    protected $table = 'cycle_select';
    protected $primaryKey = 'cs_id';
    protected $keyType = 'varchar';
    protected $fillable = [ 'cs_id', 'cy_id', 'cs_name', 'cs_begin', 'cs_end', 'cs_active', 'created_at', 'updated_at'];

    /**
     * Hiển thị danh sách bộ chọn YES
     * @return mixed
     */
    public function index(){
        $cycle = CycleModel
            ::where('cy_active',1)
            ->orderBy('cy_name')
            ->get();
        foreach ($cycle as $key => $value){
            $select = $this::where('cs_active',1)
                ->where('cy_id',$value->cy_id)
                ->orderBy('cs_name')
                ->get();
            $value['select'] = $select;
        }
        return $cycle;
    }

    /**
     * Thêm một bộ chọn YES
     * @param Request $request
     * @return mixed
     */
    public function create(Request $request){
        $result = $this::insert([
            'cs_id' => time(),
            'cy_id' => $request->cy_id,
            'cs_name' => $request->cs_name,
            'cs_begin' => $request->cs_begin,
            'cs_end' => $request->cs_end,
            'cs_active' => 1
        ]);
        return $result;
    }

    /**
     * Sửa một bộ chọn YES
     * @param Request $request
     * @return mixed
     */
    public function change(Request $request){
        $result = $this::where('cs_id',$request->cs_id)
            ->where('cs_active',1)
            ->update([
                'cy_id' => $request->cy_id,
                'cs_name' => $request->cs_name,
                'cs_begin' => $request->cs_begin,
                'cs_end' => $request->cs_end,
            ]);
        return $result;
    }


    /**
     * Ẩn một bộ chọn YES
     * @param $id
     * @return bool
     */
    public function hide($id){
        $result = $this::where('cs_id',$id)
            ->where('cs_active',1);
        if($result->count()>0) {
            $result->update([
                'cs_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục một bộ chọn YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('cs_id',$id)
            ->where('cs_active',0);
        if($result->count()>0){
            $result->update([
                'cs_id' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa vĩnh viễn một bộ chọn YES
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            /**
             * Tìm giá trị chu kỳ con
             */
            $entityChild = EntityCycleModel::where('cs_id',$id)->select('ec_id')->get();

            /**
             * Xóa tất cả các mục liên quan tới giá trị con của mục này
             */

            DefaultEntityModel::whereIn('ec_id',$entityChild)->delete();
            ResultLogModel::whereIn('ec_id',$entityChild)->delete();
            ResultHistoryModel::whereIn('ec_id',$entityChild)->delete();
            ResultPointModel::whereIn('ec_id',$entityChild)->delete();
            EntityCycleModel::where('cs_id',$id)->delete();

            $result->delete();
            return true;
        }
        return false;
    }

    /**
     * Tìm kiếm một bộ chọn thông qua id YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        return $this::where('cs_active',1)
            ->where('cs_id', $id)->first();
    }

    /**
     * Các bộ chọn theo một chu kỳ YES
     */
    public function search_by_cycle($id){
        return $this
            ::join('cycle', 'cycle.cy_id', 'cycle_select.cy_id')
            ->where('cycle_select.cs_active',1)
            ->where('cycle.cy_active',1)
            ->where('cycle_select.cy_id', $id)
            ->get();
    }




    //** Đếm số bộ chọn NO */
    public function count(){
        return $this::where('cs_active',1)->count();
    }

}
