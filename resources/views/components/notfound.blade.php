@extends('components.index')
@section('content-body')
    <div class="content-header row">
    </div>
    <div class="content-body m-0">
        <div class="col-sm-5 offset-sm-1 col-md-6 offset-md-3 col-lg-4 offset-lg-4 box-shadow-2">
            <div class="card border-grey border-lighten-3 px-2 my-0 row">
                <div class="card-header no-border pb-1">
                    <div class="card-body">
                        <h1 class="text-center mb-2 warning font-large-5">404</h1>
                        @foreach($result['message'] as $value)
                            <h3 class="text-bold-600 text-center danger">{{$value}}</h3>
                        @endforeach
                    </div>
                </div>
                <div class="card-content px-2">
                    <div class="row py-2">
                        <div class="col-md-6 col-12">
                            <button onclick="javascript:window.history.back()"  class="btn btn-dark btn-block btn-lg"><i class="ft-skip-back"></i> Trở lại</button>
                        </div>
                        <div class="col-md-6 col-12">
                            <a href="{{route('pages.home')}}" class="btn btn-dark btn-block btn-lg"><i class="la la-home"></i> Trang chủ</a>
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-12">
                            <form action="{{ route('logout') }}" method="POST" >
                                @csrf
                                <button type="submit" class="btn btn-danger btn-block btn-lg"><i class="ft-power"></i> Logout</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('nav')
    @include('components.nav_fix_top')
@endsection

