<body class="vertical-layout vertical-content-menu 2-columns   menu-expanded fixed-navbar"
      data-open="click" data-menu="vertical-content-menu" data-col="2-columns">
@yield('nav')
<!-- ////////////////////////////////////////////////////////////////////////////-->
<div class="app-content content">
    <div class="content-wrapper">
        @yield('breadcrumbs')
        {{--@if(\App\Http\Middleware\PermissionAuth::classifyRoles(session('id_user'))=='admin')--}}
            @yield('menu')
        {{--@else--}}
            {{--<style>--}}
                {{--.content-body{--}}
                    {{--margin-left: 0 !important;--}}
                {{--}--}}
            {{--</style>--}}
        {{--@endif--}}

        @yield('content-body')
        @yield('modal')
    </div>
</div>
<!-- ////////////////////////////////////////////////////////////////////////////-->
@yield('footer')

@include('components.js')
@yield('custom_js')

</body>