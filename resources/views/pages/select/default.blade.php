@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Bộ chọn chu kỳ
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="{{route("majors/index")}}">Bộ chọn chu kỳ</a>
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
    @if(\App\Http\Controllers\RouteViewController::routeView('select/create'))
        @include('pages.select.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('select/change'))
        @include('pages.select.update')
    @endif
@endsection
@section('custom_js')
    @include('components.confirmation')
    @include('components.control')
    @include('components.notification')
    @include('pages.select.js')
    <script src="{{url('theme/app-assets/vendors/js/forms/select/select2.full.min.js')}}"
            type="text/javascript"></script>
    <script src="{{url('theme/app-assets/js/scripts/forms/select/form-select2.js')}}" type="text/javascript"></script>

@endsection
@section('custom_css')
    <link rel="stylesheet" type="text/css" href="{{url('theme/app-assets/vendors/css/forms/tags/tagging.css')}}">
    <link rel="stylesheet" type="text/css" href="{{url('theme/app-assets/vendors/css/forms/selects/select2.min.css')}}">
@endsection


