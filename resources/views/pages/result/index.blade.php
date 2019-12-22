@section('content-body')
    <div class="content-body " style="height: auto !important;">
        <form action="{{route('point/change')}}" method="post">
            <input type="hidden" value="{{$data['user']->id}}" name="u_id">
            @csrf
            <div class="row mb-2">
                <div class="content-header-left col-12">
                    <div class=" float-md-left">
                        <button onclick="javascript:window.history.back()" class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold"  id="back" type="button"><i class="ft-skip-back icon-left font-weight-bold warning"></i><span>Trang trước</span></button>
                        <button onclick="javascript:window.history.go(-1)" class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold"  id="next" type="button"><span>Trang sau </span><i class="ft-skip-forward icon-right font-weight-bold warning"></i></button>
                    </div>
                </div>
            </div>
            <div class="row">
                {{--Row chứa thông tin sinh viên--}}
                @include('pages.result.info')

                {{--Row chứa thông tin các mục lớn--}}
                @include('pages.result.category')

                {{--Row chứa thông tin mục con--}}
                @include('pages.result.child')

                {{--Row chứa chi tiết điểm mục con--}}
                @include('pages.result.pointChild')

            </div>
        </form>
    </div>
@endsection
@include('pages.result.default')
