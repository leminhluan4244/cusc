<div class="modal fade" id="controlRoleModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-dark">
                    <h4 class="card-title white" id="hidden-label-basic-form">Xác nhận truy cập cho phân quyền</h4>
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
                        <form method="post" action="{{route('permission/create')}}" class="form">
                            @csrf
                            <input type="hidden" name="r_id" id="r_id">
                            <input type="hidden" name="id" id="id">
                            <div class="form-body">
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <label class="font-weight-bold">Nhập các link bạn muốn tại đây</label>
                                        <select id="pm_route" name="pm_route[]" class="select2 form-control " multiple="multiple" style="width: 100%">
                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <label class="font-weight-bold">Nhập mật khẩu của bạn</label>
                                        <input type="password" class="form-control"
                                               placeholder="Mật khẩu" name="password" id="password">
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-dark btn-sm box-shadow-3 ">
                                    Chấp nhận
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>