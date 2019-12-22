@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Bảng đăng ký thi đua
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="#">Bảng đăng ký</a>
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

@section('custom_js')
    @include('components.confirmation')
    @include('components.notification')

@endsection


@section('custom_css')
    <style>
        .checkboxes-and-radios{
            background: white;
        }
        .checkboxes-and-radios input[type=checkbox] + label:before, .checkboxes-and-radios input[type=radio] + label:before{
            border-radius: 0;
        }
        .checkboxes-and-radios input[type=checkbox] + label:after, .checkboxes-and-radios input[type=radio] + label:after{
            border-radius: 0;
        }
        .checkboxes-and-radios input[type=checkbox]:checked + label:after, .checkboxes-and-radios input[type=radio]:checked + label:after{
            background: #FF394F;
        }
        .pagination{
            display: inline-flex;
        }
    </style>
@endsection