@extends('components.index')
@section('breadcrumbs')
    <div class="content-header row">
        <div class="content-header-left col-md-6 col-12 mb-1">
            <h3 class="content-header-title">Chọn sinh viên cho hoạt động
            </h3>
        </div>
        <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-12">
            <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('pages.home')}}">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a href="">Điều hướng cộng điểm</a>
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
    <div class="content-body" style="height: fit-content;">
        <div class="row mb-2">
            <div class="content-header-left col-12">
                <div class=" float-md-left">
                    <button class="btn btn-primary round  px-2 box-shadow-3">
                        <a class="white"
                           href="{{route('achievement/index', ['id' => $data['active']['a_id']])}}"
                        >
                            <i class="ft-info icon-left"></i>
                            <span>Trở lại chi tiết</span>
                        </a>
                    </button>

                    <a href="{{route('active/index',['key' => 'happen', 'keyword'=>'active'])}}"
                       class="btn btn-warning round  px-2 box-shadow-3" id="back">
                        <i class="la la-list-alt icon-left">
                        </i>
                        <span>Trở lại danh sách hoạt động </span>
                    </a>
                    <a href="{{route('achievement/users',['id' => $data['active']['a_id']])}}"
                       class="btn btn-success round  px-2 box-shadow-3" id="back">
                        <i class="la la-calendar-check-o icon-left"></i>
                        <span>Xem tất cả </span>
                    </a>
                </div>
            </div>
        </div>
        <section id="html5" class="mb-5">
            <h4 class="pt-2 info font-weight-bold mb-2"><i class="ft-list"></i> Danh sách vai trò </h4>
            <div class="row" id="change_achievement">
                @if(isset($data['achievement']) && sizeof($data['achievement'])!=0)
                    @foreach($data['achievement'] as $key => $val)
                        <div class="col-md-6 col-12 pb-1 " id="key{{$val->aa_id}}">
                            @if(\App\Http\Controllers\RouteViewController::routeView('achievement/api/list_member/{id}'))
                                <button
                                        onclick="getListUserForAchievement('{{$val->aa_id}}','{{$val->aa_name}}')"
                                        id="{{$val->aa_id}}"
                                        class="btn bg-gradient-directional-info block  px-2 box-shadow-3 text-left white"
                                >
                                    <span class="float-md-left"><i
                                                class="ft-chevrons-right icon-left"></i> {{$val->aa_name}}</span>
                                    <span class="float-md-right badge badge-glow badge-pill badge-dark float-right">Điểm: {{$val->aa_scores}}</span>
                                </button>
                            @endif
                        </div>
                    @endforeach
                @else
                    <div class="col-12">
                        <div class="card bg-white m-1 border">
                            <div class="card-content ">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="media-body text-info text-left">
                                            <h6 class="font-weight-bold">Danh sách vai trò đang rỗng</h6>
                                            <span>Chọn thêm giá trị để tạo mới dữ liệu</span>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="ft-search text-white bg-info float-right background-round"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
            {{--Danh sách từng con--}}
            @include('pages.achievement.users_list')

        </section>
    </div>
@endsection
@section('footer')
    @include('components.footer_default')
@endsection
@section('custom_js')
    @include('pages.achievement.users_js')
@endsection



