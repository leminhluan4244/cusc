<div class="modal fade" id="controlModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header">
                    <h4 class="card-title info" id="ctrl_name">Tên lớp</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collpase show">
                    <div class="card-body pt-0">
                        <section id="block-examples">
                            <div class="row">
                                <div class="col-12">
                                    <h5>Mã lớp:&ensp;
                                        <label id="ctrl_cl_id"></label></h5>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <div class="card profile-card-with-cover mb-0">
                                        <div class="card-profile-image text-center">
                                            <img src="{{url('theme/app-assets/images/portrait/small/avatar-s-4.png')}}"
                                                 class="rounded-circle img-border box-shadow-1" alt="Card image">
                                        </div>
                                        <div class="profile-card-with-cover-content text-center">
                                            <div class="card-body">
                                                <h6 class="card-subtitle text-muted font-weight-bold danger"
                                                    id="teacher_id">Tên giáo viên</h6>
                                                <ul class="list-inline list-inline-pipe">
                                                    <li>ID</li>
                                                    <li id="teacher_cusc_id"></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <label class="font-weight-bold info " id="ctrl_m_name">Chuyên ngành</label>
                                    <ul class="list-inline list-inline-pipe info">
                                        <li>ID ngành</li>
                                        <li id="ctrl_m_code"></li>
                                    </ul>
                                    <label class="font-weight-bold">Niên khóa</label>
                                    <label class="font-weight-bold" id="ctrl_sy_name">Niên khóa</label>
                                    <div class="text-left mt-2">
                                        @if(\App\Http\Controllers\RouteViewController::routeView('class/change'))
                                            <a
                                                    id="ctrlUpdate" data-toggle="modal" data-dismiss="modal"
                                            >
                                                <span class="ft-edit-2 background-round bg-success white"></span>
                                            </a>
                                        @endif
                                        @if(\App\Http\Controllers\RouteViewController::routeView('class/hide/{id}'))
                                            <a
                                                    id="ctrlLogicDelete" data-toggle="modal" data-dismiss="modal"
                                            >
                                                <span class="ft-trash-2 background-round bg-warning white"></span>
                                            </a>
                                        @endif
                                        @if(\App\Http\Controllers\RouteViewController::routeView('class/remove/{id}'))
                                            <a
                                                    id="ctrlPhysicalDelete" data-toggle="modal" data-dismiss="modal">
                                                <span class="ft-trash background-round bg-danger white"></span>
                                            </a>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
