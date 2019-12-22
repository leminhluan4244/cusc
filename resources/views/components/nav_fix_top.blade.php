 <nav class="header-navbar navbar-expand-md navbar navbar-with-menu navbar-without-dd-arrow fixed-top navbar-light navbar-border navbar-shadow navbar-brand-center">
    <div class="navbar-wrapper">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mobile-menu d-md-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu font-large-1"></i></a></li>
                <li class="nav-item">
                    <a class="navbar-brand" href="{{route('pages.home')}}">
                        <img class="brand-logo" alt="modern admin logo" src="{{url('imgs/logo.jpg')}}">
                        <h3 class="brand-text">CUSC POINT</h3>
                    </a>
                </li>
                <li class="nav-item d-md-none">
                    <a class="nav-link open-navbar-container" data-toggle="collapse" data-target="#navbar-mobile"><i class="la la-ellipsis-v"></i></a>
                </li>
            </ul>
        </div>
        <div class="navbar-container content">
            <div class="collapse navbar-collapse" id="navbar-mobile">
                <ul class="nav navbar-nav mr-auto float-left">
                    <li class="nav-item d-none d-md-block"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-chevrons-left "></i></a></li>
                    <li class="nav-item d-none d-md-block"><a class="nav-link nav-link-expand" href="#"><i class="ficon ft-maximize"></i></a></li>
                    {{--<li class="dropdown nav-item mega-dropdown"><a class="dropdown-toggle nav-link" href="#" data-toggle="dropdown"><i class="ft-align-justify"></i></a>--}}
                        {{--Mega--}}
                        {{--@include('components.mega_staff')--}}
                    {{--</li>--}}
                </ul>
                <ul class="nav navbar-nav float-right">
                    <li class="dropdown dropdown-user nav-item">
                        <a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                            <span class="mr-1">
                              <span class="user-name text-bold-700">{{\Illuminate\Support\Facades\Auth::user()->cusc_id}}</span>
                            </span>
                            <span class="avatar avatar-online">
                                <img src="data:image/jpeg;base64,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" alt="avatar"><i></i>
                            </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#" onclick="infoStudent('{{\Illuminate\Support\Facades\Auth::user()->id}}')"><i class="ft-user"></i> Cá nhân</a>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#ResetPass"><i class="ft-user"></i> Đổi mật khẩu</a>
                            {{--temp--}}
                            <form action="{{ route('logout') }}" method="POST" >
                                @csrf
                                <button type="submit" class="dropdown-item" ><i class="ft-power"></i> Logout</button>
                            </form>
                        </div>
                    </li>
                    {{--<li class="dropdown dropdown-notification nav-item">--}}
                        {{--<a class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i class="ficon ft-bell"></i>--}}
                            {{--<span class="badge badge-pill badge-default badge-danger badge-default badge-up badge-glow">5</span>--}}
                        {{--</a>--}}
                        {{--<ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">--}}
                            {{--<li class="dropdown-menu-header">--}}
                                {{--<h6 class="dropdown-header m-0">--}}
                                    {{--<span class="grey darken-2">Notifications</span>--}}
                                {{--</h6>--}}
                                {{--<span class="notification-tag badge badge-default badge-danger float-right m-0">5 New</span>--}}
                            {{--</li>--}}
                            {{--<li class="scrollable-container media-list w-100">--}}
                                {{--<a href="javascript:void(0)">--}}
                                    {{--<div class="media">--}}
                                        {{--<div class="media-left align-self-center"><i class="ft-plus-square icon-bg-circle bg-cyan"></i></div>--}}
                                        {{--<div class="media-body">--}}
                                            {{--<h6 class="media-heading">You have new order!</h6>--}}
                                            {{--<p class="notification-text font-small-3 text-muted">Lorem ipsum dolor sit amet, consectetuer elit.</p>--}}
                                            {{--<small>--}}
                                                {{--<time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">30 minutes ago</time>--}}
                                            {{--</small>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</a>--}}
                                {{--<a href="javascript:void(0)">--}}
                                    {{--<div class="media">--}}
                                        {{--<div class="media-left align-self-center"><i class="ft-download-cloud icon-bg-circle bg-red bg-darken-1"></i></div>--}}
                                        {{--<div class="media-body">--}}
                                            {{--<h6 class="media-heading red darken-1">99% Server load</h6>--}}
                                            {{--<p class="notification-text font-small-3 text-muted">Aliquam tincidunt mauris eu risus.</p>--}}
                                            {{--<small>--}}
                                                {{--<time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Five hour ago</time>--}}
                                            {{--</small>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</a>--}}
                                {{--<a href="javascript:void(0)">--}}
                                    {{--<div class="media">--}}
                                        {{--<div class="media-left align-self-center"><i class="ft-alert-triangle icon-bg-circle bg-yellow bg-darken-3"></i></div>--}}
                                        {{--<div class="media-body">--}}
                                            {{--<h6 class="media-heading yellow darken-3">Warning notifixation</h6>--}}
                                            {{--<p class="notification-text font-small-3 text-muted">Vestibulum auctor dapibus neque.</p>--}}
                                            {{--<small>--}}
                                                {{--<time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Today</time>--}}
                                            {{--</small>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</a>--}}
                                {{--<a href="javascript:void(0)">--}}
                                    {{--<div class="media">--}}
                                        {{--<div class="media-left align-self-center"><i class="ft-check-circle icon-bg-circle bg-cyan"></i></div>--}}
                                        {{--<div class="media-body">--}}
                                            {{--<h6 class="media-heading">Complete the task</h6>--}}
                                            {{--<small>--}}
                                                {{--<time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Last week</time>--}}
                                            {{--</small>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</a>--}}
                                {{--<a href="javascript:void(0)">--}}
                                    {{--<div class="media">--}}
                                        {{--<div class="media-left align-self-center"><i class="ft-file icon-bg-circle bg-teal"></i></div>--}}
                                        {{--<div class="media-body">--}}
                                            {{--<h6 class="media-heading">Generate monthly report</h6>--}}
                                            {{--<small>--}}
                                                {{--<time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Last month</time>--}}
                                            {{--</small>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                            {{--<li class="dropdown-menu-footer"><a class="dropdown-item text-muted text-center" href="javascript:void(0)">Read all notifications</a></li>--}}
                        {{--</ul>--}}
                    {{--</li>--}}
                    {{--<li class="dropdown dropdown-notification nav-item">--}}
                        {{--<a class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i class="ficon ft-mail">             </i></a>--}}
                        {{--<ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">--}}
                            {{--<li class="dropdown-menu-header">--}}
                                {{--<h6 class="dropdown-header m-0">--}}
                                    {{--<span class="grey darken-2">Messages</span>--}}
                                {{--</h6>--}}
                                {{--<span class="notification-tag badge badge-default badge-warning float-right m-0">4 New</span>--}}
                            {{--</li>--}}
                            {{--<li class="scrollable-container media-list w-100">--}}
                                {{--<a href="javascript:void(0)">--}}
                                    {{--<div class="media">--}}
                                        {{--<div class="media-left">--}}
                        {{--<span class="avatar avatar-sm avatar-online rounded-circle">--}}
                          {{--<img src="" alt="avatar"><i></i></span>--}}
                                        {{--</div>--}}
                                        {{--<div class="media-body">--}}
                                            {{--<h6 class="media-heading">Margaret Govan</h6>--}}
                                            {{--<p class="notification-text font-small-3 text-muted">I like your portfolio, let's start.</p>--}}
                                            {{--<small>--}}
                                                {{--<time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Today</time>--}}
                                            {{--</small>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</a>--}}
                                {{--<a href="javascript:void(0)">--}}
                                    {{--<div class="media">--}}
                                        {{--<div class="media-left">--}}
                        {{--<span class="avatar avatar-sm avatar-busy rounded-circle">--}}
                          {{--<img src="" alt="avatar"><i></i></span>--}}
                                        {{--</div>--}}
                                        {{--<div class="media-body">--}}
                                            {{--<h6 class="media-heading">Bret Lezama</h6>--}}
                                            {{--<p class="notification-text font-small-3 text-muted">I have seen your work, there is</p>--}}
                                            {{--<small>--}}
                                                {{--<time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Tuesday</time>--}}
                                            {{--</small>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</a>--}}
                                {{--<a href="javascript:void(0)">--}}
                                    {{--<div class="media">--}}
                                        {{--<div class="media-left">--}}
                        {{--<span class="avatar avatar-sm avatar-online rounded-circle">--}}
                          {{--<img src="" alt="avatar"><i></i></span>--}}
                                        {{--</div>--}}
                                        {{--<div class="media-body">--}}
                                            {{--<h6 class="media-heading">Carie Berra</h6>--}}
                                            {{--<p class="notification-text font-small-3 text-muted">Can we have call in this week ?</p>--}}
                                            {{--<small>--}}
                                                {{--<time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">Friday</time>--}}
                                            {{--</small>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</a>--}}
                                {{--<a href="javascript:void(0)">--}}
                                    {{--<div class="media">--}}
                                        {{--<div class="media-left">--}}
                        {{--<span class="avatar avatar-sm avatar-away rounded-circle">--}}
                          {{--<img src="" alt="avatar"><i></i></span>--}}
                                        {{--</div>--}}
                                        {{--<div class="media-body">--}}
                                            {{--<h6 class="media-heading">Eric Alsobrook</h6>--}}
                                            {{--<p class="notification-text font-small-3 text-muted">We have project party this saturday.</p>--}}
                                            {{--<small>--}}
                                                {{--<time class="media-meta text-muted" datetime="2015-06-11T18:29:20+08:00">last month</time>--}}
                                            {{--</small>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</a>--}}
                            {{--</li>--}}
                            {{--<li class="dropdown-menu-footer"><a class="dropdown-item text-muted text-center" href="javascript:void(0)">Read all messages</a></li>--}}
                        {{--</ul>--}}
                    {{--</li>--}}
                </ul>
            </div>
        </div>
    </div>
</nav>