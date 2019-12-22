@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Giá trị chu kỳ
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="{{route("entity/index")}}">Bộ giá trị chu kỳ</a>
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
    {{--Các modal cho việc điều hướng dữ liệu giá trị chu kỳ--}}
    @if(\App\Http\Controllers\RouteViewController::routeView('entity/create'))
        @include('pages.entity.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('entity/change'))
        @include('pages.entity.update')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('entity/success'))
        @include('pages.entity.success')
    @endif
    {{--Các modal cho việc điều hướng dữ liệu bộ chọn--}}
    @if(\App\Http\Controllers\RouteViewController::routeView('select/create'))
        @include('pages.select.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('select/update'))
        @include('pages.select.update')
    @endif
    {{--Các modal cho việc điều hướng chu kỳ--}}
    @if(\App\Http\Controllers\RouteViewController::routeView('cycle/create'))
        @include('pages.cycle.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('cycle/change'))
        @include('pages.cycle.update')
    @endif
@endsection
@section('custom_js')
    @include('components.confirmation')
    @include('components.control')
    @include('components.notification')
    @include('pages.entity.js')
@endsection
