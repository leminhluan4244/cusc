{{--Đã check--}}
@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Tài khoản
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="">Học viên</a>
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
    @if(\App\Http\Controllers\RouteViewController::routeView('users/create'))
        @include('pages.users.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('users/change'))
        @include('pages.users.update')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('users/import'))
        @include('pages.users.import')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('users/api/search/{id}'))
        @include('pages.users.profile')
    @endif
@endsection
@section('custom_css')
    <link rel="stylesheet" type="text/css" href="{{url('theme/app-assets/css/pages/users.css')}}">
    <style>
        #DataTables_Table_0_info, #DataTables_Table_0_paginate, #DataTables_Table_0 {
            display: none;
        }

        .buttons-copy, .buttons-excel, .buttons-csv, .buttons-pdf {
            background: white;
            color: #464855;
        }

        .checkboxes-and-radios {
            background: white;
            padding: 5px;
        }

        .checkboxes-and-radios input[type=checkbox] + label:before, .checkboxes-and-radios input[type=radio] + label:before {
            border-radius: 0;
        }

        .checkboxes-and-radios input[type=checkbox] + label:after, .checkboxes-and-radios input[type=radio] + label:after {
            border-radius: 0;
        }

        .checkboxes-and-radios input[type=checkbox]:checked + label:after, .checkboxes-and-radios input[type=radio]:checked + label:after {
            background: #FF394F;
        }
    </style>
@endsection
@section('custom_js')
    @include('components.confirmation')
    @include('components.notification')

    {{--Tim kiếm nội bộ trang YES--}}
    <script>
        $(function () {
            $('input.form-control-sm').on('input', function () {
                var input, filter, list, li, a, i;
                input = $('input.form-control-sm').val();
                filter = input.toUpperCase();
                list = $('#dataFilter');
                li = list.find('li');
                for (i = 0; i < li.length; i++) {
                    if (li[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        $('#' + li[i].className).css("display", "");
                    } else {
                        $('#' + li[i].className).css("display", "none");
                    }
                }
            });
        });
    </script>

    {{--Kiểm tra trạng thái khi mới loading--}}
    <script>

        $(document).ready(function () {
            if (sessionStorage.getItem('statusInfoStudent') == 'false') {
                console.log(sessionStorage.getItem('statusInfoStudent'))
                $("#hideShow").text("Hiển thị đầy đủ");
                $(".hideZ").css('display', 'none');
            }
            else {
                $("#hideShow").text("Rút gọn nội dung");
                $(".hideZ").css('display', '');
            }
        });
    </script>

    {{--Ẩn hiện thông tin trong một trang chi tiết--}}
    <script>
        function showHide() {
            if ($("#hideShow").text() == "Rút gọn nội dung") {
                $("#hideShow").text("Hiển thị đầy đủ");
                $(".hideZ").css('display', 'none');
                sessionStorage.setItem("statusInfoStudent", false);
            }
            else {
                $("#hideShow").text("Rút gọn nội dung");
                $(".hideZ").css('display', '');
                {{--Lưu trữ trạng thái vào session--}}
                sessionStorage.setItem("statusInfoStudent", true);
            }
            
        }

    </script>
@endsection
    