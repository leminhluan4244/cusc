@section('content-body')
    <div class="content-body">
        <section id="html5" class="mb-5">
            <div class="row mb-2">
                <div class="content-header-left col-12">
                    <div class=" float-md-left">
                        <button onclick="javascript:window.history.back()"
                                class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold" id="back" type="button">
                            <i class="ft-skip-back icon-left font-weight-bold warning"></i><span>Trang trước</span>
                        </button>
                        <button onclick="javascript:window.history.go(-1)"
                                class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold" id="next" type="button">
                            <span>Trang sau </span><i class="ft-skip-forward icon-right font-weight-bold warning"></i>
                        </button>
                    </div>
                    <div class=" float-md-right">
                        @if(\App\Http\Controllers\RouteViewController::routeView('users/create'))
                            <button class="btn btn-info round  px-2 box-shadow-3"
                                    onclick="CreateUserGetRoles('1b83df7a91f51b3d32cf6bda5b0fd23f')" id="add"
                                    type="button"><i class="ft-plus icon-left"></i><span>Thêm học viên</span></button>
                        @endif
                        @if(\App\Http\Controllers\RouteViewController::routeView('users/import'))
                            <button class="btn btn-success round  px-2 box-shadow-3" data-toggle="modal"
                                    data-target="#importModel" type="button"><i
                                        class="ft-arrow-down icon-left"></i><span>Excel Import</span>
                            </button>
                        @endif
                        <button onclick="showHide()" class="btn btn-danger round  px-2 box-shadow-3" type="button"><i
                                    class="ft-eye icon-left"></i><span id="hideShow">Rút gọn nội dung</span></button>
                    </div>
                </div>
            </div>
            <div class="row" id="dataFilter">
                @if(isset($data['list']) && sizeof($data['list'])>0)
                    @include('pages.users.table_student')
                    @foreach($data['list'] as $key => $value)
                        <li style="display: none;" class="{{$value->id}}">
                            {{$value->name}}
                            {{$value->cusc_id}}
                            {{date_format(new DateTime($value->birthday),'d-m-Y')}}
                            {{$value->scores}}
                        </li>
                        <div class="col-md-4 col-sm-6 col-12 pl-0" id="{{$value->id}}">
                            <div class="card m-0" style="margin-bottom: 0.5rem !important;">
                                <div class="card-content">
                                    <div class="card-body p-0">
                                        <div class="media-list list-group">
                                            <div class="list-group-item media p-1  ">
                                                <a class="media-link">
                                                    <h6 class="text-bold-600 m-0 mb-1">
                                                        <div class="checkboxes-and-radios p-0">
                                                            <input type="checkbox" name="check[]"
                                                                   id="check{{$value->id}}" value="{{$value->id}}">
                                                            <label class="m-0"
                                                                   for="check{{$value->id}}"><span>{{$value->name}} </span></label>
                                                        </div>
                                                    </h6>
                                                    <div class="media-left hideZ">
                                                        <p class="font-small-3 text-muted m-0 dark">{{$value->cusc_id}}</p>
                                                        <p class="font-small-3 text-muted m-0 dark">
                                                            @if($value->gender==1)
                                                                Nam
                                                            @elseif($value->gender==0)
                                                                Nữ
                                                            @else
                                                                Khác
                                                            @endif
                                                        </p>
                                                    </div>
                                                    <div class="media-body text-right hideZ">
                                                        <p class="font-small-3 text-muted m-0 danger"><span
                                                                    class="font-weight-bold">Tích lũy: {{$value->scores}}</span>
                                                        </p>
                                                        <p class="font-small-3 text-muted m-0 dark">{{date_format(new DateTime($value->birthday),'d-m-Y')}}</p>
                                                    </div>
                                                </a>
                                                <div class="heading-elements text-center pt-1 hideZ">
                                                    <div class="row">
                                                        @if(\App\Http\Controllers\RouteViewController::routeView('users/api/search/{id}'))
                                                            <div class="col-2">
                                                                <a data-toggle="popover" data-content="Chi tiết"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   onclick="infoStudent({{$value->id}})"
                                                                >
                                                                    <i class="ft-eye info background-round btn-outline-info "></i>
                                                                </a>
                                                            </div>
                                                        @endif
                                                        @if(\App\Http\Controllers\RouteViewController::routeView('users/change'))
                                                            <div class="col-2">
                                                                <a data-toggle="popover" data-content="Chỉnh sửa"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   onclick="UpdateUserGetRoles('1b83df7a91f51b3d32cf6bda5b0fd23f','{{$value->id}}')"
                                                                >
                                                                    <i class="ft-edit-2 success background-round btn-outline-success "></i>
                                                                </a>
                                                            </div>
                                                        @endif
                                                        @if(\App\Http\Controllers\RouteViewController::routeView('point/registration/{id}'))
                                                            <div class="col-2">
                                                                <a data-toggle="popover" data-content="Bảng đăng ký"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   href="{{route('point/registration',['id'=>$value->id])}}"
                                                                >
                                                                    <i class="ft-paperclip red background-round btn-outline-red "></i>
                                                                </a>
                                                            </div>
                                                        @endif
                                                        @if(\App\Http\Controllers\RouteViewController::routeView('point/result/{id}'))
                                                            <div class="col-2">
                                                                <a data-toggle="popover"
                                                                   data-content="Thành tích thi đua"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   href="{{route('point/result',['id'=>$value->id])}}"
                                                                >
                                                                    <i class="ft-star yellow background-round btn-outline-yellow "></i>
                                                                </a>
                                                            </div>
                                                        @endif
                                                        @if(\App\Http\Controllers\RouteViewController::routeView('users/hide/{id}'))
                                                            <div class="col-2">
                                                                <a data-toggle="popover" data-content="Xóa tạm"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   onclick="logicDelete(function() {window.location.href = '{{route('users/hide',['id'=>$value->id])}}'})"
                                                                >
                                                                    <i class="ft-trash-2 warning background-round btn-outline-warning "></i>
                                                                </a>
                                                            </div>
                                                        @endif
                                                        @if(\App\Http\Controllers\RouteViewController::routeView('users/remove/{id}'))
                                                            <div class="col-2">
                                                                <a data-toggle="popover" data-content="Xóa khỏi lớp"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   onclick="physicalDelete(function() {window.location.href = '{{route('users/remove',['id'=>$value->id])}}'},'Các dữ liệu liên quan đến hoạt động, điểm, lớp, bảng đăng ký sẽ tự động xóa hoặc thay đổi theo tác động này')"
                                                                >
                                                                    <i class="ft-trash danger background-round btn-outline-danger "></i>
                                                                </a>
                                                            </div>
                                                        @endif
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
                    <div class="col-12">
                        <div class="card bg-white m-1 border">
                            <div class="card-content ">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="media-body text-info text-left">
                                            <h6 class="font-weight-bold">Dữ liệu đang rỗng</h6>
                                            <span>Chọn thêm giá trị để tạo mới dữ liệu</span>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="ft-search text-white bg-info float-right background-round"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
            <div class="row">
                <div class="nns-pagination">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link"
                                                 href="{{ $data['list']->toArray()['first_page_url'] }}"><i
                                        class="ft-chevrons-left"></i></a></li>
                    </ul>
                    {!! $data['list']->links() !!}
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link"
                                                 href="{{ $data['list']->toArray()['last_page_url'] }}"><i
                                        class="ft-chevrons-right"></i></a></li>
                    </ul>

                </div>
            </div>
        </section>
    </div>
@endsection
@include('pages.users.default_student')
