@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Chi tiết hoạt động
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="#">Chi tiết hoạt động</a>
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
    @if(\App\Http\Controllers\RouteViewController::routeView('achievement/create'))
        @include('pages.achievement.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('achievement/change'))
        @include('pages.achievement.update')
    @endif

    @include('pages.users.profile')
@endsection

@section('custom_js')
    @include('components.confirmation')
    @include('components.notification')
    @include('pages.achievement.js')
    <script>
        $('.content-body').css({'height': 'fit-content'});
    </script>
@endsection
@section('custom_css')
    <link rel="stylesheet" type="text/css" href="{{url('theme/assets/css/menu-cycle.css')}}">
    <style>
        .btn-back-to-top {
            display: none;
            position: fixed;
            bottom: 150px;
            right: 150px;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            border-radius: 4px;
        }
    </style>
@endsection

