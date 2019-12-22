<h4 class="pt-2 dark font-weight-bold mb-2"><i class="ft-list"></i> Danh sách thành viên
    @if(\App\Http\Controllers\RouteViewController::routeView('achievement/users/{id}'))
        <a class="white" href="{{route('achievement/users',['id'=>$data['active']['a_id']])}}">
            <button class="btn btn-round btn-danger btn-sm">
                <i class="ft-user-plus"></i> Điều hướng phân công
            </button>
        </a>
    @endif
</h4>
<div class="row">
    <div class="col-12">
        <div class="card" style="background: #f4f5e9;">
            <div class="card-content collapse show">
                <div class="card-body card-dashboard">
                    <table id="table_index"
                           class="table table-striped table-bordered dataex-html5-export table-responsive-sm">
                        <thead>
                        <tr class="bg-info white">
                            <th>CUSC ID</th>
                            <th>Tên</th>
                            <th>Giới tính</th>
                            <th>Ngày sinh</th>
                            <th>Vai trò</th>
                        </tr>
                        </thead>
                        <tbody>
                        @if(sizeof($data['users'])>0)
                            @foreach($data['users'] as $key => $value)
                                <tr class="bg-white {{$value['aa_id']}}">
                                    <td>{{$value['cusc_id']}}</td>
                                    <td>{{$value['name']}}</td>
                                    @if($value['gender']==1)
                                        <td>Nam</td>
                                    @else
                                        <td>Nữ</td>
                                    @endif
                                    <td>{{date_format(new DateTime($value['birthday']),'d-m-Y')}}</td>
                                    <td>{{$value['aa_name']}}</td>
                                </tr>
                            @endforeach
                        @endif

                        </tbody>
                        <tfoot>
                        <tr class="bg-info white">
                            <th>CUSC ID</th>
                            <th>Tên</th>
                            <th>Giới tính</th>
                            <th>Ngày sinh</th>
                            <th>Vai trò</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>