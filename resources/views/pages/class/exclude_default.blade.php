@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Thêm học viên cho lớp
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="{{route('class/student',['id'=>$data->cl_id, 'id_manager' => \Illuminate\Support\Facades\Auth::user()->id])}}">{{$data->cl_name}}</a>
                    </li>
                    <li class="breadcrumb-item active">Chọn học viên
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
    @include('pages.users.profile')
@endsection
@section('custom_js')
    @include('components.confirmation')
    @include('components.control')
    @include('components.notification')
    <script>
        function AddStudentAllCheck(checkall) {
            checkboxes = document.getElementsByName('list_id[]');
            for (var i = 0, n = checkboxes.length; i < n; i++) {
                checkboxes[i].checked = checkall.checked;
            }
        }

        $(function () {
            $('#searchStudent').on('input', function () {
                var input, filter, list, li, a, i;
                input = $('#searchStudent').val();
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
@endsection

@section('custom_css')
    <link rel="stylesheet" type="text/css" href="{{url('theme/app-assets/css/pages/users.css')}}">
    <style>

        .checkboxes-and-radios{
            background: white;
            padding: 5px;
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
    </style>
@endsection