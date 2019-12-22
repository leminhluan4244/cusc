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
                @if(\App\Http\Controllers\RouteViewController::routeView('select/create'))
                    <div class=" float-md-right">
                        <button onclick="getListCycle()" class="btn btn-info round  px-2 box-shadow-3" id="add"
                                type="button"><i class="ft-plus icon-left"></i><span>Thêm bộ chọn chu kỳ</span></button>
                    </div>
                @endif
            </div>
        </div>
        @if(isset($data) && sizeof($data)>0)
            @foreach($data as $key => $value)
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">{{$value->cy_name}}</h4>
                        <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                <li><a data-action="close"><i class="ft-x"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show " style="">
                        <div class="card-body ">
                            <div class="row">
                                @if(isset($value['select']) && sizeof($value['select'])!=0)
                                    @foreach($value['select'] as $index => $val)
                                        <div class="col-xl-4 col-lg-6 col-12">
                                            <div class="card bg-white">
                                                <div class="card-content">
                                                    <div class="card-body border-1 border-info border-radius">
                                                        <div class="media d-flex">
                                                            <div class="media-body text-left">
                                                                <h4 class="info">{{$val['cs_name']}}</h4>
                                                                <span>Bắt đầu: {{$val['cs_begin']}}</span><br>
                                                                <span>Kết thúc: {{$val['cs_end']}}</span>
                                                            </div>
                                                            <div class="align-self-center">
                                                                <div class="btn-group">
                                                                    <div class="align-self-center">
                                                                        <i class="ft-settings text-white background-round bg-info font-size-large"
                                                                           onclick="getControl('{{$val['cs_id']}}','{{$val['cy_id']}}','{{$val['cs_name']}}','{{$val['cs_begin']}}','{{$val['cs_end']}}')"></i>
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
                                        <div class="card m-1 border">
                                            <div class="card-content ">
                                                <div class="card-body">
                                                    <div class="media d-flex">
                                                        <div class="media-body text-light text-left">
                                                            <h6 class="font-weight-bold">Dữ liệu đang rỗng</h6>
                                                            <span>Chu kỳ chưa có bộ chọn, chọn nút thêm để thêm dữ liệu</span>
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
@endsection
@include('pages.select.default')