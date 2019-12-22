<div role="tabpanel" class="tab-pane active" id="tabIcon21" aria-expanded="true" aria-labelledby="baseIcon-tab21">
    <p>Rỗng</p>
    <div class="mb-1 text-bold-600"><i class="ft-pocket"></i>
        <span class="menu-title">Tổng điểm: </span>
        <span class="badge badge badge-danger badge-pill mr-2" id="sum{{$val_child->cc_id}}">{{$val_child['result_psum']}}</span>
    </div>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Điểm</th>
                <th>Ngày cộng</th>
                <th>Chú thích</th>
                @if(\App\Http\Controllers\Auth\arrayListRoute::checkEmployee($val_child['roles']))
                <th>Tùy chỉnh</th>
                @endif
            </tr>
            </thead>
            <tbody id="tbodyScores{{$val_child->cc_id}}">
            @if(sizeof($val_child['result']))
                @foreach($val_child['result'] as $key_res=> $val_res)
                    <tr id="trScores{{$val_res->rp_id}}">
                        <td id="tdScores{{$val_res->rp_id}}">{{$val_res->rp_scores}}</td>
                        <td id="tdUpdate{{$val_res->rp_id}}">{{$val_res->updated_at}}</td>
                        <td id="tdNote{{$val_res->rp_id}}">{{$val_res->rp_note}}</td>
                        @if(\App\Http\Controllers\Auth\arrayListRoute::checkEmployee($val_child['roles']))
                        <td id="tdTool{{$val_res->rp_id}}">
                            <a onclick="updateResultScoresShow('{{$val_res->rp_id}}','{{$data['user']->id}}','{{$val_child->cc_id}}','{{$val_child['entity']['ec_id']}}')" class="mr-1 success"><i class="la la-edit"></i></a>
                            <a onclick="deleteResultScores('{{$val_res->rp_id}}')" class="danger"><i class="la la-close "></i></a>
                        </td>
                        @endif
                    </tr>
                @endforeach
            @endif
            </tbody>
        </table>
    </div>
</div>