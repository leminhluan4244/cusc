@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Niên khóa
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="{{route("year/index")}}">Niên khóa</a>
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
    @if(\App\Http\Controllers\RouteViewController::routeView('year/create'))
        @include('pages.schoolyear.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('year/create'))
        @include('pages.schoolyear.update')
    @endif
@endsection

@section('footer')
    @include('components.footer_default')
@endsection

@section('custom_js')
    @include('components.confirmation')
    @include('components.control')
    @include('components.notification')
    <script>
        //Đưa dữ liệu vào bảng chỉnh sửa
        function getbyId(id, name, begin) {
            document.getElementById("sy_id").value = id;
            document.getElementById("sy_name_update").value = name;
            document.getElementById("sy_begin_update").value = begin;
            $('#updateModel').modal('show');
        }

        //Đưa dữ liệu vào controll điều hướng thao tác
        function getControl(sy_id, sy_name, sy_begin) {
            $("#ctrlUpdate").on("click", function () {
                getbyId(sy_id, sy_name, sy_begin);
            });
            var urlHide = '{{route('year/hide',['id'=>':slug'])}}';
            urlHide = urlHide.replace(':slug', sy_id);
            $("#ctrlLogicDelete").on("click", function () {
                logicDelete(function () {
                    window.location.href = urlHide
                })
            });
            var urlRemove = '{{route('year/remove',['id'=>':slug'])}}';
            urlRemove = urlRemove.replace(':slug', sy_id);
            $("#ctrlPhysicalDelete").on("click", function () {
                physicalDelete(function () {
                    window.location.href = urlRemove
                }, 'Các lớp thuộc niên khóa này sẽ tự xóa theo')
            });
            $('#controlModel').modal('show');
        }
    </script>
@endsection


