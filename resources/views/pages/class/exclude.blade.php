@section('content-body')
    <div class="content-body">
        <form method="post" action="{{route('class/add_student')}}">
            @csrf
            <input type="hidden" name="cl_id" value="{{$data->cl_id}}">
            <section id="html5" class="mb-5">
                <div class="row mb-2">
                    <div class="content-header-left col-12">
                        <div class=" float-md-left">
                            @if(\App\Http\Controllers\RouteViewController::routeView('class/student/{id}/{id_manager}'))
                                <button onclick="window.location.href='{{route('class/student',['id'=>$data->cl_id, 'id_manager' => \Illuminate\Support\Facades\Auth::user()->id])}}'"
                                        class="btn btn-info btn-round  px-2 box-shadow-3 font-weight-bold" id="back"
                                        type="button"><i
                                            class="ft-skip-back icon-left font-weight-bold white"></i><span>Quay lại danh sách học viên</span>
                                </button>
                            @endif
                        </div>
                        <div class=" float-md-right">
                            @if(\App\Http\Controllers\RouteViewController::routeView('class/add_student'))
                                <a onclick="$(this).closest('form').submit();">
                                    <i data-toggle="popover" data-content="Xác nhận thêm các học viên đã chọn vào lớp"
                                       data-trigger="hover" data-placement="top"
                                       class="la la-check btn-info icon-left background-round border-info">

                                    </i>
                                </a>
                            @endif
                            <a href="#">
                                <i data-toggle="popover" data-content="Sau chép học viên từ lớp khác"
                                   data-trigger="hover" data-placement="top"
                                   class="la la-users btn-success icon-left background-round border-success">
                                </i>
                            </a>
                            <a href="">
                                <i data-toggle="popover" data-content="Chọn lại"
                                   data-trigger="hover" data-placement="top"
                                   class="la la-times btn-danger icon-left background-round border-danger">
                                </i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row" id="dataFilter">
                    @if(isset($data->users) && sizeof($data->users)>0)
                        <div class="col-md-12 col-12">
                            <div class="row">
                                <div class="col-md-10 col-12 pr-0">
                                    <div class="form-group">
                                        <input type="text" id="searchStudent" class="form-control round"
                                               placeholder="Tìm kiếm nhanh trên trang này" name="rateperhour">
                                    </div>
                                </div>
                                <div class="col-md-2 col-12">
                                    <i data-toggle="popover" data-content="Đi đến kết quả đầy đủ" data-trigger="hover"
                                       data-placement="top"
                                       class="la la-send-o white bg-dark background-round cursor-pointer">
                                    </i>
                                    </i>
                                    <i data-toggle="popover" data-content="Xác nhận thêm các học viên đã chọn vào lớp"
                                       data-trigger="hover" data-placement="top"
                                       class="la la-filter white bg-dark background-round cursor-pointer">
                                    </i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-12">
                            <div class="nns-pagination">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link"
                                                             href="{{ $data->users->toArray()['first_page_url'] }}"><i
                                                    class="ft-chevrons-left"></i></a></li>
                                </ul>
                                {!! $data->users->links() !!}
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link"
                                                             href="{{ $data->users->toArray()['last_page_url'] }}"><i
                                                    class="ft-chevrons-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        @foreach($data->users as $key => $value)
                            <li style="display: none;" class="{{$value->id}}">
                                {{$value->name}}
                                {{$value->cusc_id}}
                                {{date_format(new DateTime($value->birthday),'d-m-Y')}}
                                {{$value->scores}}
                            </li>
                            <div class="col-md-4 col-sm-6 col-12 " id="{{$value->id}}">
                                <div class="card ">
                                    <div class="card-content">
                                        <div class="card-body p-0">
                                            <div class="media-list list-group">
                                                <div class="list-group-item media p-1  ">
                                                    <a class="media-link">
                                                        <h6 class="text-bold-600 m-0 mb-1">
                                                            <div class="checkboxes-and-radios p-0">
                                                                @if($value->active <> 1)
                                                                    {{$value->name}}
                                                                    <i class="la la-exclamation-triangle danger font-weight-bold float-right"></i>
                                                                @else
                                                                    <input type="checkbox" name="list_id[]"
                                                                           id="check{{$value->id}}"
                                                                           value="{{$value->id}}">
                                                                    <label class="m-0"
                                                                           for="check{{$value->id}}"><span>{{$value->name}}</span></label>
                                                                @endif
                                                            </div>
                                                        </h6>
                                                        <div class="media-left">
                                                            <p class="font-small-3 text-muted m-0 dark">{{$value->cusc_id}}</p>
                                                        </div>
                                                        <div class="media-body text-right">
                                                            <p class="font-small-3 text-muted m-0 info">
                                                            <span class="font-weight-bold">
                                                                <a data-toggle="popover" data-content="Chi tiết"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   onclick="infoStudent('{{$value->id}}')"
                                                                >
                                                                <i class="ft-eye info background-round btn-outline-info "></i>
                                                                </a>
                                                            </span>
                                                            </p>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        <div class="col-md-12 col-12">
                            <div class="nns-pagination">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link"
                                                             href="{{ $data->users->toArray()['first_page_url'] }}"><i
                                                    class="ft-chevrons-left"></i></a></li>
                                </ul>
                                {!! $data->users->links() !!}
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link"
                                                             href="{{ $data->users->toArray()['last_page_url'] }}"><i
                                                    class="ft-chevrons-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    @else
                        <div class="col-12">
                            <div class="card bg-white m-1 border">
                                <div class="card-content ">
                                    <div class="card-body">
                                        <div class="media d-flex">
                                            <div class="media-body text-info text-left">
                                                <h6 class="font-weight-bold">Dữ liệu đang rỗng</h6>
                                                <span>Tất cả học viên đã là thành viên lớp hoặc chưa có học viên trong hệ thống</span>
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
            </section>
        </form>
    </div>
@endsection

@include('pages.class.exclude_default')

