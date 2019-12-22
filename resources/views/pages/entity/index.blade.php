@section('content-body')
    <div class="content-body">
        <div class="row mb-2">
            <div class="content-header-left col-12">
                <div class=" float-md-left">
                    @if(\App\Http\Controllers\RouteViewController::routeView('cycle'))
                        <button onclick="window.location.href='{{route('cycle/index')}}'"
                                class="btn btn-warning btn-round  px-2 box-shadow-3 font-weight-bold" id="back"
                                type="button">
                            <i class="ft-skip-back icon-left font-weight-bold white"></i>
                            <span>Chỉ xem chu kỳ</span>
                        </button>
                    @endif
                    @if(\App\Http\Controllers\RouteViewController::routeView('select'))
                        <button onclick="window.location.href='{{route('select/index')}}'"
                                class="btn btn-warning btn-round  px-2 box-shadow-3 font-weight-bold" id="back"
                                type="button">
                            <i class="ft-skip-back icon-left font-weight-bold white"></i>
                            <span>Chỉ xem bộ chọn</span>
                        </button>
                    @endif
                </div>
                @if(\App\Http\Controllers\RouteViewController::routeView('entity/create'))
                    <div class=" float-md-right">
                        <button class="btn btn-info round px-2 box-shadow-3" id="add" type="button" data-toggle="modal"
                                data-target="#addCycleModel"><i class="ft-plus icon-left"></i><span>Thêm mục lớn</span>
                        </button>
                    </div>
                @endif
            </div>
        </div>
        <div class="row">
            {{--Kiểm tra và đỗ dữ liệu chu kỳ--}}
            @if(isset($data) && sizeof($data) > 0)
                @foreach($data as $cy_key => $cy_val)
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title ">Chu kỳ: {{$cy_val->cy_name}}
                                </h4>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                        <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                    </ul>
                                </div>
                                <div class="row pt-1">
                                    <div class="col-md-4 col-12">
                                        <a class=""><i class="ft-pocket"></i>
                                            <span class="menu-title">Độ dài: </span>
                                            <span class="badge badge badge-info badge-pill mr-2">{{$cy_val->cy_long}}</span>
                                        </a>
                                    </div>
                                    <div class="col-md-8 col-12">
                                        <a class=""><i class="ft-pocket"></i>
                                            <span class="menu-title">Số bộ chọn: </span>
                                            @if(isset($cy_val['select']))
                                                <span class="badge badge badge-info badge-pill mr-2">{{$cy_val['select']->count()}}</span>
                                            @else
                                                <span class="badge badge badge-info badge-pill mr-2">0</span>
                                            @endif
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-content collapse " style="background: #F4F5E9;">
                                <div class="card-body">
                                    <div class="heading-elements mb-1">
                                        <ul class="list-inline mb-0">
                                            @if(\App\Http\Controllers\RouteViewController::routeView('select/create'))
                                                <li class="pr-2">
                                                    <a data-toggle="popover" data-content="Thêm mục con"
                                                       data-trigger="hover" data-placement="top"
                                                       onclick="CreateSelectgetListCycle()"
                                                    >
                                                        <i class="ft-plus dark btn-outline-info background-round round"
                                                           style="font-size: 20px;"></i>
                                                    </a>

                                                </li>
                                            @endif
                                            @if(\App\Http\Controllers\RouteViewController::routeView('cycle/change'))
                                                <li class="pr-2 ">
                                                    <a data-toggle="popover" data-content="Chỉnh sửa"
                                                       data-trigger="hover"
                                                       data-placement="top"
                                                       onclick="getbyId('{{$cy_val->cy_id}}','{{$cy_val->cy_name}}','{{$cy_val->cy_long}}')"
                                                    >
                                                        <i class="ft-edit-3 dark btn-outline-success background-round round"
                                                           style="font-size: 20px;"></i>
                                                    </a>
                                                </li>
                                            @endif
                                            @if(\App\Http\Controllers\RouteViewController::routeView('cycle/hide/{id}'))
                                                <li class="pr-2">
                                                    <a data-toggle="popover" data-content="Xóa tạm"
                                                       data-trigger="hover" data-placement="top"
                                                       onclick="logicDelete(function() {window.location.href = '{{route('cycle/hide',['id'=>$cy_val->cy_id])}}'})"
                                                    >
                                                        <i class="ft-trash-2 dark btn-outline-warning background-round round"
                                                           style="font-size: 20px;"></i>
                                                    </a>
                                                </li>
                                            @endif
                                            @if(\App\Http\Controllers\RouteViewController::routeView('cycle/remove/{id}'))
                                                <li class="pr-2">
                                                    <a data-toggle="popover" data-content="Xóa vĩnh viễn"
                                                       data-trigger="hover" data-placement="top"
                                                       onclick="physicalDelete(function() {window.location.href = '{{route('cycle/remove',['id'=>$cy_val->cy_id])}}'},'Bộ chọn, bộ giá trị và tất cả các mục điểm liên quan tới chu kỳ này sẽ xóa, đây là thao tác quan trọng hãy cẩn trọng trước khi thực hiện')"
                                                    >
                                                        <i class="ft-trash dark btn-outline-danger background-round round"
                                                           style="font-size: 20px;"></i>
                                                    </a>
                                                </li>
                                            @endif

                                        </ul>
                                    </div>
                                    {{--//Chèn các bộ chọn ở đây--}}
                                    @include('pages.entity.select')
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="col-12">
                    <div class="card bg-white m-1">
                        <div class="card-content ">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-info text-left">
                                        <h4 class="font-weight-bold">Dữ liệu đang rỗng</h4>
                                        <span>Chọn thêm chu kỳ để tạo mới dữ liệu</span>
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
    </div>
@endsection
@include('pages.entity.default')

