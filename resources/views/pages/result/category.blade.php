<div class="col-12">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Danh sách mục lớn
            </h4>
            <div class="heading-elements">
                <ul class="list-inline mb-0">
                    <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                    <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="card-content" style="background: rgb(244, 245, 233);">
            <div class="row pt-1">
                @if(isset($data['category']) && sizeof($data['category'])>0)
                    @foreach($data['category'] as $c_key => $c_val)
                        <div class="col-6 {{$c_key%2==0 ? 'pr-0' : 'pl-0'}}" onclick="getChildForCategory('{{$c_val->c_id}}', '{{$data['user']->id}}')">
                            <div class="card mb-1">
                                <div class="card-content">
                                    <div class="card-body pt-0 pb-0" style="background: rgb(244, 245, 233);">
                                        <div class="media-list list-group">
                                            <div class="list-group-item media p-1  ">
                                                <a class="media-link">
                                                    <h6 class="text-bold-600 m-0 mb-1 border-bottom nns-small-card"><b>{{$c_val->c_item}}. {{$c_val->c_name}}</b>
                                                    </h6>
                                                    <span class="media-left">
                                                      <p class="font-small-3 text-muted m-0 dark"> <i class="ft-chevrons-right"></i> Tối đa:</p>
                                                      <p class="font-small-3 text-muted m-0 dark"> <i class="ft-chevrons-right"></i> Điểm hiện có:</p>
                                                      <p class="font-small-3 text-muted m-0 dark"> <i class="ft-chevrons-right"></i> Cơ chế cộng:</p>
                                                    </span>
                                                    <span class="media-body text-right">
                                                      <p class="font-small-3 text-muted m-0 danger ">
                                                          <b>
                                                              @if($c_val->c_max_scores==10000000)
                                                                  <span class="badge badge badge-dark badge-pill mr-2">Maximum</span>
                                                              @else
                                                                  <span class="badge badge badge-dark badge-pill mr-2">{{$c_val->c_max_scores}}</span>
                                                              @endif
                                                          </b>
                                                      </p>
                                                        <p class="font-small-3 text-muted m-0 danger"><b><span class="badge badge badge-danger badge-pill mr-2">{{$c_val['scores']}}</span></b></p>
                                                      <p class="font-small-3 text-muted m-0 danger">
                                                          @if($c_val->c_type==1)
                                                              <span class="badge badge badge-info badge-pill mr-2">Cộng dồn các mục</span>
                                                          @else
                                                              <span class="badge badge badge-success badge-pill mr-2">Điểm mục lớn nhất</span>
                                                          @endif
                                                      </p>
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
                <div id="lastCategory"></div>
            </div>
        </div>
    </div>
</div>