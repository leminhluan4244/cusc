@section('content-body')
    <div class="content-body">
        <section id="html5" class="mb-5">
            <div class="row mb-2">
                <div class="content-header-left col-12">
                    <div class=" float-md-left">
                        <button onclick="window.location.href='{{route('class/index')}}'"
                                class="btn btn-info btn-round  px-2 box-shadow-3 font-weight-bold" id="back"
                                type="button"><i class="ft-skip-back icon-left font-weight-bold white"></i><span>Quay lại danh sách lớp</span>
                        </button>
                    </div>
                    <div class=" float-md-right">
                        @if(\App\Http\Controllers\RouteViewController::routeView('class/exclude/{id}/{id_manager}'))
                            <a href="{{route('class/exclude',['id' => $data->cl_id, 'id_manager' => \Illuminate\Support\Facades\Auth::user()->id])}}">
                                <i data-toggle="popover" data-content="Thêm học viên"
                                   data-trigger="hover" data-placement="top"
                                   class="la la-user-plus btn-info icon-left background-round border-info">

                                </i>
                            </a>
                        @endif
                        @if(\App\Http\Controllers\RouteViewController::routeView('class/remove_all/{id}'))
                            <a
                                    onclick="physicalDelete(function() {window.location.href = '{{route('class/remove_all',['id' => $data->cl_id])}}'},'Tất cả học sinh sẽ bị xóa khỏi lớp này')"
                            >
                                <i data-toggle="popover" data-content="Xóa tất cả học viên "
                                   data-trigger="hover" data-placement="top"
                                   class="la la-times btn-danger icon-left background-round border-danger">
                                </i>
                            </a>
                        @endif
                    </div>
                </div>
            </div>
            <div class="row" id="dataFilter">
                @if(isset($data->users) && sizeof($data->users)>0)
                    @include('pages.class.table_student')
                    @foreach($data->users as $key => $value)
                        <li style="display: none;" class="{{$value->id}}">
                            {{$value->name}}
                            {{$value->cusc_id}}
                            {{date_format(new DateTime($value->birthday),'d-m-Y')}}
                            {{$value->scores}}
                        </li>
                        <div class="col-md-4 col-sm-6 col-12 " id="{{$value->id}}">
                            <div class="card">
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
                                                                <input type="checkbox" name="check[]"
                                                                       id="check{{$value->id}}" value="{{$value->id}}">
                                                                <label class="m-0"
                                                                       for="check{{$value->id}}"><span>{{$value->name}}</span></label>
                                                            @endif
                                                        </div>
                                                    </h6>
                                                    <div class="media-left">
                                                        <p class="font-small-3 text-muted m-0 dark">{{$value->cusc_id}}</p>
                                                        <p class="font-small-3 text-muted m-0 dark">
                                                            @if($value->gender==1)
                                                                Nam
                                                            @elseif($value->gender==0)
                                                                Nữ
                                                            @else
                                                                Khác
                                                            @endif
                                                        </p>
                                                    </div>
                                                    <div class="media-body text-right">
                                                        <p class="font-small-3 text-muted m-0 danger"><span
                                                                    class="font-weight-bold">Tích lũy: {{$value->scores}}</span>
                                                        </p>
                                                        <p class="font-small-3 text-muted m-0 dark">{{date_format(new DateTime($value->birthday),'d-m-Y')}}</p>
                                                    </div>
                                                </a>
                                                <div class="heading-elements text-center pt-1"><a class="media-link">
                                                    </a>
                                                    <div class="row">
                                                        @if(\App\Http\Controllers\RouteViewController::routeView('users/api/search/{id}'))
                                                            <div class="col-3">
                                                                <a data-toggle="popover" data-content="Chi tiết"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   onclick="infoStudent({{$value->id}})"
                                                                >
                                                                    <i class="ft-eye info background-round btn-outline-info "></i>
                                                                </a>
                                                            </div>
                                                        @endif
                                                        @if(\App\Http\Controllers\RouteViewController::routeView('point/registration/{id}'))
                                                            <div class="col-3">
                                                                <a data-toggle="popover" data-content="Bảng đăng ký"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   href="{{route('point/registration',['id'=>$value->id])}}"
                                                                >
                                                                    <i class="ft-paperclip success background-round btn-outline-success "></i>
                                                                </a>
                                                            </div>
                                                        @endif
                                                        @if(\App\Http\Controllers\RouteViewController::routeView('point/result/{id}'))
                                                            <div class="col-3">
                                                                <a data-toggle="popover"
                                                                   data-content="Thành tích thi đua"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   href="{{route('point/result',['id'=>$value->id])}}"
                                                                >
                                                                    <i class="ft-star warning background-round btn-outline-warning "></i>
                                                                </a>
                                                            </div>
                                                        @endif
                                                        @if(\App\Http\Controllers\RouteViewController::routeView('class/remove_one/{id_user}/{id_class}'))
                                                            <div class="col-3">
                                                                <a data-toggle="popover" data-content="Xóa khỏi lớp"
                                                                   data-trigger="hover" data-placement="top"
                                                                   data-original-title="" title=""
                                                                   onclick="physicalDelete(function() {window.location.href = '{{route('class/remove_one',['id_user' => $value->id, 'id_class' => $data->cl_id ])}}'},'Sinh viên {{$value->name}} sẽ bị xóa khỏi lớp này')"
                                                                >
                                                                    <i class="ft-trash danger background-round btn-outline-danger "></i>
                                                                </a>
                                                            </div>
                                                        @endif
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
                    <div class="col-12">
                        <div class="card bg-white m-1 border">
                            <div class="card-content ">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="media-body text-info text-left">
                                            <h6 class="font-weight-bold">Dữ liệu đang rỗng</h6>
                                            <span>Chọn thêm học viên để thêm danh sách các học viên cho lớp này</span>
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
    </div>
@endsection
@include('pages.class.student_default')

@section('modal')

@endsection

