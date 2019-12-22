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
                                            <b>{{$val_child->cc_item}}. {{$val_child->cc_name}}
                                                @if(!empty($val_child['select']))
                                                    <small class="float-right success text-bold-600">&ensp; <i class="la la-star yellow"></i></small>
                                                @else
                                                    <small class="float-right danger text-bold-600">&ensp; </small>
                                                @endif
                                            </b>
                                        </h6>

                                        <span class="media-left">
                                          <p class="font-small-3 text-muted m-0 dark"> Điểm tối đa / Lần :</p>
                                          <p class="font-small-3 text-muted m-0 dark"> Số lần / Chu kỳ :</p>
                                          <p class="font-small-3 text-muted m-0 dark"> Điểm tối đa / Chu kỳ :</p>
                                        </span>
                                        <span class="media-body text-right">
                                              <p class="font-small-3 text-muted m-0 info "><b>{{$val_child->cc_max_scores}}</b></p>
                                              <p class="font-small-3 text-muted m-0 info"><b>{{$val_child->cc_max_amount}}</b></p>
                                              <p class="font-small-3 text-muted m-0 info">
                                                  @if($val_child->cc_max_scores_cycle==10000000)
                                                      <b class="badge badge-pill badge-default bg-info badge-glow">Không giới hạn</b>
                                                  @else
                                                      <b class="badge badge-pill badge-default bg-info badge-glow">{{$val_child->cc_max_scores_cycle}}</b>
                                                  @endif
                                              </p>
                                        </span>
                                        <div class="row text-center pt-1">
                                            <div class="checkboxes-and-radios p-0 ">
                                                @if($c_val->c_type==0)
                                                    @if(!empty($val_child['select']))
                                                        <input type="radio" checked name="{{$c_val->c_id}}[]" id="{{$val_child->cc_id}}" value="{{$val_child->cc_id}}" >
                                                        <label class="m-0" for="{{$val_child->cc_id}}"></label>
                                                    @else
                                                        <input type="radio" name="{{$c_val->c_id}}[]" id="{{$val_child->cc_id}}" value="{{$val_child->cc_id}}" >
                                                        <label class="m-0" for="{{$val_child->cc_id}}"></label>
                                                    @endif
                                                @else
                                                    @if(!empty($val_child['select']))
                                                        <input type="checkbox" checked name="{{$c_val->c_id}}[]" id="{{$val_child->cc_id}}" value="{{$val_child->cc_id}}" >
                                                        <label class="m-0" for="{{$val_child->cc_id}}"></label>
                                                    @else
                                                        <input type="checkbox" name="{{$c_val->c_id}}[]" id="{{$val_child->cc_id}}" value="{{$val_child->cc_id}}">
                                                        <label class="m-0" for="{{$val_child->cc_id}}"></label>
                                                    @endif
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
    @else
        <div class="col-12">
            <div class="card bg-white m-1">
                <div class="card-content ">
                    <div class="card-body">
                        <div class="media d-flex">
                            <div class="media-body text-info text-left">
                                <h6 class="font-weight-bold">Dữ liệu đang rỗng</h6>
                                <span>Vui lòng chuyển sang mục khác hoặc liên hệ quản trị viên tạo thêm mục</span>
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
