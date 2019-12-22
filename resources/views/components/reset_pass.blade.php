<div class="modal fade" id="ResetPass" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-danger">
                    <h4 class="card-title white" id="hidden-label-basic-form">Đổi mật khẩu</h4>
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
                        <form method="post" action="{{route('users/resetPass')}}" class="form">
                            @csrf
                            <input type="hidden" value="{{\Illuminate\Support\Facades\Auth::user()->id}}" name="users_id">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="form-group col-12">
                                                <input type="password" class="form-control"
                                                       placeholder="Mật khẩu cũ" name="old_pass" id="" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-12">
                                                <input type="password" class="form-control"
                                                       placeholder="Mật khẩu mới" name="new_pass" id="" required>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-12">
                                                <input type="password" class="form-control"
                                                       placeholder="Nhập lại mật khẩu mới" name="re_new_pass" id="" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-danger btn-sm box-shadow-3 mt-1">
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
