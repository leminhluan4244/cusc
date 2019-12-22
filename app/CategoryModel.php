<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;


class CategoryModel extends Model
{
    protected $table = 'category';
    protected $primaryKey = 'c_id';
    protected $keyType = 'varchar';
    protected $fillable = [
        'c_id',
        'c_item',
        'c_name',
        'c_max_scores',
        'c_type',
        'c_active',
        'created_at',
        'updated_at'
    ];
    // Điểm tối đa được phép
    protected $max_score = 10000000;


    /**
     * Hiển thị danh sách YES
     * @return mixed
     */
    public function index(){
        //Lấy dữ liệu đồng thời bỏ qua các mục ẩn
        $result = $this->list();
        //Đọc qua vòng foreach để lấy ra các mục con
        if(sizeof($result)>0){
            foreach ($result as $key => $value){
                //Hàm lấy danh sách các mục con thuộc mục cha thông qua id mục cha
                $value['child'] = (new CategoryChildModel())->child_of_category($value->c_id);
            }
        }
        return $result;
    }

    /**
     * Lấy ra danh sách các mục lớn không kèm mục con YES
     * @return mixed
     */
    public function list(){
        //Lấy dữ liệu đồng thời bỏ qua các mục ẩn
        $result = $this::where('category.c_active',1)
            ->orderBy('category.c_item', 'ASC')
            ->get();
        return $result;
    }

    /**
     * Tạo mới một mục lớn YES
     * @param Request $request
     * @return mixed
     */
    public function create(Request $request){
        $insert = [
            'c_id' => time(),
            'c_item' => $request->c_item,
            'c_name' => $request->c_name,
            'c_type' => $request->c_type,
            'c_active' => 1
        ];
        //Nếu chọn max thì lấy giá trị max
        if($request->max_scores_create=='max'){
            $insert['c_max_scores'] = $this->max_score;
        }
        //Ngược lại sử dụng giá trị đã nhập
        else{
            $insert['c_max_scores']= $request->c_max_scores;
        }
        //Nạp nguồn dữ liệu vào hàm insert
        $result = $this::insert($insert);
        //Trả về kết quả thao tác thêm
        return $result;
    }

    /**
     * Chỉnh sửa mục lớn YES
     * @param Request $request
     * @return mixed
     */
    public function change(Request $request){
        $change = [
            'c_item' => $request->c_item,
            'c_name' => $request->c_name,
            'c_type' => $request->c_type_update,
        ];
        //Nếu chọn max thì lấy giá trị max
        if($request->max_scores_update=='max'){
            $change['c_max_scores'] = $this->max_score;
        }
        //Ngược lại sử dụng giá trị đã nhập
        else{
            $change['c_max_scores']= $request->c_max_scores;
        }
        //Nạp nguồn dữ liệu vào hàm update
        $result = $this::where('c_id',$request->c_id)
            ->where('c_active',1)
            ->update($change);
        //Trả về kết quả thao tác sửa
        return $result;
    }

    /**
     * Xóa logic mục lớn YES
     * @param $id
     * @return bool
     */
    public function hide($id){
        $result = $this::where('c_id',$id)->where('c_active', 1);
        if($result->count()>0) {
            $result->update([
                'c_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục trạng thái mục lớn YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('c_id',$id)->where('c_active', 0);
        if($result->count()>0){
            $result->update([
                'c_active' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa vật lý mục lớn YES
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::find($id);
        if(isset($result)){
            //Lấy các mục con thuộc mục lớn này
            $isChild  = CategoryChildModel::where('c_id', $id)->select('cc_id')->get();
            if(sizeof($isChild) > 0){
                ActiveAchievementModel::whereIn('cc_id', $isChild)->delete();
                CategoryChildHasRolesModel::whereIn('cc_id', $isChild)->delete();
                CategoryChildHasCycleModel::whereIn('cc_id', $isChild)->delete();
                RegistrationModel::whereIn('cc_id', $isChild)->delete();
                ResultHistoryModel::whereIn('cc_id', $isChild)->delete();
                ResultLogModel::whereIn('cc_id', $isChild)->delete();
                ResultPointModel::whereIn('cc_id', $isChild)->delete();
                CategoryChildModel::where('c_id', $id)->delete();

            }
            ActiveAchievementModel::where('c_id', $id)->delete();
            RegistrationModel::where('c_id', $id)->delete();
            ResultHistoryModel::where('c_id', $id)->delete();
            ResultLogModel::where('c_id', $id)->delete();
            ResultPointModel::where('c_id', $id)->delete();
            SumScoresLogModel::where('c_id', $id)->delete();
            $result->delete();
            return true;
        }
        return false;
    }

    /**
     * Tìm mục lớn không đính kèm mục con YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        return $this::where('category.c_active',1)
            ->where('category.c_id',$id)
            ->first();
    }

    /**
     * Tìm mục lớn đính kèm mục con
     */
    public function search_full_child($id){
        $result = $this::where('category.c_active',1)
            ->where('category.c_id',$id)
            ->first();
        $result['child'] = (new CategoryChildModel())->child_of_category($id);
        return $result;
    }



    //??
    public function count(){
        return $this::where('c_active',1)->count();
    }


}
