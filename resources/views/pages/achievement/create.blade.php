<div class="modal fade" id="addAchievementModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-info">
                    <h4 class="card-title white" id="hidden-label-basic-form">Nhập thông tin vai trò</h4>
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
                        <form method="post" action="{{route('achievement/create')}}" class="form">
                            @csrf
                            <input type="hidden" id="a_id_create" name="a_id" value="{{$data['active']['a_id']}}">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-content">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="form-group col-md-6 col-12">
                                                            <input type="text" class="form-control"
                                                                   placeholder="Vai trò trong sự kiện" name="aa_name" id="aa_name_create" required>
                                                        </div>
                                                        <div class="form-group col-md-6 col-12">
                                                            <input type="number" class="form-control" min="0"
                                                                   placeholder="Số điểm tối đa" name="aa_scores" id="aa_scores_create" required>
                                                        </div>
                                                        <div class="form-group col-12">
                                                            <select onchange="CreateActiveGetChildByCategory()" name="c_id" id="c_id_create" value="default" class="form-control" required>
                                                                {{--nạp ở đây--}}
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-12">
                                                            <fieldset class="text-center ">
                                                                <div id="group_child_create" class="checkboxes-and-radios">
                                                                    {{--nạp ở đây--}}
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <div class="card bg-white m-1 border">
                                                                                <div class="card-content ">
                                                                                    <div class="card-body">
                                                                                        <div class="media d-flex">
                                                                                            <div class="media-body text-info text-left">
                                                                                                <h6 class="font-weight-bold">Chọn mục lớn để hiển thị dữ liệu mục con</h6>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class=" text-center">
                                <button class="btn btn-info btn-sm box-shadow-3 ">
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

