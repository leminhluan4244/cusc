@section('content-body')
    <div class="content-body">
        <div class="row mb-2">
            <div class="content-header-left col-12">
                <div class=" float-md-left">
                    <button onclick="javascript:window.history.back()"
                            class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold" id="back" type="button"><i
                                class="ft-skip-back icon-left font-weight-bold warning"></i><span>Trang trước</span>
                    </button>
                    <button onclick="javascript:window.history.go(-1)"
                            class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold" id="next" type="button">
                        <span>Trang sau </span><i class="ft-skip-forward icon-right font-weight-bold warning"></i>
                    </button>
                </div>
                <div class=" float-md-right">
                    @if(\App\Http\Controllers\RouteViewController::routeView('achievement/create'))
                        <button class="btn btn-info round  px-2 box-shadow-3" type="button"
                                onclick="CreateActiveGetCategory()">
                            <i class="ft-plus icon-left"></i>
                            <span>Thêm vai trò mới</span>
                        </button>
                    @endif
                    @if(\App\Http\Controllers\RouteViewController::routeView('achievement/users/{id}'))
                        <a href="{{route('achievement/users',['id'=>$data['active']['a_id']])}}" class="white">
                            <button class="btn btn-warning round  px-2 box-shadow-3" type="button">
                                <i class="ft-chevrons-right icon-left">
                                </i>
                                <span>Điều hướng phân công</span>
                            </button>
                        </a>
                    @endif
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header pb-0 mt-0">
                        <h4 class="dark font-weight-bold"><span class="info">{{$data['active']['a_name']}}</span></h4>
                        <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4 col-12">
                                    <a><i class="ft-pocket"></i>
                                        <span class="menu-title">Người tạo: </span>
                                        <span class="badge badge-info badge-pill mr-2">{{$data['active']['name']}}</span>
                                    </a>
                                </div>
                                <div class="col-md-4 col-12">
                                    <a><i class="ft-pocket"></i>
                                        <span class="menu-title">Bắt đầu ngày: </span>
                                        <span class="badge badge-info badge-pill mr-2">{{date_format(new DateTime($data['active']['a_begin']),'d-m-Y')}}</span>
                                    </a>
                                </div>
                                <div class="col-md-4 col-12">
                                    <a><i class="ft-pocket"></i>
                                        <span class="menu-title">Kết thúc ngày: </span>
                                        <span class="badge badge-info badge-pill mr-2">{{date_format(new DateTime($data['active']['a_end']),'d-m-Y')}}</span>
                                    </a>
                                </div>
                            </div>
                            <h4 class="pt-2 dark font-weight-bold"><i class="ft-info"></i> Nội dung chi tiết</h4>
                            <div class="row">
                                <div class="col-12">
                                    <a><i class="ft-pocket"></i>
                                        <span class="menu-title">Mô tả hoạt động: </span>
                                        <span class="badge badge-dark badge-pill dark font-weight-bold ml-1 ">{{$data['active']['cc_name']}}</span>
                                    </a>
                                </div>
                                <div class="col-12 mt-2 pt-1 ">
                                    <div class="card m-0 border-1 border-radius border-info">
                                        <div class="card-header p-0 pb-1">
                                            <div class="heading-elements">
                                                <ul class="list-inline mb-0">
                                                    <li><a data-action="collapse"><i class="ft-chevrons-down"></i></a></li>
                                                    <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                                    <li><a data-action="close"><i class="ft-x"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="card-content">
                                            <div class="card-body">
                                                {!!$data['active']['a_note']!!}
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <h4 class="pt-2 dark font-weight-bold mb-2"><i class="ft-list"></i> Danh sách vai trò
                                @if(\App\Http\Controllers\RouteViewController::routeView('achievement/create'))
                                    <a onclick="CreateActiveGetCategory()">
                                        <button class="btn btn-round btn-danger btn-sm">
                                            <i class="ft-plus"></i>
                                            Thêm vai trò
                                        </button>
                                    </a>
                                @endif
                            </h4>
                            @include('pages.achievement.achievement_list')
                            @include('pages.achievement.table_index')
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    {{--@include('pages.achievement.menu')--}}
@endsection
@include('pages.achievement.default')
