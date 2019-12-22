@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Phân quyền
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="{{route("roles/index")}}">Phân quyền</a>
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
{{-------}}
@section('modal')
    @if(\App\Http\Controllers\RouteViewController::routeView('roles/create'))
        @include('pages.roles.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('roles/update'))
        @include('pages.roles.update')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('permission/create'))
        @include('pages.roles.controlRole')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('api/route/{id}'))
        @include('pages.roles.route')
    @endif
@endsection

@section('footer')
    @include('components.footer_default')
@endsection
@section('custom_css')
    <link rel="stylesheet" type="text/css" href="{{url('theme/app-assets/vendors/css/forms/tags/tagging.css')}}">
    <link rel="stylesheet" type="text/css" href="{{url('theme/app-assets/vendors/css/forms/selects/select2.min.css')}}">
    <style>
        .select2-selection__choice {
            background-color: #464855 !important;
        }
    </style>
@endsection

@section('custom_js')
    @include('components.confirmation')
    @include('components.control')
    @include('components.notification')
    <script src="{{url('theme/app-assets/vendors/js/forms/tags/tagging.min.js')}}" type="text/javascript"></script>
    <script src="{{url('theme/app-assets/js/scripts/forms/tags/tagging.js')}}" type="text/javascript"></script>
    <script src="{{url('theme/app-assets/vendors/js/forms/select/select2.full.min.js')}}"
            type="text/javascript"></script>
    <script src="{{url('theme/app-assets/js/scripts/forms/select/form-select2.js')}}" type="text/javascript"></script>
    <script>
        $('.ctrlRolesChange').css("display", "block");

        //Xóa một phân quyền truy cập dữ liệu
        function PermissionDelete(id) {
            var url = '{{route('permission/api/remove',['id'=> ':slug'])}}';
            url = url.replace(':slug', id);
            $.ajax({
                type: 'GET',
                url: url,
                data: {
                    _token: '{{csrf_token()}}',
                },
                success: function (res) {
                    if (res.status == 'r00') {
                        $('#pm_id' + id).remove();
                        toastr.success('Điều hướng phân công đã xóa', 'Thao tác thành công');
                    }
                    else {
                        res.message.forEach(e => {
                            toastr.error(e);
                        })
                    }
                }
            });
        }

        //Đưa dữ liệu vào bảng chỉnh sửa
        function RolesGetUpdate(id, name, note) {
            $('#r_id_update').val(id);
            $('#r_name_update').val(name);
            $('#r_note_update').val(note);
            $('#updateModel').modal('show');
        }

        //kéo dữ liệu các route được truy cập của một phân quyền
        function getRoute(id) {
            var url = '{{route('permission/api',['id'=> ':slug'])}}';
            url = url.replace(':slug', id);
            $.ajax({
                type: 'GET',
                url: url,
                data: {
                    _token: '{{csrf_token()}}',
                },
                success: function (res) {
                    chitiet = res.data;
                    var htmlTable = '';
                    $("#contentRoute").innerHTML = '';
                    if (chitiet.length == 0) {
                        htmlTable = htmlTable +
                            `
                             <div class="col-12">
                                <div class="card bg-white m-1 border">
                                    <div class="card-content ">
                                        <div class="card-body">
                                            <div class="media d-flex">
                                                <div class="media-body text-info text-left">
                                                    <h6 class="font-weight-bold">Dữ liệu đang rỗng</h6>
                                                    <span>Hãy tạo liên kết cho phân quyền này truy cập</span>
                                                </div>
                                                <div class="align-self-center">
                                                    <i class="ft-search text-white bg-info float-right background-round"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                             </div>
                        `;
                    }
                    else
                        chitiet.forEach(function (element) {
                            htmlTable = htmlTable
                                +
                                `<li style="display: none;" class="pm_id` + element.pm_id + `">
                                            ` + element.pm_route + ` ` + element.ro_name + `
                                    </li>
                                <div class="col-12" id="pm_id` + element.pm_id + `" style="display: block;">
                                <div class="p-1 mr-1 ml-1 mb-1 bg-white border-radius" style="background: #fbde97 !important;">
                                    <div class="media-body">
                                     <h6 class="text-bold-600">` + element.ro_name + ` - ` + element.pm_route + `<i onclick="PermissionDelete(` + element.pm_id + `)" class=" ml-1 ft-x white bg-danger float-right"></i></h6>
                                    </div>
                                </div>
                            </div>
                           `
                        });
                    $("#contentRoute").html(htmlTable);
                }
            });
            $('#routeModel').modal('show');
        }

        //Đưa dữ liệu vào controll điều hướng thao tác
        function getControl(id, name, note) {
            $("#ctrlRolesChange").on("click", function () {
                $('#id').val('{{\Illuminate\Support\Facades\Auth::user()->id}}')
                $('#r_id').val(id);
                // Lấy danh sách các phân quyền hệ thống mà nó chưa được cấp cho mục này
                var url = '{{route('get/route/list',['id'=> ':slug'])}}';
                url = url.replace(':slug', id);
                $.ajax({
                    type: 'GET',
                    url: url,
                    data: {
                        _token: '{{csrf_token()}}',
                    },
                    success: function (res) {
                        chitiet = res.data;
                        var htmlTable = '';
                        $("#pm_route").innerHTML = '';
                        chitiet.forEach(function (element) {
                            htmlTable = htmlTable + '<option value="' + element.ro_value + '">' + element.ro_name + ' ~ ' + element.ro_value + '</option>';
                        });
                        $("#pm_route").html(htmlTable);
                    }
                });


                $('#controlRoleModel').modal('show');
            });
            $("#ctrlUpdate").on("click", function () {
                RolesGetUpdate(id, name, note);
            });
            var urlHide = '{{route('roles/hide',['id'=>':slug'])}}';
            urlHide = urlHide.replace(':slug', id);
            $("#ctrlLogicDelete").on("click", function () {
                logicDelete(function () {
                    window.location.href = urlHide
                })
            });
            var urlRemove = '{{route('roles/remove',['id'=>':slug'])}}';
            urlRemove = urlRemove.replace(':slug', id);
            $("#ctrlPhysicalDelete").on("click", function () {
                physicalDelete(function () {
                    window.location.href = urlRemove
                }, 'Các tài khoản thuộc phân quyền này sẽ chuyển sang mục chờ cấp lại phân quyền')
            });
            $('#controlModel').modal('show');
        }

        /**
         * Tìm kiếm live
         */
        $(function () {
            $('#searchroute').on('input', function () {
                var input, filter, list, li, a, i;
                input = $('#searchroute').val();
                filter = input.toUpperCase();
                list = $('#contentRoute');
                li = list.find('li');
                console.log(li[1].innerHTML.toUpperCase());
                for (i = 0; i < li.length; i++) {
                    console.log(li[i].innerHTML.toUpperCase());
                    if (li[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        $('#' + li[i].className).css("display", "");
                    } else {
                        $('#' + li[i].className).css("display", "none");
                    }
                }
            });
        });

        function clearInput() {
            $('#searchroute').val('');
            var input, filter, list, li, a, i;
            input = $('#searchroute').val();
            filter = input.toUpperCase();
            list = $('#contentRoute');
            li = list.find('li');
            console.log(li[1].innerHTML.toUpperCase());
            for (i = 0; i < li.length; i++) {
                console.log(li[i].innerHTML.toUpperCase());
                if (li[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
                    $('#' + li[i].className).css("display", "");
                } else {
                    $('#' + li[i].className).css("display", "none");
                }
            }
        }
    </script>
@endsection


