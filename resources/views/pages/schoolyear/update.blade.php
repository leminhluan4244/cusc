<div class="modal fade" id="updateModel" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-success">
                    <h4 class="card-title white" id="hidden-label-basic-form">Chỉnh sửa thông tin</h4>
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
                        <form method="post" action="{{route('year/change')}}" class="form">
                            @csrf
                            <input type="hidden" id="sy_id" name="sy_id">
                            <div class="form-body">
                                <div class="row">
                                    <div class="form-group col-6 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="Niên khóa" name="sy_name" id="sy_name_update" required>
                                    </div>
                                    <div class="form-group col-6 mb-2">
                                        <input style="font-size:  1rem;" type="date" required class="form-control input-lg" placeholder="Ngày bắt đầu" name="sy_begin" id="sy_begin_update">
                                    </div>
                                </div>
                            </div>
                            <div class=" text-center">
                                <button class="btn btn-success btn-sm box-shadow-3 ">
                                    Cập nhật
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
