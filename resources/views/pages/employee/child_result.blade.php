<div class="row">
    @if(sizeof($c_val['child'])!=0)
        @foreach($c_val['child'] as $kchild => $val_child)
            <div class="col-12">
                <div class="card mb-1 mt-1">
                    <div class="card-content collapse show">
                        <div class="card-body pb-0 pt-0">
                            <div class="card mb-0" style="background:  #F4F5FA;">
                                <div class="card-content bg-white">
                                    <div class="card mb-0">
                                        <div class="card-header" style="background: #f4f5e9;border-radius: 0.5rem;">
                                            <a style="white-space: initial;" >
                                                <span class="menu-title" >
                                                    <b>{{$val_child->cc_item}}. {{$val_child->cc_name}}
                                                        @if(!empty($val_child['select']))
                                                            <small class="success text-bold-600">&ensp; (Đã chọn) </small>
                                                        @else
                                                            <small class="danger text-bold-600">&ensp; (Chưa chọn) </small>
                                                        @endif
                                                    </b>
                                                </span>
                                            </a>
                                            <div class="heading-elements">
                                                <ul class="list-inline mb-0">
                                                    <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                                    <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="card-content collapse mt-1 mb-1">
                                            <ul class="row menu-content">
                                                <div class="col-md-5 col-12">
                                                    <ul>
                                                        <li>
                                                            <a class="menu-item" style="white-space: initial;">
                                                                <i class="ft-play-circle"></i> Điểm tối đa / lần : <b>{{$val_child->cc_max_scores}}</b>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="menu-item" style="white-space: initial;">
                                                                <i class="ft-play-circle"></i> Lần tối đa / chu kỳ: <b>{{$val_child->cc_max_amount}}</b>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="menu-item" style="white-space: initial;">
                                                                @if($val_child->cc_max_scores_cycle==10000000)
                                                                    <i class="ft-play-circle"></i> Điểm tối đa / Chu kỳ: <b>Không giới hạn</b>
                                                                @else
                                                                    <i class="ft-play-circle"></i> Điểm tối đa / Chu kỳ: <b>{{$val_child->cc_max_scores_cycle}}</b>
                                                                @endif
                                                            </a>
                                                        </li>
                                                        @if(\App\Http\Controllers\Auth\arrayListRoute::checkEmployee($val_child['roles']))
                                                        <div id="buttonControl{{$val_child->cc_id}}">
                                                            <a class="btn btn-dark btn-sm round px-2 box-shadow-3 white ml-2 mt-1" onclick="insertResultScoresEmployee('{{$data['user']->id}}','{{$val_child->cc_id}}','{{$val_child['entity']['ec_id']}}')">
                                                                <span class="font-size-base">Lưu lại</span>
                                                            </a>
                                                        </div>
                                                        @endif
                                                    </ul>
                                                </div>
                                                <div class="col-md-7 col-12" >
                                                    @if(\App\Http\Controllers\Auth\arrayListRoute::checkEmployee($val_child['roles']))
                                                    <div class="position-relative has-icon-left mr-3">
                                                        <input type="number" class="form-control" id="scores{{$val_child->cc_id}}" placeholder="Điểm">
                                                        <div class="form-control-position">
                                                            <i class="ft-edit"></i>
                                                        </div>
                                                    </div>
                                                    <div class="position-relative has-icon-left mr-3 mt-1">
                                                        <textarea rows="3" class="form-control" id="note{{$val_child->cc_id}}" placeholder="Chú thích"></textarea>
                                                        <div class="form-control-position">
                                                            <i class="ft-file"></i>
                                                        </div>
                                                    </div>
                                                    @endif
                                                </div>
                                            </ul>
                                            <ul class="nav nav-pills" style="background: #f4f5e9;">
                                                <li class="nav-item">
                                                    <a class="nav-link active" id="baseIcon-tab21" data-toggle="tab" aria-controls="tabIcon21" href="#tabIcon21" aria-expanded="true"><i class="la la-play"></i> Điểm hiện tại</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="baseIcon-tab22" data-toggle="tab" aria-controls="tabIcon22" href="#tabIcon22" aria-expanded="false"><i class="la la-flag"></i> Lịch sử cộng</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="baseIcon-tab23" data-toggle="tab" aria-controls="tabIcon23" href="#tabIcon23" aria-expanded="false"><i class="la la-table"></i> Gợi ý cộng</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content px-1 pt-1">
                                                @include('pages.employee.tab1')
                                                @include('pages.employee.tab2')
                                                @include('pages.employee.tab3')
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach

    @else
        <div class="col-12 text-center"><span class="text-danger">Danh sách rỗng</span></div>
    @endif
