<div class="card">
    <div class="card-content">
        <div class="card-body p-0">
            <div class="media-list list-group">
                <div class="list-group-item media p-1  ">
                    <a class="media-link">
                        <h6 class="text-bold-600 m-0 mb-1">{{$val_e->ec_name}}
                            @if(isset($val_e->d_id))
                                <i class="la la-star yellow float-right"></i>
                            @endif
                        </h6>
                        <span class="media-left">
                          <p class="font-small-3 text-muted m-0 dark">Bắt đầu: </p>
                          <p class="font-small-3 text-muted m-0 dark">Kết thúc: </p>
                        </span>
                        <span class="media-body text-right">
                              <p class="font-small-3 text-muted m-0 success">{{date_format(new DateTime($val_e->ec_begin),'d-m-Y')}}</p>
                              <p class="font-small-3 text-muted m-0 success">{{date_format(new DateTime($val_e->ec_end),'d-m-Y')}}</p>
                        </span>
                        <div class="heading-elements text-center pt-1">
                            <div class="row">
                                <div class="col-3">
                                    @if(!isset($val_e->d_id))
                                        @if($val_e->ec_commit != null)
                                            <a data-toggle="popover" data-content="Đã chốt" data-trigger="hover"
                                               data-placement="top" data-original-title="" title="">
                                                <i class="ft-slash dark "></i>
                                            </a>
                                        @else
                                            <a data-toggle="popover" data-content="Chờ khởi động"
                                               data-trigger="hover" data-placement="top" data-original-title=""
                                               title="">
                                                <i class="ft-sun yellow "></i>
                                            </a>
                                        @endif
                                    @else
                                        @if(\App\Http\Controllers\RouteViewController::routeView('entity/success'))
                                            <a data-toggle="popover" data-content="Chốt chu kỳ" data-trigger="hover"
                                               data-placement="top"
                                               onclick="getAvailableNextEntity('{{$val_e->ec_id}}')"
                                               data-original-title="" title="">
                                                <i class="ft-bookmark white background-round bg-danger"></i>
                                            </a>
                                        @endif
                                    @endif
                                </div>
                                @if(\App\Http\Controllers\RouteViewController::routeView('entity/change'))
                                    <div class="col-3">
                                        <a data-toggle="popover" data-content="Chỉnh sửa" data-trigger="hover"
                                           data-placement="top"
                                           onclick="UpdateEntity('{{$val_e->ec_id}}','{{$val_e->ec_name}}')"
                                           data-original-title="" title="">
                                            <i class="ft-edit-3 success "></i>
                                        </a>
                                    </div>
                                @endif
                                @if(\App\Http\Controllers\RouteViewController::routeView('entity/hide/{id}'))
                                    <div class="col-3">
                                        <a data-toggle="popover" data-content="Xóa tạm" data-trigger="hover"
                                           data-placement="top"
                                           onclick="logicDelete(function() {window.location.href = '{{route('entity/hide',['id'=>$val_e->ec_id])}}'})"
                                           data-original-title="" title="">
                                            <i class="ft-trash-2 warning "></i>
                                        </a>
                                    </div>
                                @endif
                                @if(\App\Http\Controllers\RouteViewController::routeView('entity/remove/{id}'))
                                    <div class="col-3">
                                        <a data-toggle="popover" data-content="Xóa vĩnh viễn" data-trigger="hover"
                                           data-placement="top"
                                           onclick="physicalDelete(function() {window.location.href = '{{route('entity/remove',['id'=>$val_e->ec_id])}}'},'Các mục điểm cộng liên quan đến mục này sẽ tự xóa')"
                                           data-original-title="" title="">
                                            <i class="ft-trash danger "></i>
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