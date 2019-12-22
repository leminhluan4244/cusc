<div class="row">
    @if(isset($c_val['child']) && sizeof($c_val['child'])!=0)
        @foreach($c_val['child'] as $kchild => $val_child)
            <div class="col-md-4 col-12">
                <div class="card mb-1">
                    <div class="card-content">
                        <div class="card-body p-0">
                            <div class="media-list list-group">
                                <div class="list-group-item media p-1  ">
                                    <a class="media-link">
                                        <h6 class="text-bold-600 m-0 mb-1 border-bottom nns-small-card">
                                            <b>{{$val_child->cc_item}}. {{$val_child->cc_name}}</b>
                                        </h6>
                                        <span class="media-left">
                                          <p class="font-small-3 text-muted m-0 dark"> Điểm tối đa / Lần :</p>
                                          <p class="font-small-3 text-muted m-0 dark"> Số lần / Chu kỳ :</p>
                                          <p class="font-small-3 text-muted m-0 dark"> Điểm tối đa / Chu kỳ :</p>
                                        </span>
                                        <span class="media-body text-right">
                                              <p class="font-small-3 text-muted m-0 danger "><b>{{$val_child->cc_max_scores}}</b></p>
                                              <p class="font-small-3 text-muted m-0 danger"><b>{{$val_child->cc_max_amount}}</b></p>
                                              <p class="font-small-3 text-muted m-0 danger">
                                                  @if($val_child->cc_max_scores_cycle==10000000)
                                                      <b class="badge badge-pill badge-default bg-danger badge-glow">Không giới hạn</b>
                                                  @else
                                                      <b class="badge badge-pill badge-default bg-danger badge-glow">{{$val_child->cc_max_scores_cycle}}</b>
                                                  @endif
                                              </p>
                                        </span>
                                    </a>
                                    <div class="heading-elements text-center pt-1">
                                        <div class="row">
                                            <div class="col-3">
                                                <a data-toggle="popover" data-content="Xem chi tiết"
                                                   data-trigger="hover" data-placement="top"
                                                   onclick="infoChild('{{$val_child->cc_id}}')"
                                                   data-original-title="" title="">
                                                    <i class="ft-eye btn-outline-info background-round"></i>
                                                </a>
                                            </div>
                                            @if(\App\Http\Controllers\RouteViewController::routeView('child/change'))
                                                <div class="col-3">
                                                    <a data-toggle="popover" data-content="Chỉnh sửa"
                                                       data-trigger="hover"
                                                       data-placement="top"
                                                       onclick="CategoryChildGetUpdateForm('{{$val_child->cc_id}}')"
                                                       data-original-title="" title="">
                                                        <i class="ft-edit-3 btn-outline-success background-round "></i>
                                                    </a>
                                                </div>
                                            @endif
                                            @if(\App\Http\Controllers\RouteViewController::routeView('child/hide/{id}'))
                                                <div class="col-3">
                                                    <a data-toggle="popover" data-content="Xóa tạm" data-trigger="hover"
                                                       data-placement="top"
                                                       onclick="hideChildCategory('{{$val_child->cc_id}}')"
                                                       data-original-title="" title="">
                                                        <i class="ft-trash-2 btn-outline-warning background-round "></i>
                                                    </a>
                                                </div>
                                            @endif
                                            @if(\App\Http\Controllers\RouteViewController::routeView('child/remove/{id}'))
                                                <div class="col-3">
                                                    <a data-toggle="popover" data-content="Xóa vĩnh viễn"
                                                       data-trigger="hover" data-placement="top"
                                                       onclick="removeChildCategory('{{$val_child->cc_id}}')"
                                                       data-original-title="" title="">
                                                        <i class="ft-trash btn-outline-danger background-round "></i>
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
            <div class="card bg-white m-1">
                <div class="card-content ">
                    <div class="card-body">
                        <div class="media d-flex">
                            <div class="media-body text-info text-left">
                                <h6 class="font-weight-bold">Dữ liệu đang rỗng</h6>
                                <span>Chọn thêm mục con để tạo mới dữ liệu cho hệ thống</span>
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
