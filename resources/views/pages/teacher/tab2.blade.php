<div class="tab-pane" id="tabIcon22" aria-labelledby="baseIcon-tab22">
    <p>Rỗng</p>
    <div class="mb-1 text-bold-600"><i class="ft-pocket"></i>
        <span class="menu-title">Tổng điểm: </span>
        <span class="badge badge badge-danger badge-pill mr-2">{{$val_child['result_lsum']}}</span>
    </div>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Điểm</th>
                <th>Chu kỳ</th>
                <th>Chú thích</th>
                <th>Tùy chỉnh</th>
            </tr>
            </thead>
            <tbody>
            @if(sizeof($val_child['result_log']))
                @foreach($val_child['result_log'] as $key_his=> $val_his)
                    <tr>
                        <td>{{$val_his->rl_scores}}</td>
                        <td>{{$val_his->ec_name}}</td>
                        <td>{{$val_his->rl_note}}</td>
                        <td class="justify-content-center">
                            <a class="mr-1 success"><i class="ft-eye"></i></a>
                        </td>
                    </tr>
                @endforeach
            @endif
            </tbody>
        </table>
    </div>
</div>