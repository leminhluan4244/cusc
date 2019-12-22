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
                @if(\App\Http\Controllers\RouteViewController::routeView('category/create'))
                    <div class=" float-md-right">
                        <button class="btn btn-info round px-2 box-shadow-3" id="add" type="button" data-toggle="modal"
                                data-target="#addModel"><i class="ft-plus icon-left"></i><span>Thêm mục lớn</span>
                        </button>
                    </div>
                @endif
            </div>
        </div>
        <div class="row">
            @if(sizeof($data) > 0)
                @foreach($data as $c_key => $c_val)
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title {{(!isset($c_val['child']) || sizeof($c_val['child'])==0) ? 'danger' : ''}}">{{$c_val->c_item}}
                                    . {{$c_val->c_name}}
                                </h4>
                                <div class="heading-elements">
                                    <ul class="list-inline mb-0">
                                        <li><a data-action="collapse"><i class="ft-chevrons-down"></i></a></li>
                                        <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                    </ul>
                                </div>
                                <div class="row pt-1">
                                    <div class="col-md-4 col-12">
                                        <a class=""><i class="ft-pocket"></i>
                                            <span class="menu-title">Điểm tối đa: </span>
                                            @if($c_val->c_max_scores==10000000)
                                                <span class="badge badge badge-info badge-pill mr-2">Maximum</span>
                                            @else
                                                <span class="badge badge badge-info badge-pill mr-2">{{$c_val->c_max_scores}}</span>
                                            @endif
                                        </a>
                                    </div>
                                    <div class="col-md-8 col-12">
                                        <a class=""><i class="ft-pocket"></i>
                                            <span class="menu-title">Cách cộng mục con: </span>
                                            @if($c_val->c_type==1)
                                                <span class="badge badge badge-info badge-pill mr-2">Cộng dồn các mục</span>
                                            @else
                                                <span class="badge badge badge-info badge-pill mr-2">Điểm mục lớn nhất</span>
                                            @endif
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-content collapse " style="background: #F4F5E9;">
                                <div class="card-body">
                                    <div class="heading-elements mb-1">
                                        <ul class="list-inline mb-0">
                                            @if(\App\Http\Controllers\RouteViewController::routeView('child/create'))
                                                <li class="pr-2"
                                                    onclick="CategoryChildGetForm('{{$c_val->c_id}}','{{$c_val->c_name}}')">
                                                    <a data-toggle="popover" data-content="Thêm mục con"
                                                       data-trigger="hover" data-placement="top"><i
                                                                class="ft-plus btn-outline-info background-round"
                                                                style="font-size: 20px;"></i></a></li>
                                            @endif
                                            @if(\App\Http\Controllers\RouteViewController::routeView('category/change'))
                                                <li class="pr-2 " onclick="UpdateGet('{{$c_val->c_id}}')"><a
                                                            data-toggle="popover" data-content="Chỉnh sửa"
                                                            data-trigger="hover"
                                                            data-placement="top"><i
                                                                class="ft-edit-3 btn-outline-success background-round"
                                                                style="font-size: 20px;"></i></a></li>
                                            @endif
                                            @if(\App\Http\Controllers\RouteViewController::routeView('category/hide/{id}'))
                                                <li class="pr-2"><a data-toggle="popover" data-content="Xóa tạm"
                                                                    data-trigger="hover" data-placement="top"
                                                                    onclick="hide('{{$c_val->c_id}}')"><i
                                                                class="ft-trash-2 btn-outline-warning background-round"
                                                                style="font-size: 20px;"></i></a>
                                                </li>
                                            @endif
                                            @if(\App\Http\Controllers\RouteViewController::routeView('category/remove/{id}'))
                                                <li class="pr-2"><a data-toggle="popover" data-content="Xóa vĩnh viễn"
                                                                    data-trigger="hover" data-placement="top"
                                                                    onclick="remove('{{$c_val->c_id}}')"><i
                                                                class="ft-trash btn-outline-danger background-round"
                                                                style="font-size: 20px;"></i></a>
                                                </li>
                                            @endif

                                        </ul>
                                    </div>
                                    {{--//Chèn con ở đây--}}
                                    @include('pages.child.index')
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
                                        <span>Chọn thêm mục lớn để tạo mới dữ liệu cho hệ thống</span>
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
@include('pages.category.default')
