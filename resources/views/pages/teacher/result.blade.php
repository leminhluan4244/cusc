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
                    <li class="breadcrumb-item"><a href="{{route("point/index")}}">Bảng điểm</a>
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
@section('content-body')
    <div class="content-body">
        <form action="{{route('point/change')}}" method="post">
            <input type="hidden" value="{{$data['user']->id}}" name="u_id">
            @csrf
            <div class="row mb-2">
                <div class="content-header-left col-12">
                    <div class=" float-md-left">
                        <button onclick="javascript:window.history.back()" class="btn btn-dark round  px-2 box-shadow-3"
                                id="back" type="button"><i class="ft-arrow-left icon-left"></i><span>Trang trước</span>
                        </button>
                        <button onclick="javascript:window.history.go(-1)" class="btn btn-dark round  px-2 box-shadow-3"
                                id="back" type="button"><span>Trang sau </span><i class="ft-arrow-right icon-right"></i>
                        </button>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header bg-dark">
                            <h4 class="card-title white">{{$data['user']->name}} -
                                <span class="menu-title">Điểm hiện tại: </span>
                                <span class="badge badge badge-danger badge-pill mr-2">{{$data['user']->scores}}</span>
                            </h4>
                            <div class="heading-elements">
                                <ul class="list-inline mb-0">
                                    <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                    <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-content collapse">
                            <div class="card-body">
                                <p class="card-text">CUSC ID: {{$data['user']->cusc_id}}</p>
                                <p class="card-text">Email: {{$data['user']->email}}</p>
                                <p class="card-text">Birthday: {{$data['user']->birthday}}</p>
                                @if($data['user']->gender==1)
                                    <p class="card-text">Giới tính: Nam</p>
                                @else
                                    <p class="card-text">Giới tính: Nữ</p>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                @if(sizeof($data['category'])>0)
                    @foreach($data['category'] as $c_key => $c_val)
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header white" style="background: #1ec481;">
                                    <h4 class="card-title white">{{$c_val->c_item}}. {{$c_val->c_name}}
                                    </h4>
                                    <div class="heading-elements ">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="row pt-1 ">
                                        <div class="col-md-3 col-12">
                                            <a><i class="ft-pocket"></i>
                                                <span class="menu-title">Điểm tối đa: </span>
                                                @if($c_val->c_max_scores==10000000)
                                                    <span class="badge badge badge-info badge-pill mr-2">Maximum</span>
                                                @else
                                                    <span class="badge badge badge-info badge-pill mr-2">{{$c_val->c_max_scores}}</span>
                                                @endif
                                            </a>
                                        </div>
                                        <div class="col-md-3 col-12">
                                            <a><i class="ft-pocket"></i>
                                                <span class="menu-title">Hiện tại: </span>
                                                <span class="badge badge badge-danger badge-pill mr-2">{{$c_val['scores']}}</span>
                                            </a>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <a><i class="ft-pocket"></i>
                                                <span class="menu-title">Cách cộng mục con: </span>
                                                @if($c_val->c_type==1)
                                                    <span class="badge badge badge-info badge-pill mr-2">Cộng dồn các mục</span>
                                                @else
                                                    <span class="badge badge badge-info badge-pill mr-2">Điểm mục lớn nhất</span>
                                                @endif
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-content collapse">
                                    <div class="card-body">
                                        {{--//Chèn con ở đây--}}
                                        @include('pages.employee.child_result')
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header" style="background: #f4f5e9;">
                                <h4 class="card-title">Danh sách này rỗng</h4>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </form>
    </div>
@endsection

@section('footer')
    @include('components.footer_default')
@endsection

