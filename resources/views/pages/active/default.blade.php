@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Hoạt động
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="{{route("class/index")}}"> {{$keyName}}</a>
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
    @if(\App\Http\Controllers\RouteViewController::routeView('active/create'))
    @include('pages.active.create')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('active/change'))
    @include('pages.active.update')
    @endif
    @if(\App\Http\Controllers\RouteViewController::routeView('active/{key}/{keyword}'))
    @include('pages.active.search')
    @endif
@endsection
@section('custom_js')
    @include('components.confirmation')
    @include('components.notification')

    <script>
        {{--Gọi api đếm số thành viên tham gia một sự kiện--}}
       function getCountUserJoinActive(id){
            {{--ActiveApiController@count--}}
           var url = '{{route('active/api/count',['id'=> ':slug'])}}';
           url = url.replace(':slug', id);
            $.ajax({
                type: 'GET',
                url: url,
                data: {
                    _token: '{{csrf_token()}}',
                },
                success: function (res) {
                    chitiet = res.data;
                    var countJoinActive = document.getElementById("countJoinActive"+id);
                    // var dataVal = countJoinActive.getAttribute("data-content");
                    var newData = chitiet + " lượt tham gia";
                    countJoinActive.setAttribute("data-content",newData);
                    toastr.info('', "Có "+chitiet + " lượt tham gia");
                }
            });
        }

       /***
        * Thay đổi trạng thái ẩn hiện dựa theo id YES
        * @param id
        */
       function showHide(id) {
           if($('#'+id).css('display')=='none'){
               $('#'+id).show('slow');
           }
           else{
               $('#'+id).hide('slow');
           }
       }

       /**
        * Gọi đến đường dẫn tìm kiếm YES
        */
       function getFind() {
           var keyword = $('#keyword').val();
           var url='{{route('active/index',['key' => 'find', 'keyword'=>':resetKeyword'])}}';
           url = url.replace(':resetKeyword', keyword);
           window.location = url;
       }

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

