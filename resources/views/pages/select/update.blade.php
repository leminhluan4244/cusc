<div class="modal fade" id="updateSelectModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header  bg-success">
                    <h4 class="card-title white" id="hidden-label-basic-form">Cập nhật thông tin bộ chọn</h4>
                    <a class="heading-elements-toggle "><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements white">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collpase show">
                    <div class="card-body">
                        <form method="post" action="{{route('select/change')}}" class="form">
                            @csrf
                            <input type="hidden" id="cs_id_update" name="cs_id">
                            <div class="form-body">
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="Tên bộ chọn" name="cs_name" id="cs_name_update" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="Thời gian bắt đầu" name="cs_begin" id="cs_begin_update" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="Thời gian kết thúc" name="cs_end" id="cs_end_update" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <h6>Chọn một bộ chọn</h6>
                                    <select class="select2 form-control" name="cy_id" id="update_cs_cy" style="width: 100%" required>
                                        {{--Chèn ở đây--}}
                                    </select>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-success btn-sm box-shadow-3 ">
                                    Cập nhật
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
