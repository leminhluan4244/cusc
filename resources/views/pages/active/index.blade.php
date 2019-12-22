@section('content-body')
    <div class="content-body">
        <div class="row mb-2">
            <div class="content-header-left col-12">
                <div class=" float-md-left">
                    <button onclick="javascript:window.history.back()"
                            class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold" id="back" type="button"><i
                                class="ft-skip-back icon-left font-weight-bold warning"></i><span>Trang trước</span>
                    </button>
                    <button onclick="javascript:window.history.go(-1)"
                            class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold" id="next" type="button">
                        <span>Trang sau </span><i class="ft-skip-forward icon-right font-weight-bold warning"></i>
                    </button>
                </div>
                @if(\App\Http\Controllers\RouteViewController::routeView('active/create'))
                    <div class=" float-md-right">
                        <button data-toggle="modal" data-target="#activeAddModel"
                                class="btn btn-info round  px-2 box-shadow-3" id="add" type="button"><i
                                    class="ft-plus icon-left"></i><span>Thêm sự kiện</span></button>
                    </div>
                @endif
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">{{$keyName}}
                        </h4>
                        @include('pages.active.menu')
                        <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="card-body" style="background: #fff2c3;">
                            @if(isset($data) && sizeof($data)>0)
                                @if(sizeof($data)>30)
                                    <div class="row">
                                        <div class="nns-pagination">
                                            <ul class="pagination">
                                                <li class="page-item"><a class="page-link"
                                                                         href="{{ $data->toArray()['first_page_url'] }}"><i
                                                                class="ft-chevrons-left"></i></a></li>
                                            </ul>
                                            {!! $data->links() !!}
                                            <ul class="pagination">
                                                <li class="page-item"><a class="page-link"
                                                                         href="{{ $data->toArray()['last_page_url'] }}"><i
                                                                class="ft-chevrons-right"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                @endif
                                <div class="row">
                                    @foreach($data as $value)
                                        <div class="col-md-4 col-sm-6 col-12">
                                            <div class="card">
                                                <div class="card-content">
                                                    <div class="card-body p-0">
                                                        <div class="media-list list-group">
                                                            <div class="list-group-item media p-1  ">
                                                                <a class="media-link">
                                                                    <h6 class="text-bold-600 m-0 mb-1">{{$value->a_name}}
                                                                    </h6>
                                                                    <span class="media-left">
                                                              <p class="font-small-3 text-muted m-0 dark">Bắt đầu: </p>
                                                              <p class="font-small-3 text-muted m-0 dark">Kết thúc: </p>
                                                            </span>
                                                                    <span class="media-body text-right">
                                                              <p class="font-small-3 text-muted m-0 "><span
                                                                          class="badge badge badge-info badge-pill">{{date_format(new DateTime($value->a_begin),'d-m-Y')}}</span></p>
                                                              <p class="font-small-3 text-muted m-0 "><span
                                                                          class="badge badge badge-warning badge-pill">{{date_format(new DateTime($value->a_end),'d-m-Y')}}</span></p>
                                                            </span>
                                                                    <div class="heading-elements text-center pt-1">
                                                                        <div class="row">
                                                                            <div class="col-2 p-0">
                                                                                @if(\App\Http\Controllers\RouteViewController::routeView('active/api/count/{id}'))
                                                                                    <a
                                                                                            id="countJoinActive{{$value->a_id}}"
                                                                                            data-toggle="popover"
                                                                                            data-content="Click vào để xem số lượt đăng ký tham gia"
                                                                                            data-trigger="hover"
                                                                                            data-placement="top"
                                                                                            data-original-title=""
                                                                                            title=""
                                                                                            onclick="getCountUserJoinActive('{{$value->a_id}}')"
                                                                                    >
                                                                                        <i class="ft-heart btn-outline-pink background-round "></i>
                                                                                    </a>
                                                                                @endif
                                                                            </div>
                                                                            <div class="col-2 p-0">

                                                                                @if($value->a_active == -1)
                                                                                    @if(\App\Http\Controllers\RouteViewController::routeView('active/approved/{id}'))
                                                                                        <a data-toggle="popover"
                                                                                           data-content="Duyệt sự kiện"
                                                                                           data-trigger="hover"
                                                                                           data-placement="top"
                                                                                           data-original-title=""
                                                                                           title=""
                                                                                           onclick="successSelect(function() {window.location.href = '{{route('active/approved',['id'=>$value->a_id])}}'},'Sau khi xác nhận sự kiện sẽ được gợi ý trong mục cộng điểm tương ứng')">
                                                                                            <i class="ft-zap btn-yellow background-round"></i>
                                                                                        </a>
                                                                                    @endif
                                                                                @else
                                                                                    <a data-toggle="popover"
                                                                                       data-content="Đã duyệt"
                                                                                       data-trigger="hover"
                                                                                       data-placement="top"
                                                                                       data-original-title="" title="">
                                                                                        <i class="ft-star btn-outline-yellow background-round"></i>
                                                                                    </a>
                                                                                @endif
                                                                            </div>
                                                                            @if(\App\Http\Controllers\RouteViewController::routeView('achievement/{id}'))
                                                                                <div class="col-2 p-0">
                                                                                    <a data-toggle="popover"
                                                                                       data-content="Chi tiết"
                                                                                       data-trigger="hover"
                                                                                       data-placement="top"
                                                                                       href="{{route('achievement/index', ['id' => $value->a_id])}}">
                                                                                        <i class="ft-eye btn-outline-info background-round"></i>
                                                                                    </a>
                                                                                </div>
                                                                            @endif
                                                                            @if(\App\Http\Controllers\RouteViewController::routeView('active/change'))
                                                                                <div class="col-2 p-0">
                                                                                    <a data-toggle="popover"
                                                                                       data-content="Chỉnh sửa"
                                                                                       data-trigger="hover"
                                                                                       data-placement="top"
                                                                                       onclick="UpdateActiveGet('{{$value->a_id}}')">
                                                                                        <i class="ft-edit-3 btn-outline-success background-round"></i>
                                                                                    </a>
                                                                                </div>
                                                                            @endif
                                                                            @if(\App\Http\Controllers\RouteViewController::routeView('active/hide/{id}'))
                                                                                <div class="col-2 p-0">
                                                                                    <a data-toggle="popover"
                                                                                       data-content="Xóa tạm"
                                                                                       data-trigger="hover"
                                                                                       data-placement="top"
                                                                                       onclick="logicDelete(function() {window.location.href = '{{route('active/hide',['id'=>$value->a_id])}}'})">
                                                                                        <i class="ft-trash-2 btn-outline-warning background-round"></i>
                                                                                    </a>
                                                                                </div>
                                                                            @endif
                                                                            @if(\App\Http\Controllers\RouteViewController::routeView('active/remove/{id}'))
                                                                                <div class="col-2 p-0">
                                                                                    <a data-toggle="popover"
                                                                                       data-content="Xóa vĩnh viễn"
                                                                                       data-trigger="hover"
                                                                                       data-placement="top"
                                                                                       onclick="physicalDelete(function() {window.location.href = '{{route('active/remove',['id'=>$value->a_id])}}'},'Các mục cộng điểm liên quan sẽ hủy theo, các phân công sự kiện cũng sẽ tự hủy')">
                                                                                        <i class="ft-trash btn-outline-danger background-round"></i>
                                                                                    </a>
                                                                                </div>
                                                                            @endif
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                                @if(sizeof($data)>30)
                                    <div class="row">
                                        <div class="nns-pagination">
                                            <ul class="pagination">
                                                <li class="page-item"><a class="page-link"
                                                                         href="{{ $data->toArray()['first_page_url'] }}"><i
                                                                class="ft-chevrons-left"></i></a></li>
                                            </ul>
                                            {!! $data->links() !!}
                                            <ul class="pagination">
                                                <li class="page-item"><a class="page-link"
                                                                         href="{{ $data->toArray()['last_page_url'] }}"><i
                                                                class="ft-chevrons-right"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                @endif
                            @else
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card bg-white m-1 border">
                                            <div class="card-content ">
                                                <div class="card-body">
                                                    <div class="media d-flex">
                                                        <div class="media-body text-info text-left">
                                                            <h6 class="font-weight-bold">Dữ liệu đang rỗng</h6>
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
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@include('pages.active.default')

