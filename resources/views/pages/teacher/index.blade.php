@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Danh sách các lớp
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="{{route("class/index")}}">Danh sách các lớp</a>
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
                <div class=" float-md-left">
                    <button onclick="javascript:window.history.back()" class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold"  id="back" type="button"><i class="ft-skip-back icon-left font-weight-bold warning"></i><span>Trang trước</span></button>
                    <button onclick="javascript:window.history.go(-1)" class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold"  id="next" type="button"><span>Trang sau </span><i class="ft-skip-forward icon-right font-weight-bold warning"></i></button>
                </div>
                <div class=" float-md-right" >
                    <button onclick="getListMajorAndSchoolYear()" class="btn btn-info round  px-2 box-shadow-3" id="add" type="button" ><i class="ft-plus icon-left"></i><span>Thêm lớp</span></button>
                </div>
            </div>
        </div>
        <div class="row">
            @if(sizeof($data)!=0)
                @foreach($data as $key => $val)
                    <div class="col-md-6 col-12">
                        <div class="card">
                            <div class="card-content collapse show">
                                <div class="card-body pb-0 pt-0">
                                    <div class="card mb-0" style="background:  #F4F5FA;">
                                        <div class="card-content ">
                                            <div class="card mb-0">
                                                <div class="card-header" style="background: #f4f5e9;">
                                                    <h4 class="card-title">{{$val->cl_name}}
                                                    </h4>
                                                    <div class="heading-elements">
                                                        <ul class="list-inline mb-0">
                                                            <li><a data-action="collapse"><i class="ft-chevrons-down"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="card-content collapse">
                                                    <div class="card-body p-0">
                                                        <div>
                                                            <div class="p-1 pb-0">
                                                                <a class="menu-item"
                                                                   data-toggle="popover"
                                                                   data-content="ID: {{$val->id}}"
                                                                   data-trigger="hover"
                                                                   style="white-space: initial;"
                                                                   data-i18n="nav.navbars.nav_light"
                                                                   data-original-title="{{$val->name}}">
                                                                    <i class="ft-play-circle"></i> Cố
                                                                    vấn: <b>{{$val->name}}</b>
                                                                </a>
                                                            </div>
                                                            <div class="p-1 pb-0">
                                                                <a class="menu-item"
                                                                   data-toggle="popover"
                                                                   data-content="ID: {{$val->sy_id}}"
                                                                   data-trigger="hover"
                                                                   style="white-space: initial;"
                                                                   data-i18n="nav.navbars.nav_light"
                                                                   data-original-title="{{$val->sy_name}}">
                                                                    <i class="ft-play-circle"></i> Niên
                                                                    khóa: <b>{{$val->sy_name}}</b>
                                                                </a>
                                                            </div>
                                                            <div class="p-1">
                                                                <a class="menu-item"
                                                                   data-toggle="popover"
                                                                   data-content="ID: {{$val->m_id}}"
                                                                   data-trigger="hover"
                                                                   style="white-space: initial;"
                                                                   data-i18n="nav.navbars.nav_light"
                                                                   data-original-title="{{$val->m_name}}">
                                                                    <i class="ft-play-circle"></i> Chuyên
                                                                    ngành: <b>{{$val->m_name}}</b>
                                                                </a>
                                                            </div>
                                                            <div class="heading-elements text-center"
                                                                 style="background: #f4f5fa; padding: 0.5rem;">
                                                                <ul class="list-inline mb-0 text-center">
                                                                    <li><a class="info" data-toggle="popover" data-content="Xem danh sách học viên" data-trigger="hover" href="{{route('point/class',['id'=>$val->cl_id])}}" data-placement="top"><i class="ft-eye info"></i> Xem danh sách bảng đăng ký</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="col-12 text-center"><span class="text-danger">Danh sách rỗng</span></div>
            @endif
        </div>
    </div>

@endsection

@section('footer')
    @include('components.footer_default')
@endsection
