<div class="modal fade" id="addClassModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-info">
                    <h4 class="card-title white" id="hidden-label-basic-form">Nhập thông tin lớp</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements white">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collpase show">
                    <div class="card-body">
                        <form method="post" action="{{route('class/create')}}" class="form">
                            @csrf
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="form-group col-12">
                                                <input type="text" class="form-control"
                                                       placeholder="Mã CUSC lớp" name="cl_code" id="cl_code_create" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-12">
                                                <input type="text" class="form-control"
                                                       placeholder="Tên lớp" name="cl_name" id="cl_name_create" required>
                                            </div>
                                        </div>
                                        <h6 class="card-title">Chọn các liên kết cho lớp</h6>
                                        <ul class="nav nav-tabs nav-top-border no-hover-bg">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="baseIcon-tab11" data-toggle="tab" aria-controls="tabIcon11"
                                                   href="#tabIcon11" aria-expanded="true"><i class="la la-graduation-cap"></i>Chuyên ngành</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="baseIcon-tab12" data-toggle="tab" aria-controls="tabIcon12"
                                                   href="#tabIcon12" aria-expanded="false"><i class="la la-calendar"></i>Niên khóa</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="baseIcon-tab13" data-toggle="tab" aria-controls="tabIcon13"
                                                   href="#tabIcon13" aria-expanded="false"><i class="la la-users"></i>Chủ nhiệm</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content px-1 pt-1">
                                            <div role="tabpanel" class="tab-pane active" id="tabIcon11" aria-expanded="true" aria-labelledby="baseIcon-tab11">
                                                <section id="scroll-wheel">
                                                    <div class="row match-height">
                                                        <div class="default-wheel-speed scroll-example height-250" style="width: 100%;">
                                                            <div class="form-group">
                                                                <fieldset class="text-center ">
                                                                    <div id="group_radio" class="checkboxes-and-radios group_major_create row">

                                                                    </div>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>
                                            <div class="tab-pane" id="tabIcon12" aria-labelledby="baseIcon-tab12">
                                                <section id="scroll-wheel">
                                                    <div class="row match-height">
                                                        <div class="default-wheel-speed scroll-example height-250" style="width: 100%;">
                                                            <div class="form-group">
                                                                <fieldset class="text-center ">
                                                                    <div id="group_radio" class="checkboxes-and-radios group_school_year_create row">

                                                                    </div>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>
                                            <div class="tab-pane" id="tabIcon13" aria-labelledby="baseIcon-tab3">
                                                <section id="scroll-wheel">
                                                    <div class="row match-height">
                                                        <div class="default-wheel-speed scroll-example height-250" style="width: 100%;">
                                                            <div class="form-group">
                                                                <fieldset class="text-center ">
                                                                    <div id="group_radio" class="checkboxes-and-radios group_employee_create row">

                                                                    </div>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-info btn-sm box-shadow-3 mt-1">
                                    Lưu
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
