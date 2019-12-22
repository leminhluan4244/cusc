@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Chuyên ngành
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="{{route("majors/index")}}">Các ngành</a>
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

@section('footer')
    @include('components.footer_default')
@endsection
@section('modal')
    @if(\App\Http\Controllers\RouteViewController::routeView('majors/create'))
        @include('pages.majors.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('majors/change'))
        @include('pages.majors.update')
    @endif
@endsection
@section('custom_js')
    @include('components.confirmation')
    @include('components.control')
    @include('components.notification')
    <script>
        //Đưa dữ liệu vào bảng chỉnh sửa
        function getMajorbyId(id, code, name) {
            document.getElementById("m_id_update").value = id;
            document.getElementById("m_code_update").value = code;
            document.getElementById("m_name_update").value = name;
            $('#updateMajorModel').modal('show');
        }

        //Đưa dữ liệu vào controll điều hướng thao tác
        function getControl(m_id, m_code, m_name) {
            $("#ctrlUpdate").on("click", function () {
                getMajorbyId(m_id, m_code, m_name);
            });
            var urlHide = '{{route('majors/hide',['id'=>':slug'])}}';
            urlHide = urlHide.replace(':slug', m_id);
            $("#ctrlLogicDelete").on("click", function () {
                logicDelete(function () {
                    window.location.href = urlHide
                })
            });
            var urlRemove = '{{route('majors/remove',['id'=>':slug'])}}';
            urlRemove = urlRemove.replace(':slug', m_id);
            $("#ctrlPhysicalDelete").on("click", function () {
                physicalDelete(function () {
                    window.location.href = urlRemove
                }, 'Các lớp thuộc chuyên ngành này sẽ tự hủy theo')
            });
            $('#controlModel').modal('show');
        }
    </script>
@endsection