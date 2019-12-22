<div class="row">
    @if(isset($data['achievement'])  &&  sizeof($data['achievement'])!=0)
        @foreach($data['achievement'] as $key => $val)
            <div class="col-md-6 col-12" id="key{{$val->aa_id}}">
                <div class="card bg-gradient-x-info">
                    <div class="card-header ">
                        <h5 class="white"><i class="ft-pocket"></i>
                            <span class="menu-title pr-1">{{$val->aa_name}}</span>
                            <span class="badge badge badge-dark badge-pill mr-2">{{$val->aa_scores}} điểm</span>
                        </h5>
                        <div class="heading-elements ">
                            <ul class="list-inline mb-0">
                                <li><a data-action="collapse"><i class="ft-menu background-round bg-white"></i><span
                                                class="white"> Tùy chọn </span> </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse" style="background: rgb(244, 245, 233);">
                        <div class="card-body" style="padding: 0.5rem;">
                            <div class="heading-elements m-0">
                                <div class="heading-elements text-center pt-1">
                                    <div class="row">
                                        <div class="col-3">
                                            <a data-toggle="popover" data-content="Xem chi tiết"
                                               data-trigger="hover" data-placement="top"
                                               data-original-title="" title="">
                                                <i class="ft-eye btn-outline-info background-round"></i>
                                            </a>
                                        </div>
                                        @if(\App\Http\Controllers\RouteViewController::routeView('achievement/change'))
                                            <div class="col-3">
                                                <a data-toggle="popover" data-content="Chỉnh sửa" data-trigger="hover"
                                                   data-placement="top"
                                                   data-original-title="" title=""
                                                   onclick="UpdateActiveAchievement('{{$val->aa_id}}')">
                                                    <i class="ft-edit-3 btn-outline-success background-round "></i>
                                                </a>
                                            </div>
                                        @endif
                                        @if(\App\Http\Controllers\RouteViewController::routeView('achievement/api/hide/{id}'))
                                            <div class="col-3">
                                                <a data-toggle="popover" data-content="Xóa tạm" data-trigger="hover"
                                                   data-placement="top"
                                                   data-original-title="" title=""
                                                   onclick="logicDelete(function() {AchievementHide('{{$val->aa_id}}')})">
                                                    <i class="ft-trash-2 btn-outline-warning background-round "></i>
                                                </a>
                                            </div>
                                        @endif
                                        @if(\App\Http\Controllers\RouteViewController::routeView('achievement/api/remove/{id}'))
                                            <div class="col-3">
                                                <a data-toggle="popover" data-content="Xóa vĩnh viễn"
                                                   data-trigger="hover" data-placement="top"
                                                   data-original-title="" title=""
                                                   onclick="physicalDelete(function() {AchievementRemove('{{$val->aa_id}}')},'Danh sách cộng điểm cho mục này sẽ tự xóa')">
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
        @endforeach
    @else
        <div class="col-12">
            <div class="card bg-white m-1 border">
                <div class="card-content ">
                    <div class="card-body">
                        <div class="media d-flex">
                            <div class="media-body text-info text-left">
                                <h6 class="font-weight-bold">Danh sách vai trò đang rỗng</h6>
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