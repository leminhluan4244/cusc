<?php

namespace App;

use App\Http\Controllers\EntityCycleApiController;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class EntityCycleModel extends Model
{
    protected $table = 'entity_cycle';
    protected $primaryKey = 'ec_id';
    protected $keyType = 'varchar';
    protected $fillable = [
        'ec_id',
        'cs_id',
        'cy_id',
        'ec_name',
        'ec_begin',
        'ec_end',
        'ec_commit',
        'ec_active',
        'created_at',
        'updated_at'
    ];

    /**
     * Danh sách gái trị chu kỳ YES
     * @return mixed
     */
    public function index(){
        //Lấy dữ liệu chu kỳ
        $cycle = CycleModel
            ::where('cy_active',1)
            ->orderBy('cy_name')
            ->get();
        //Kiểm tra nếu có thì tiếp tục tìm trong bộ chọn
        if(sizeof($cycle)!=0)
        foreach ($cycle as $key => $value){
            //Tìm bộ chọn trong vòng lặp for
            $select = CycleSelectModel
                ::where('cs_active',1)
                ->where('cy_id',$value->cy_id)
                ->orderBy('cs_name')
                ->get();
            //Nếu có thì gắng dữ liệu vào thực thi vòng for
            if(sizeof($select)!=0){
                $value['select'] = $select;
                foreach ($value['select'] as $index => $val){
                    //Chạy vòng for và gắng dữ liệu vào
                    $entity = $this::leftjoin('default_entity','default_entity.ec_id','=','entity_cycle.ec_id')
                        ->where('entity_cycle.cs_id',$val['cs_id'])
                        ->where('entity_cycle.ec_active','>',0)
                        ->select('entity_cycle.*', 'default_entity.d_id')
                        ->orderBy('entity_cycle.ec_name')
                        ->orderBy('entity_cycle.ec_begin','DESC')
                        ->paginate(8);
                    //Kiểm tra nếu có thì gắng vào
                    if(sizeof($entity) > 0)
                    $val['entity'] = $entity;
                }
            }
        }
        return $cycle;
    }

    /**
     * Thêm giá trị chu kỳ YES
     * @param Request $request
     * @return mixed
     */
    public function create(Request $request){
        $id = time();
        $result = $this::insert([
            'ec_id' => $id,
            'cs_id' => $request->cs_id,
            'cy_id' => $request->cy_id,
            'ec_name' => $request->ec_name,
            'ec_begin' => $request->ec_begin,
            'ec_end' => $request->ec_end,
            'ec_active' => 1,
            'ec_commit' => null,
        ]);
        //Nếu mới tạo ra mà chưa có ai mặt định thì nó là mặt định
        $haveDefault = DefaultEntityModel
            ::where('cy_id', $request->cy_id)
            ->first();
        if(!isset($haveDefault)){
            DefaultEntityModel::insert([
                'd_id' => time(),
                'ec_id' => $id,
                'cy_id' => $request->cy_id
            ]);
        }
        return $result;
    }

    /**
     * Sửa giá trị chu kỳ YES
     * @param Request $request
     * @return mixed
     */
    public function change(Request $request){
        $result = $this::where('ec_id',$request->ec_id)
            ->update([
                'cs_id' => $request->cs_id,
                'cy_id' => $request->cy_id,
                'ec_name' => $request->ec_name,
                'ec_begin' => $request->ec_begin,
                'ec_end' => $request->ec_end,
            ]);
        return $result;
    }

    /** Ẩn giá trị chu kỳ YES
     * @param $id
     * @return mixed
     */
    public function hide($id){
        $result = $this::where('ec_id',$id)
            ->where('ec_active',1);
        if($result->count()>0) {
            $result->update([
                'ec_active' => 0
            ]);
            return true;
        }
        return false;
    }

    /**
     * Khôi phục giá trị chu kỳ YES
     * @param $id
     * @return bool
     */
    public function undo($id){
        $result = $this::where('ec_id',$id)
            ->where('ec_active',0);
        if($result->count()>0){
            $result->update([
                'ec_id' => 1
            ]);
            return true;
        }
        return false;
    }

    /**
     * Xóa giá trị chu kỳ YES
     * @param $id
     * @return bool
     */
    public function remove($id){
        $result = $this::find($id)->delete();
        if(isset($result)){
            DefaultEntityModel::where('ec_id',$id)->delete();
            ResultLogModel::where('ec_id',$id)->delete();
            ResultHistoryModel::where('ec_id',$id)->delete();
            ResultPointModel::where('ec_id',$id)->delete();
            EntityCycleModel::where('ec_id',$id)->delete();
            return true;
        }
        return false;
    }

    /**
     * Tìm kiểm giá trị chu kỳ YES
     * @param $id
     * @return mixed
     */
    public function search($id){
        return $this::join('cycle','cycle.cy_id','=','entity_cycle.cy_id')
            ->join('cycle_select','cycle_select.cs_id','=','entity_cycle.cs_id')
            ->where('entity_cycle.ec_active','>',0)
            ->where('entity_cycle.ec_id', $id)->first();
    }

    /***
     * Lấy ra chu kỳ sẵn sàng tiếp theo chuẩn bị cho xác nhận chu kỳ YES
     * @param Request $request
     * ec_id : chứa id chu kỳ hiện tại
     * @return array : danh sách các kết quả các chu kỳ có thể làm chu kỳ mặc định tiếp theo
     */
    public function getAvailableNextEntity(Request $request){
        //Lấy ra chu kỳ mặc định hiện tại
        $defaultEnity = $this->getDefaultEntityById($request->ec_id);
        //Trả về mảng rỗng nếu không có
        if(!isset($defaultEnity)) return [];

        //Lấy ra mảng các giá trị chu kỳ sẵn sàng cho việc thực thi tiếp theo
        $entityAvailable = $this->getListEntityAvailable($defaultEnity->cy_id, $request->ec_id);

        return $entityAvailable;
    }

    /***
     * NOTE: hàm này là hàm con không có API, hoặc CTRL
     * Lấy ra thông tin của nó nếu là mặc định, trả rỗng nếu không có
     * @param $ec_id truyền vào id chu kỳ
     * @return object : đối tượng chứa kết quả sửa dụng cho các hàm khác
     */
    public function getDefaultEntityById($ec_id){
        return DefaultEntityModel
            ::join('entity_cycle','entity_cycle.ec_id', 'default_entity.ec_id')
            ->where('default_entity.ec_id', $ec_id)
            ->first();
    }

    /***
     * NOTE: hàm này là hàm con không có API, hoặc CTRL
     * Lấy ra mảng các giá trị chu kỳ sẵn sàng cho việc phân công chu kỳ mặc định tiếp theo
     * @param $ec_id truyền vào id giá trị chu kỳ
     * @param $cs_id truyền vào id bộ chọn chu kỳ
     * @return object : đối tượng chứa kết quả sửa dụng cho các hàm khác
     */
    public function getListEntityAvailable($cy_id, $ec_id){
        //Lấy ra các chu kỳ chưa mở thi đua , trường commit thi đua chưa chốt là 1
        return $this::whereNull('ec_commit')
        //Lọc ra các chu kỳ cùng chu kỳ
        ->where('cy_id', $cy_id)
        //Loại trừ chu kỳ hiện tại
        ->where('ec_id', '<>', $ec_id)
        //Loại trừ các chu kỳ xóa tạm hoặc không hợp lệ
        ->where('ec_active','1')
        ->get();
    }

    public function count(){
        return $this::where('ec_active','>',0)->count();
    }


}
