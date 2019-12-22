<div class="modal fade" id="updateMajorModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-success">
                    <h4 class="card-title white" id="hidden-label-basic-form">Nhập thông tin ngành học</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements bg-success white">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collpase show">
                    <div class="card-body">
                        <form method="post" action="{{route('majors/change')}}" class="form">
                            @csrf
                            <input type="hidden" id="m_id_update" name="m_id">
                            <div class="form-body">
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="Mã chuyên ngành" name="m_code" id="m_code_update" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="Tên chuyên ngành" name="m_name" id="m_name_update" required>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
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
