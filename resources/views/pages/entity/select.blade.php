<div class="row">
    @if(isset($cy_val['select']) && $cy_val['select']->count() > 0)
        @foreach( $cy_val['select'] as $key_cs => $val_cs)
            <div class="col-12">
                <h5 class="info font-weight-bold mb-0">
                    <div class="heading-elements">
                        <span class="pr-3">{{$val_cs->cs_name}}
                        </span>
                        <div class="float-right">
                            <span class="btn btn-sm round btn-outline-dark "> Xem</span>
                            @if(\App\Http\Controllers\RouteViewController::routeView('entity/create'))
                            <span class="btn btn-sm round btn-outline-info " onclick="CreateEntity()"> Thêm</span>
                            @endif
                            @if(\App\Http\Controllers\RouteViewController::routeView('select/change'))
                                <span class="btn btn-sm round btn-outline-success "
                                      onclick="UpdateSelectgetListCycle('{{$val_cs->cs_id}}','{{$cy_val->cy_id}}', '{{$val_cs->cs_name}}', '{{$val_cs->cs_begin}}', '{{$val_cs->cs_end}}')"> Sửa</span>
                            @endif
                            @if(\App\Http\Controllers\RouteViewController::routeView('select/hide/{id}'))
                                <span class="btn btn-sm round btn-outline-warning "
                                      onclick="logicDelete(function() {window.location.href = '{{route('select/hide',['id'=>$val_cs->cs_id])}}'})"> Ẩn</span>
                            @endif
                            @if(\App\Http\Controllers\RouteViewController::routeView('select/remove/{id}'))
                                <span class="btn btn-sm round btn-outline-danger "
                                      onclick="physicalDelete(function() {window.location.href = '{{route('select/remove',['id'=>$val_cs->cs_id])}}'},'Các giá trị chu kỳ thuộc mục này, cùng các hoạt động cộng điểm liên quan sẽ bị xóa')"> Xóa</span>
                            @endif
                        </div>
                    </div>
                </h5>
                <hr class="pt-1">
                {{--Chèn dữ liệu ở đây--}}
                <div class="row">
                    @if(isset($val_cs['entity']) && $val_cs['entity']->count() > 0 )
                        @foreach($val_cs['entity'] as $key_e => $val_e)
                            <div class="col-md-3">
                                {{--Chèn dữ liệu giá trị chu kỳ--}}
                                @include('pages.entity.entity')
                            </div>
                        @endforeach
                        {!! $val_cs['entity']->links() !!}
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
        @endforeach
    @else
        <div class="col-12">
            <div class="card bg-white m-1 border">
                <div class="card-content ">
                    <div class="card-body">
                        <div class="media d-flex">
                            <div class="media-body text-info text-left">
                                <h4 class="font-weight-bold">Dữ liệu bộ chọn đang rỗng</h4>
                                <span>Chọn thêm bộ chọn để tạo mới dữ liệu</span>
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