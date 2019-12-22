@section('content-body')
    <div class="content-body">
        <form action="{{route('point/change')}}" method="post">
            <input type="hidden" value="{{$data['user']->id}}" name="u_id">
            @csrf
            <div class="row mb-2">
                <div class="content-header-left col-12">
                    <div class=" float-md-left">
                        <div class=" float-md-left">
                            <button onclick="javascript:window.history.back()"
                                    class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold" id="back"
                                    type="button"><i class="ft-skip-back icon-left font-weight-bold warning"></i><span>Trang trước</span>
                            </button>
                            <button onclick="javascript:window.history.go(-1)"
                                    class="btn btn-dark round  px-2 box-shadow-3 font-weight-bold" id="next"
                                    type="button"><span>Trang sau </span><i
                                        class="ft-skip-forward icon-right font-weight-bold warning"></i></button>
                        </div>
                    </div>
                      <div class=" float-md-right">
                            @if(\App\Http\Controllers\RouteViewController::routeView('point/result/{id}'))
                              <a href="{{route('point/result',['id'=>$data['user']->id])}}">
                                  <button class="btn btn-info round px-2 box-shadow-3" type="button"><i
                                              class="la la-star icon-left"></i><span>Chấm điểm</span></button>
                              </a>
                            @endif
                            @if(\App\Http\Controllers\RouteViewController::routeView('point/change'))
                            <button class="btn btn-success round px-2 box-shadow-3" type="submit"><i
                                        class="la la-save icon-left"></i><span>Lưu</span></button>
                            @endif
                      </div>

                </div>
            </div>
            <div class="row">
                @if(sizeof($data['category'])>0)
                    @foreach($data['category'] as $c_key => $c_val)
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title ">{{$c_val->c_item}}. {{$c_val->c_name}}
                                    </h4>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="ft-chevrons-down"></i></a></li>
                                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="row pt-1">
                                        <div class="col-md-4 col-12">
                                            <a class=""><i class="ft-pocket"></i>
                                                <span class="menu-title">Điểm tối đa: </span>
                                                @if($c_val->c_max_scores==10000000)
                                                    <span class="badge badge badge-success badge-pill mr-2">Maximum</span>
                                                @else
                                                    <span class="badge badge badge-success badge-pill mr-2">{{$c_val->c_max_scores}}</span>
                                                @endif
                                            </a>
                                        </div>
                                        <div class="col-md-8 col-12">
                                            <a class=""><i class="ft-pocket"></i>
                                                <span class="menu-title">Cách cộng mục con: </span>
                                                @if($c_val->c_type==1)
                                                    <span class="badge badge badge-info badge-pill mr-2">Cộng dồn các mục</span>
                                                @else
                                                    <span class="badge badge badge-danger badge-pill mr-2">Điểm mục lớn nhất</span>
                                                @endif
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-content collapse " style="background: #F4F5E9;">
                                    <div class="card-body">
                                        {{--//Chèn con ở đây--}}
                                        @include('pages.point.child_registration')
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="col-12">
                        <div class="card bg-white m-1">
                            <div class="card-content ">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="media-body text-info text-left">
                                            <h4 class="font-weight-bold">Dữ liệu đang rỗng</h4>
                                            <span>Chọn thêm mục lớn để tạo mới dữ liệu cho hệ thống</span>
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
            <div class="justify-content-center row">
                <button class="btn btn-success round px-2 box-shadow-3" type="submit">
                    <i class="la la-save icon-left"></i>
                    <span>Lưu</span>
                </button>
                <a class="btn btn-danger round px-2 box-shadow-3 ml-2"
                   href="{{route('point/registration',['id'=>$data['user']->id])}}">
                    <i class="la la-circle-o-notch icon-left"></i>
                    <span>Tải lại</span>
                </a>
            </div>
        </form>
    </div>
@endsection
@include('pages.point.default_registration')