<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;


class CategoryChildModel extends Model
{
    protected $table = 'category_child';
    protected $primaryKey = 'cc_id';
    protected $keyType = 'varchar';
    protected $fillable = ['cc_id', 'c_id', 'cc_item', 'cc_name', 'cc_max_scores', 'cc_max_amount', 'cc_max_scores_cycle', 'cc_active', 'created_at', 'updated_at'];
    protected $max_score = 10000000;

    /**
     * Thông tin tất cả mục con YES
     * @return mixed
     */
    public function index(){
        $child = $this::
        where('category_child.cc_active',1)
            ->get();
        if(sizeof($child)>0){
            foreach ($child as $key => $value){
                $value['cycle'] = CategoryChildHasCycleModel
                    ::leftjoin('cycle','cycle.cy_id','=','category_child_has_cycle.cy_id')
                    ->where('category_child_has_cycle.cc_id',$value->cc_id)
                    ->get();
                $value['roles'] = CategoryChildHasRolesModel
                    ::join('roles','roles.r_id','=','category_child_has_roles.r_id')
                    ->where('category_child_has_roles.cc_id',$value->cc_id)
                    ->get();
            }
        }
        return $child;
    }

    /**
     * Lấy thông tin mục con từ id mục cha YES
     * @param $id
     * @return mixed
     */
    public function child_of_category($id){
        //Lấy danh sách con của một mục cha
        $child = $this::
            where('category_child.cc_active',1)
            ->where('category_child.c_id',$id)
            ->orderBy('category_child.cc_item', 'ASC')
            ->get();
        //Chạy vòng foreach để lấy ra các chu kỳ và phân quyền được tác động
        if(sizeof($child)>0){
            foreach ($child as $key => $value){
                $value['cycle'] = CategoryChildHasCycleModel
                    ::leftjoin('cycle','cycle.cy_id','=','category_child_has_cycle.cy_id')
                    ->where('category_child_has_cycle.cc_id',$value->cc_id)
                    ->get();
                $value['roles'] = CategoryChildHasRolesModel
                    ::join('roles','roles.r_id','=','category_child_has_roles.r_id')
                    ->where('category_child_has_roles.cc_id',$value->cc_id)
                    ->get();
            }
        }
        return $child;
    }

    /**
     * Tạo mục con YES
     * @param Request $request
     * @return mixed
     */
    public function create(Request $request){
        //Tạo mảng dữ liệu
        $id = time();
        $insert = [
            'cc_id' => $id,
            'cc_item' => $request->cc_item,
            'cc_name' => $request->cc_name,
            'cc_max_scores' => $request->cc_max_scores,
            'cc_max_amount' => $request->cc_max_amount ,
            'cc_active' => 1,
            'c_id' => $request->c_id
        ];
        //Kiểm tra trường hợp chọn max điểm hay điểm thường
        if($request->max_scores_cycle=='max'){
            $insert['cc_max_scores_cycle'] = $this->max_score;
        }
        else{
            $insert['cc_max_scores_cycle']= $request->cc_max_scores_cycle;
        }
        //Nạp vào hàm insert
        $resultChild = $this::insert($insert);
        //Thêm vào bảng liên kết với chu kỳ
        CategoryChildHasCycleModel::insert([
            'ccc_id' => time(),
            'cc_id' => $id,
            'cy_id' =>$request->cy_id
        ]);
        //Thêm vào bảng liên kết với phân quyền
        foreach ($request->r_id as $key => $val){
            CategoryChildHasRolesModel::insert([
                'ccr_id' => time()+$key,
                'cc_id' => $id,
                'r_id' =>$val
            ]);
        }

        return $resultChild;
    }

    /**
     * Sửa đổi mục con YES
     * @param Request $request
     * @return mixed
     */
    public function change(Request $request){
        //Cập nhật bảng child
        $id = time();
        $update = [
            'cc_item' => $request->cc_item,
            'cc_name' => $request->cc_name,
            'cc_max_scores' => $request->cc_max_scores,
            'cc_max_amount' => $request->cc_max_amount ,
            'c_id' => $request->c_id
        ];
        //Kiểm tra trường hợp chọn max điểm hay điểm thường
        if($request->max_scores_cycle=='max'){
            $update['cc_max_scores_cycle'] = $this->max_score;
        }
        else{
            $update['cc_max_scores_cycle']= $request->cc_max_scores_cycle;
        }
        //Nạp vào hàm update
        $resultChild = $this::where('cc_id',$request->cc_id)
            ->where('cc_active',1)
            ->update($update);
        //Chỉnh sửa lại liên kết với chu kỳ
        CategoryChildHasCycleModel::where('cc_id',$request->cc_id)
        ->update([
            'cy_id' =>$request->cy_id
        ]);
        //Chỉnh sửa lại liên kết với phân quyền
        //Xóa các phần cũ
        CategoryChildHasRolesModel::where('cc_id', $request->cc_id)->delete();
        //Chèn lại
        foreach ($request->r_id as $key => $val){
            CategoryChildHasRolesModel::insert([
                'ccr_id' => time()+$key,
                'cc_id' => $request->cc_id,
                'r_id' =>$val
            ]);
        }

        return $resultChild;
    }

    /**
     * Xóa tạm mục con YES
     * @param $id
     * @return bool
     */
    public function hide($id){
        $result = $this::where('cc_id',$id)->where('cc_active', 1);
        if($result->count()>0) {
            $result->update([
                'cc_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục mục con YES
     */
    public function undo($id){
        $result = $this::where('cc_id',$id)->where('cc_active', 0);
        if($result->count()>0) {
            $result->update([
                'cc_active' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa vĩnh viễn mục con
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            ActiveAchievementModel::where('cc_id', $id)->delete();
            CategoryChildHasRolesModel::where('cc_id', $id)->delete();
            CategoryChildHasCycleModel::where('cc_id', $id)->delete();
            RegistrationModel::where('cc_id', $id)->delete();
            ResultHistoryModel::where('cc_id', $id)->delete();
            ResultLogModel::where('cc_id', $id)->delete();
            ResultPointModel::where('cc_id', $id)->delete();
            CategoryChildModel::where('cc_id', $id)->delete();
            return true;
        }
        return false;
    }

    /**
     * Tìm kiếm mục con YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        $child = $this
            ::where('category_child.cc_active',1)
            ->where('category_child.cc_id',$id)
            ->first();
        if(isset($child)){
            $child['cycle'] = CategoryChildHasCycleModel
                    ::leftjoin('cycle','cycle.cy_id','=','category_child_has_cycle.cy_id')
                    ->where('category_child_has_cycle.cc_id',$child->cc_id)
                    ->get();
            $child['roles'] = CategoryChildHasRolesModel
                    ::join('roles','roles.r_id','=','category_child_has_roles.r_id')
                    ->where('category_child_has_roles.cc_id',$child->cc_id)
                    ->get();
        }
        return $child;
    }

    //??
    public function count(){
        return $this::where('cc_active',1)->count();
    }

}
