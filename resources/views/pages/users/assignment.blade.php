@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Điều hướng phân công theo lớp
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="">Phân công theo lớp</a>
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
    <div class="content-body" style="height: fit-content;">
        <div class="row mb-2">
            <div class="content-header-left col-12">
                @if(\App\Http\Controllers\RouteViewController::routeView('users/{role}'))
                    <div class=" float-md-left">
                        <button onclick="window.location.href='{{route('users/index',['role' => 'default'])}}'"
                                class="btn btn-info round  px-2 box-shadow-3" id="back" type="button"><i
                                    class="ft-info icon-left white"></i><span>Trở lại trang cán bộ</span></button>
                    </div>
                @endif
            </div>
        </div>
        <section id="html5" class="mb-5">
            {{--Danh sách từng con--}}
            <div class="row" id="achievement_item_user">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="dark font-weight-bold"><i class="ft-list"></i> Danh sách các lớp đang quản lý
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
                                @if(isset($data) && sizeof($data) > 0)
                                    <table id="assignment_list_class_table"
                                           class="table table-striped table-bordered dataex-html5-export table-responsive-sm">
                                        @else
                                            <table id="assignment_list_class_table"
                                                   class="table table-striped table-bordered dataex-html5-export table-responsive-sm"
                                                   style="display: none;">
                                                @endif
                                                <thead>
                                                <tr class="bg-info white">
                                                    <th>Class ID</th>
                                                    <th>Tên lớp</th>
                                                    <th>Chủ nhiệm</th>
                                                    <th>Niên khóa</th>
                                                </tr>
                                                </thead>
                                                <tbody id="class_item_tbody">
                                                @foreach($data as $key => $value)
                                                    <tr>
                                                        <td class="sorting_1">
                                                            <label class="nng">{{$value->cl_code}}
                                                                <input type="checkbox" name="cl_id[]"
                                                                       id="{{$value->cl_id}}"
                                                                       value="{{$value->cl_id}}">
                                                                <span class="checkmark checkmark_del"></span>
                                                            </label>
                                                        </td>
                                                        <td>{{$value->cl_name}}</td>
                                                        <td>{{$value->name}}</td>
                                                        <td>{{$value->sy_name}}</td>
                                                    </tr>
                                                @endforeach
                                                </tbody>
                                            </table>

                                            @if(isset($data) && sizeof($data) > 0)
                                                <div class="text-center" id="assignment_save_group">
                                                    @if(\App\Http\Controllers\RouteViewController::routeView('users/api/nonassignment/{id}'))
                                                        <button class="btn btn-info mr-1 round box-shadow-3"
                                                                onclick="getListNonClassForUser('{{$idUser}}')">
                                                            <i class="la la-plus white"></i> Thêm lớp
                                                        </button>
                                                    @endif
                                                    @if(\App\Http\Controllers\RouteViewController::routeView('users/api/assignment/remove/{id}'))
                                                        <button class="btn btn-danger mr-1 round box-shadow-3"
                                                                onclick="removeClassToAsignMent('{{$idUser}}')">
                                                            <i class="la la-trash white"></i> Xóa các mục đã chọn
                                                        </button>
                                                    @endif
                                                </div>
                                            @else
                                                <div class="card bg-white m-1 border" id="emptyDataShowInfo">
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

                                                <div class="text-center" id="assignment_save_group">
                                                    @if(\App\Http\Controllers\RouteViewController::routeView('users/api/nonassignment/{id}'))
                                                        <button class="btn btn-info mr-1 round box-shadow-3"
                                                                onclick="getListNonClassForUser('{{$idUser}}')">
                                                            <i class="la la-plus white"></i> Thêm lớp
                                                        </button>
                                                    @endif
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
@section('custom_js')
    @include('pages.users.assignment_js')
@endsection




