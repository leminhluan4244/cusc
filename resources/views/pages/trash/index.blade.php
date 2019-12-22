@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Phân quyền
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="{{route("roles/index")}}">Phân quyền</a>
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
@section('content-body')
    <div class="content-body">


        <div class="row mb-2">
            <div class="content-header-left col-12">
                <div class=" float-md-right" >
                    <button class="btn btn-info round  px-2 box-shadow-3" data-toggle="modal" data-target="#addModel" id="add" type="button" ><i class="ft-plus icon-left"></i><span>Thêm một niên khóa</span></button>
                </div>
            </div>
        </div>
        <div class="row">
            @foreach($data as $key => $value)
            <div class="col-xl-3 col-md-3 col-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body cleartfix">
                            <div class="media align-items-stretch">
                                <div class="media-body">
                                    <h4 class="text-bold-700">{{$value->sy_name}}</h4>
                                    <span>{{date("d-m-Y", strtotime($value->sy_begin))}}</span>
                                </div>
                                <div class="align-self-center">
                                    <div class="btn-group">
                                        <i class="ft-settings font-large-1 text-warning" data-toggle="dropdown"
                                           aria-haspopup="true" aria-expanded="false"></i>
                                        <div class="dropdown-menu arrow">
                                            <a href="{{route('year/undo',['id'=>$value->sy_id])}}"><button class="dropdown-item" type="button">Khôi phục</button></a>
                                            <a href="{{route('year/remove',['id'=>$value->sy_id])}}"><button class="dropdown-item" type="button">Xóa vĩnh diễn</button></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
@endsection

@section('footer')
    @include('components.footer_default')
@endsection

@include('pages.schoolyear.create')
@include('pages.schoolyear.update')

