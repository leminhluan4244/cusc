<div class="main-menu menu-static menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class=" nav-item">
                <a href="#"><i class="la la-home"></i><span class="menu-title" data-i18n="nav.dash.main">Home</span>
                    <span class="badge badge-glow badge-pill badge-warning float-right">
                        <i class="la la-star-o font-medium-1" style="top: 0;margin: auto;"></i>
                        <i class="la la-star-o font-medium-1" style="top: 0;margin: auto;"></i>
                        <i class="la la-star-o font-medium-1" style="top: 0;margin: auto;"></i>
                    </span>
                </a>
            </li>
            @if(\App\Http\Controllers\RouteViewController::routeView('users/{role}'))
            <li class=" nav-item">
                <a href="#"><i class="la la-list info"></i>
                    <span class="menu-title info text-bold-500">Tài khoản</span>
                </a>
                <ul class="menu-content">
                    <li><a class="menu-item"
                           href="{{route('users/index',['role' => '1b83df7a91f51b3d32cf6bda5b0fd23f'])}}"><i
                                    class="la la-graduation-cap"></i>Học viên</a>
                    </li>
                    <li><a class="menu-item"
                           href="{{route('users/index',['role' => '0826eaf8086b01749bf7ff65742a200c'])}}"><i
                                    class="la la-balance-scale"></i>Cố vấn</a>
                    </li>
                    <li><a class="menu-item" href="{{route('users/index',['role' => 'default'])}}"><i
                                    class="la la-users"></i>Cán bộ</a>
                    </li>
                    <li><a class="menu-item"
                           href="{{route('users/index',['role' => '08cd66cb6b012217ed32cb8662a2a1d9'])}}"><i
                                    class="la la-gavel"></i>Quản trị</a>
                    </li>
                    <li><a class="menu-item"
                           href="{{route('users/index',['role' => 'b2cba2a7a5499bd67320ba3d4046dc2e'])}}"><i
                                    class="ft-settings"></i>Chờ cấp</a>
                    </li>
                </ul>
            </li>
            @endif
            @if(\App\Http\Controllers\RouteViewController::routeView('class'))
            <li class=" nav-item">
                <a href="{{route('class/index')}}"><i class="la la-table dark"></i>
                    <span class="menu-title dark text-bold-600">Lớp học</span>
                </a>
            </li>
            @endif
            @if(\App\Http\Controllers\RouteViewController::routeView('active/{key}/{keyword}'))
            <li class=" nav-item">
                <a href="{{route('active/index',['key' => 'happen', 'keyword'=>'active'])}}"><i
                            class="la la-list-alt dark"></i>
                    <span class="menu-title dark text-bold-600">Hoạt động</span>
                </a>
            </li>
            @endif
            @if(
            \App\Http\Controllers\RouteViewController::routeView('cycle') ||
             \App\Http\Controllers\RouteViewController::routeView('select') ||
              \App\Http\Controllers\RouteViewController::routeView('entity'))
                <li class=" nav-item">
                    <a href="#"><i class="la la-history dark"></i>
                        <span class="menu-title dark text-bold-600">Chu kỳ</span>
                    </a>
                    <ul class="menu-content">
                        @if(\App\Http\Controllers\RouteViewController::routeView('cycle'))
                            <li>
                                <a class="menu-item" href="{{route('cycle/index')}}" data-i18n="nav.navbars.nav_light">
                                    <i class="la la-external-link"></i>Loại chu kỳ
                                </a>
                            </li>
                        @endif
                        @if(\App\Http\Controllers\RouteViewController::routeView('select'))
                            <li>
                                <a class="menu-item" href="{{route('select/index')}}" data-i18n="nav.navbars.nav_light">
                                    <i class="la la-filter"></i>Bộ giá trị
                                </a>
                            </li>
                        @endif
                        @if(\App\Http\Controllers\RouteViewController::routeView('entity'))
                            <li>
                                <a class="menu-item" href="{{route('entity/index')}}" data-i18n="nav.navbars.nav_light">
                                    <i class="la la-flash"></i>Giá trị
                                </a>
                            </li>
                        @endif
                    </ul>
                </li>
            @endif
            @if(\App\Http\Controllers\RouteViewController::routeView('year'))
                <li class=" nav-item">
                    <a href="{{route('year/index')}}"><i class="la la-calendar dark"></i>
                        <span class="menu-title dark text-bold-600">Niên khóa</span>
                    </a>
                </li>
            @endif
            @if(\App\Http\Controllers\RouteViewController::routeView('majors'))
                <li class=" nav-item">
                    <a href="{{route('majors/index')}}"><i class="la la-graduation-cap dark"></i>
                        <span class="menu-title dark text-bold-600">Chuyên ngành</span>
                    </a>
                </li>
            @endif
            @if(\App\Http\Controllers\RouteViewController::routeView('roles'))
                <li class=" nav-item">
                    <a href="{{route('roles/index')}}"><i class="la la-lock dark"></i>
                        <span class="menu-title dark text-bold-600">Phân quyền</span>
                    </a>
                </li>
            @endif

            @if(\App\Http\Controllers\RouteViewController::routeView('category'))
                <li class=" nav-item">
                    <a href="{{route('category/index')}}"><i class="la la-university dark"></i>
                        <span class="menu-title dark text-bold-600">Cấu trúc</span>
                    </a>
                </li>
            @endif
            {{--<li class=" navigation-header">--}}
                {{--<span class="danger">Bản xóa tạm</span><i class="la la-star-o ft-minus" data-toggle="tooltip"--}}
                                                          {{--data-placement="right" data-original-title="Thi đua"></i>--}}
            {{--</li>--}}
            {{--<li class=" nav-item">--}}
                {{--<a href="#"><i class="la la-calendar"></i>--}}
                    {{--<span class="menu-title">Niên khóa</span>--}}
                {{--</a>--}}
            {{--</li>--}}
        </ul>
    </div>
</div>