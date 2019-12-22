@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Tài khoản
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="">Quản trị viên</a>
                    </li>
                    <li class="breadcrumb-item active">Danh sách
                    </li>
                </ol>
            </div>
        </div>
    </div>
@endsection
@section('nav')
    @include('components.nav_fix_top')
@endsection

@section('menu')
    @include('components.menu_default')
@endsection
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
                    @if(\App\Http\Controllers\RouteViewController::routeView('users/create'))
                        <div class=" float-md-right">
                            <button class="btn btn-info round  px-2 box-shadow-3"
                                    onclick="CreateUserGetRoles('08cd66cb6b012217ed32cb8662a2a1d9')" id="add"
                                    type="button"><i class="ft-plus icon-left"></i><span>Thêm quản trị viên</span>
                            </button>
                        </div>
                    @endif
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Danh sách quản trị viên</h4>
                            <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                            <div class="heading-elements">
                                <ul class="list-inline mb-0">
                                    <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                    <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-content collapse show">
                            <div class="card-body card-dashboard">
                                @if(isset($data['list']) && sizeof($data['list'])>0)
                                    <table class="table  table-striped table-bordered dataex-html5-export table-responsive-sm">
                                        <thead>
                                        <tr class="bg-dark white">
                                            <th>CUSC ID</th>
                                            <th>Tên</th>
                                            <th>Giới tính</th>
                                            <th>Ngày sinh</th>
                                            <th>Tùy chọn</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($data['list'] as $key => $value)
                                            <tr>
                                                <td>{{$value->cusc_id}}</td>
                                                <td>{{$value->name}}</td>
                                                @if($value->gender==1)
                                                    <td>Nam</td>
                                                @else
                                                    <td>Nữ</td>
                                                @endif
                                                <td>{{date_format(new DateTime($value->birthday),'d-m-Y')}}</td>
                                                <td>
                                                    <div class="align-self-center">
                                                        <div class="btn-group text-center">
                                                            @if(\App\Http\Controllers\RouteViewController::routeView('users/api/search/{id}'))
                                                                <a class="btn btn-sm btn-info"
                                                                   data-toggle="popover"
                                                                   data-content="Xem chi tiết"
                                                                   data-trigger="hover"
                                                                   data-placement="top"
                                                                   onclick="infoStudent({{$value->id}})"
                                                                >
                                                                    <i class="ft-eye white"></i>
                                                                </a>
                                                            @endif
                                                            @if(\App\Http\Controllers\RouteViewController::routeView('users/change'))
                                                                <button data-toggle="popover"
                                                                        data-content="Cập nhật"
                                                                        data-trigger="hover"
                                                                        data-placement="top"
                                                                        onclick="UpdateUserGetRoles('08cd66cb6b012217ed32cb8662a2a1d9','{{$value->id}}')"
                                                                        class="btn btn-success btn-sm"
                                                                        data-toggle="dropdown" aria-haspopup="true"
                                                                        aria-expanded="false">
                                                                    <i class="ft-edit text-white"></i>
                                                                </button>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                        <tfoot>
                                        <tr class="bg-dark white">
                                            <th>CUSC ID</th>
                                            <th>Tên</th>
                                            <th>Giới tính</th>
                                            <th>Ngày sinh</th>
                                            <th>Tùy chọn</th>
                                        </tr>
                                        </tfoot>
                                    </table>
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
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection

@section('footer')
    @include('components.footer_default')
@endsection
@section('modal')
    @if(\App\Http\Controllers\RouteViewController::routeView('users/create'))
        @include('pages.users.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('users/change'))
        @include('pages.users.update')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('users/api/search/{id}'))
        @include('pages.users.profile')
    @endif
@endsection
@section('custom_js')
    @include('components.confirmation')
    @include('components.notification')
@endsection
@section('custom_css')
    <link rel="stylesheet" type="text/css" href="{{url('theme/app-assets/css/pages/users.css')}}">
    <style>

        .checkboxes-and-radios {
            background: white;
            padding: 5px;
        }

        .checkboxes-and-radios input[type=checkbox] + label:before, .checkboxes-and-radios input[type=radio] + label:before {
            border-radius: 0;
        }

        .checkboxes-and-radios input[type=checkbox] + label:after, .checkboxes-and-radios input[type=radio] + label:after {
            border-radius: 0;
        }

        .checkboxes-and-radios input[type=checkbox]:checked + label:after, .checkboxes-and-radios input[type=radio]:checked + label:after {
            background: #FF394F;
        }
    </style>
@endsection


