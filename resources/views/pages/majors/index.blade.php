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
                @if(\App\Http\Controllers\RouteViewController::routeView('majors/create'))
                    <div class=" float-md-right">
                        <button class="btn btn-info round  px-2 box-shadow-3" data-toggle="modal"
                                data-target="#addMajorModel" id="add" type="button"><i
                                    class="ft-plus icon-left"></i><span>Thêm một chuyên ngành</span></button>
                    </div>
                @endif
            </div>
        </div>
        <div class="row">
            @if(isset($data) && sizeof($data)>0)
                @foreach($data as $key => $value)
                    <div class="col-xl-4 col-md-4 col-12">
                        <div class="card ">
                            <div class="card-content">
                                <div class="card-body cleartfix">
                                    <div class="media align-items-stretch">
                                        <div class="media-body">
                                            <h6 class="text-bold-600">{{$value->m_name}}</h6>
                                            <label class="text-bold-600 danger">{{$value->m_code}}</label>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="ft-settings white background-round bg-danger font-size-large"
                                               onclick="getControl('{{$value->m_id}}','{{$value->m_code}}','{{$value->m_name}}')"></i>
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
    </div>
@endsection
@include('pages.majors.default')
