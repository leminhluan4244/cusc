<div class="row" id="achievement_item_user">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="info font-weight-bold"><i class="ft-list"></i> Danh sách học viên tham gia
                </h4>
                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-content collapse show">
                <div class="card-body card-dashboard">
                    <table id="achievement_list_user_table" class="table table-striped table-bordered dataex-html5-export table-responsive-sm">
                        <thead>
                        <tr class="bg-info white">
                            <th>CUSC ID</th>
                            <th>Tên</th>
                            <th>Giới tính</th>
                            <th>Ngày sinh</th>
                        </tr>
                        </thead>
                        <tbody id="achievement_item_tbody">
                        @foreach($data['users'] as $key => $value)
                            <tr>
                                <td class="sorting_1">
                                    <label class="nng">{{$value->cusc_id}}
                                        <input type="checkbox" name="user_id[]" id="{{$value->id}}"
                                               value="{{$value->id}}">
                                        <span class="checkmark checkmark_del"></span>
                                    </label>
                                </td>
                                <td>{{$value->name}}</td>
                                <td>{{$value->gender}}</td>
                                <td>{{$value->birthday}}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <div class="text-center" id="achievement_add_user_save_button">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>