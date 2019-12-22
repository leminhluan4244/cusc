@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-2">
            <h3 class="content-header-title">Trang chủ
            </h3>
        </div>
        <div class="content-header-right col-md-6 col-12">
            <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                <button class="btn btn-info round dropdown-toggle dropdown-menu-right box-shadow-2 px-2"
                        id="btnGroupDrop1" type="button" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false"><i class="ft-settings icon-left"></i> Thiết lập
                </button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"><a class="dropdown-item"
                                                                              href="{{route('roles/index')}}">Phân
                        quyền</a><a
                            class="dropdown-item" href="component-buttons-extended.html">Demo</a></div>
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
        {{--Tài khoản--}}
        @if(\App\Http\Controllers\RouteViewController::routeView('users/{role}'))
            <div class="row">
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card pull-up">
                        <div class="card-header bg-info">
                            <h2 class="text-center white">Cố vấn</h2>
                        </div>
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h3 class="info"><i class="ft-star"></i></h3>
                                        <div class="media block-element"><a
                                                    class="badge badge-glow badge-pill badge-info"
                                                    href="{{route('users/index',['role' => '0826eaf8086b01749bf7ff65742a200c'])}}"
                                            ><i
                                                        class="ft-refresh-ccw white"></i></a></div>
                                    </div>
                                    <div>
                                        <i class="icon-graduation info font-large-3"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card pull-up">
                        <div class="card-header bg-warning">
                            <h2 class="text-center white">Cán bộ</h2>
                        </div>
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h3 class="warning"><i class="ft-star"></i></h3>
                                        <div class="media block-element"><a
                                                    href="{{route('users/index',['role' => 'default'])}}"
                                                    class="badge badge-glow badge-pill badge-warning "><i
                                                        class="ft-refresh-ccw white"></i></a></div>
                                    </div>
                                    <div>
                                        <i class="icon-users warning font-large-3"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card pull-up">
                        <div class="card-header bg-danger">
                            <h2 class="text-center white">Quản trị viên</h2>
                        </div>
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h3 class="info danger"><i class="ft-star"></i></h3>
                                        <div class="media block-element"><a
                                                    href="{{route('users/index',['role' => '08cd66cb6b012217ed32cb8662a2a1d9'])}}"
                                                    class="badge badge-glow badge-pill badge-danger"><i
                                                        class="ft-refresh-ccw white"></i></a></div>
                                    </div>
                                    <div>
                                        <i class="ft-shield danger font-large-3"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card pull-up">
                        <div class="card-header bg-light">
                            <h2 class="text-center white">Học viên</h2>
                        </div>
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h3 class="light"><i class="ft-star"></i></h3>
                                        <div class="media block-element"><a
                                                    href="{{route('users/index',['role' => '1b83df7a91f51b3d32cf6bda5b0fd23f'])}}"
                                                    class="badge badge-glow badge-pill badge-dark"><i
                                                        class="ft-refresh-ccw white"></i></a></div>
                                    </div>
                                    <div>
                                        <i class="ft-rotate-cw light font-large-3"></i>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {{--Tài khoản--}}
        @endif

        {{--Các cấp--}}
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-head">
                        <div class="card-header bg-gradient-x-primary mb-2">
                            <h4 class="card-title white">Quản lý danh mục các khóa học và ngành lớp liên quan</h4>

                        </div>
                    </div>
                    <!-- project-info -->
                    <div id="project-info" class="card-body row pt-0 pb-0">
                        @if(\App\Http\Controllers\RouteViewController::routeView('majors'))
                            <div class="project-info-count col-lg-4 col-md-12">
                                <div class="project-info-icon border-3 border-success">
                                    <h2 class="success"><i class="ft-star"></i></h2>
                                    <div class="project-info-sub-icon border-1 border-success">
                                        <span class="la la-bookmark success"></span>
                                    </div>
                                </div>
                                <div class="project-info-text pt-1">
                                    <button type="button"
                                            class="btn btn-success btn-min-width badge badge-glow badge-pill badge-success ">
                                        <a href="{{route('majors/index')}}" class="text-bold-600 white mt-0 mb-0">Ngành
                                            học</a>
                                    </button>
                                </div>
                            </div>
                        @endif
                        @if(\App\Http\Controllers\RouteViewController::routeView('class'))
                            <div class="project-info-count col-lg-4 col-md-12">
                                <div class="project-info-icon border-3 border-danger">
                                    <h2 class="danger"><i class="ft-star"></i></h2>
                                    <div class="project-info-sub-icon border-1 border-danger">
                                        <span class="la la-book danger"></span>
                                    </div>
                                </div>
                                <div class="project-info-text pt-1">
                                    <button type="button"
                                            class="btn btn-danger btn-min-width badge badge-glow badge-pill badge-danger ">
                                        <a href="{{route('class/index')}}" class="text-bold-600 white mt-0 mb-0">Lớp
                                            học</a>
                                    </button>
                                </div>
                            </div>
                        @endif
                        @if(\App\Http\Controllers\RouteViewController::routeView('year'))
                            <div class="project-info-count col-lg-4 col-md-12">
                                <div class="project-info-icon border-3 border-info">
                                    <h2 class="info"><i class="ft-star"></i></h2>
                                    <div class="project-info-sub-icon border-1 border-info">
                                        <span class="la la-calendar-check-o info"></span>
                                    </div>
                                </div>
                                <div class="project-info-text pt-1">
                                    <button type="button"
                                            class="btn btn-info btn-min-width badge badge-glow badge-pill badge-info ">
                                        <a href="{{route('year/index')}}" class="text-bold-600 white mt-0 mb-0">Niên
                                            khóa</a>
                                    </button>
                                </div>
                            </div>
                        @endif
                    </div>
                    <!-- project-info -->
                    <div class="card-body">
                        <div class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1">
                            <span>Trước khi tạo một lớp hãy tạo niên khóa và ngành học trước</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {{--Các cấp--}}

        {{--Chu kỳ--}}
        <div class="row">
            @if(\App\Http\Controllers\RouteViewController::routeView('cycle'))
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <a href="{{route('cycle/index')}}" class="danger">>>>></a>
                                        <span class="danger text-bold-600">Chu kỳ</span>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="la la-recycle danger font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endif
            @if(\App\Http\Controllers\RouteViewController::routeView('select'))
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <a href="{{route('select/index')}}" class="warning">>>>></a>
                                        <span class="warning text-bold-600">Bộ chọn</span>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="la la-pie-chart warning font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endif
            @if(\App\Http\Controllers\RouteViewController::routeView('entity'))
                <div class="col-xl-3 col-lg-6 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <a href="{{route('entity/index')}}" class="success">>>>></a>
                                        <span class=" success text-bold-600">Giá trị con</span>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="la la-bolt success font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endif

            <div class="col-xl-3 col-lg-6 col-12">
                <div class="card pull-up">
                    <div class="card-content">
                        <div class="card-body">
                            <div class="media d-flex">
                                <div class="media-body text-left">
                                    <span class="badge badge-glow badge-pill badge-info mb-2">Xem</span><br>
                                    <span class="text-bold-600 info">Hỗ trợ</span>
                                </div>
                                <div class="align-self-center">
                                    <i class="la la-support info font-large-2 float-right"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {{--Chu kỳ--}}

        {{--Cấu trúc--}}
        @if(\App\Http\Controllers\RouteViewController::routeView('category'))
            <div class="row">
                <div class="col-xl-6 col-md-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="media align-items-stretch">
                                <div class="bg-warning p-2 media-middle rounded-left">
                                    <i class="icon-layers font-large-2 text-white"></i>
                                </div>
                                <div class="media-body p-2">
                                    <h4 class="text-bold-600 warning">Cấu trúc mục lớn</h4>
                                    <span>Tùy chỉnh mục lớn bảng điểm tại đây</span>
                                </div>
                                <div class="media-right p-2 media-middle">
                                    <a href="{{route('category/index')}}" class="warning">>>>>>>></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-md-12">
                    <div class="card overflow-hidden pull-up">
                        <div class="card-content">
                            <div class="media align-items-stretch">
                                <div class="bg-info p-2 media-middle">
                                    <i class="icon-flag font-large-2 text-white"></i>
                                </div>
                                <div class="media-body p-2">
                                    <h4 class="text-bold-600 info">Cấu trúc con</h4>
                                    <span>Tùy chỉnh mục lớn bảng điểm tại đây</span>
                                </div>
                                <div class="media-right p-2 media-middle">
                                    <a href="{{route('category/index')}}" class="info">>>>>>>></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        @endif
        {{--cấu trúc--}}
    </div>
@endsection

@section('footer')
    @include('components.footer_default')
@endsection
@section('custom_js')
    @include('components.confirmation')
    @include('components.notification')
@endsection
