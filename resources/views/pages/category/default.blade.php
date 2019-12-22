@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Cấu trúc
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="{{route("category/index")}}">Mục lớn</a>
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
@section('custom_css')
    <link rel="stylesheet" type="text/css" href="{{url('theme/app-assets/vendors/css/forms/tags/tagging.css')}}">
    <link rel="stylesheet" type="text/css" href="{{url('theme/app-assets/vendors/css/forms/selects/select2.min.css')}}">
    <style>
        #addChildModel .select2-selection__choice {
            background-color: #1E9FF2 !important
        }

        #updateChildModel .select2-selection__choice {
            background-color: #28D094 !important
        }
    </style>
@endsection
@section('modal')
    @if(\App\Http\Controllers\RouteViewController::routeView('category/create'))
        @include('pages.category.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('category/change'))
        @include('pages.category.update')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('child/create'))
        @include('pages.child.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('child/change'))
        @include('pages.child.update')
    @endif

    {{--@include('pages.child.info')--}}
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
    @include('pages.category.script')
    @include('pages.child.script')
@endsection