</div>
<script>
    function insertResultScoresEmployee(u_id,cc_id,ec_id) {
        $.ajax({
            type: 'POST',
            url: '{{route('assignment/api/create')}}',
            data: {
                _token: '{{csrf_token()}}',
                rp_scores: $("#scores"+cc_id).val(),
                rp_note: $("#note"+cc_id).val(),
                u_id: u_id,
                cc_id: cc_id,
                ec_id: ec_id
            },
            dataType: 'JSON',
            success: function (res) {
                chitiet = res.data;
                var htmlTable =
                    '<tr id="trScores'+chitiet.rp_id+'">'+
                        '<td>'+res.data.rp_scores+'</td>'+
                        '<td>'+nss_formatDate(chitiet.updated_at)+'</td>'+
                        '<td>'+res.data.rp_note+'</td>'+
                        '<td>'+
                            '<a onclick="updateResultScoresEmployeeShow('+chitiet.rp_id+','+chitiet.u_id+','+chitiet.cc_id+','+chitiet.ec_id+')" class="mr-1 success"><i class="la la-edit"></i></a>'+
                            '<a onclick="deleteResultScoresEmployee('+chitiet.rp_id+')" class="danger"><i class="la la-close "></i></a>'+
                        '</td>';
                    '</tr>';
                $("#tbodyScores"+cc_id).append(htmlTable);
                $("#scores"+cc_id).val(null);
                $("#note"+cc_id).val(null);
            }
        });
    }
    function insertResultScoresEmployeeShow(u_id,cc_id,ec_id) {
        htmlInsert =
            '<a class="btn btn-dark btn-sm rocc_idund px-2 box-shadow-3 white ml-2 mt-1" onclick="insertResultScoresEmployee('+u_id+','+cc_id+','+ec_id+')">'+
                '<span class="font-size-base">Lưu lại</span>'+
            '</a>';
        $("#buttonControl"+cc_id).html(htmlInsert);
        $("#scores"+cc_id).val(null);
        $("#note"+cc_id).val(null);
    }
    function updateResultScoresEmployeeShow(rp_id,u_id,cc_id,ec_id) {
        var url = '{{route('assignment/api/info',['id'=> ':slug'])}}';
        url = url.replace(':slug', rp_id);
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                htmlUpdate =
                    '<a class="btn btn-success btn-sm round px-2 box-shadow-3 white ml-2 mt-1" onclick="updateResultScoresEmployee('+rp_id+','+u_id+','+cc_id+','+ec_id+')">'+
                    '<span class="font-size-base">Lưu lại</span>'+
                    '</a>'+
                    '<a class="btn btn-danger btn-sm round px-2 box-shadow-3 white ml-2 mt-1" onclick="insertResultScoresEmployeeShow('+u_id+','+cc_id+','+ec_id+')">'+
                    '<span class="font-size-base">Hủy</span>'+
                    '</a>';
                $("#buttonControl"+cc_id).html(htmlUpdate);
                $("#scores"+cc_id).val(chitiet.rp_scores);
                $("#note"+cc_id).val(chitiet.rp_note);
            }
        });
    }
    function updateResultScoresEmployee(rp_id,u_id,cc_id,ec_id) {
        $.ajax({
            type: 'POST',
            url: '{{route('assignment/api/change')}}',
            data: {
                _token: '{{csrf_token()}}',
                rp_scores: $("#scores"+cc_id).val(),
                rp_note: $("#note"+cc_id).val(),
                u_id: u_id,
                ec_id: ec_id,
                rp_id: rp_id,
            },
            dataType: 'JSON',
            success: function (res) {
                chitiet = res.data;
                $("#trScores"+chitiet.rp_id).innerHTML = '';
                var htmlTable =
                    '<td>'+chitiet.rp_scores+'</td>'+
                    '<td>'+nss_formatDate(chitiet.updated_at)+'</td>'+
                    '<td>'+chitiet.rp_note+'</td>'+
                    '<td>'+
                        '<a onclick="updateResultScoresEmployeeShow('+chitiet.rp_id+','+chitiet.u_id+','+chitiet.cc_id+','+chitiet.ec_id+')" class="mr-1 success"><i class="la la-edit"></i></a>'+
                        '<a onclick="deleteResultScoresEmployee('+chitiet.rp_id+')" class="danger"><i class="la la-close "></i></a>'+
                    '</td>';
                $("#trScores"+chitiet.rp_id).html(htmlTable);
                insertResultScoresEmployeeShow(u_id,cc_id,ec_id);
            }
        });
    }
    function deleteResultScoresEmployee(rp_id) {
        var url = '{{route('assignment/api/remove',['id'=> ':slug'])}}';
        url = url.replace(':slug', rp_id);
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#trScores"+rp_id).remove();
            }
        });
    }
</script>