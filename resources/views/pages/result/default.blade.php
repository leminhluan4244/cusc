@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Thành tích thi đua học viên
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="#">Bảng điểm</a>
                    </li>
                    <li class="breadcrumb-item active">{{$data['user']->name}}
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

@section('custom_css')
    @include('pages.result.css')
@endsection

@section('custom_js')
    @include('pages.result.js')
    @include('components.confirmation')
    @include('components.notification')
@endsection

@section('modal')
    {{--Menu fix bottom điều hướng--}}
    @include('pages.result.fix')
    {{--Thông tin tin info của mục con--}}
    @include('pages.result.infoChild')
    {{--Form cộng điểm--}}
    @include('pages.result.framePlus')
    {{--Form cập nhật điểm--}}
    @include('pages.result.frameUpdate')
@endsection