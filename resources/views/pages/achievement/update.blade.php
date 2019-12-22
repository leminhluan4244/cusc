<div class="modal fade" id="updateAchievementModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-success">
                    <h4 class="card-title white" id="hidden-label-basic-form">Chỉnh sửa vai trò</h4>
                    <div class="heading-elements white">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collpase show">
                    <div class="card-body">
                        <form method="post" action="{{route('achievement/change')}}" class="form">
                            @csrf
                            <input type="hidden" id="a_id_update" name="a_id" value="">
                            <input type="hidden" id="aa_id_update" name="aa_id" value="">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-content">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="form-group col-md-6 col-12">
                                                            <input type="text" class="form-control"
                                                                   placeholder="Vai trò trong sự kiện" name="aa_name" id="aa_name_update" required>
                                                        </div>
                                                        <div class="form-group col-md-6 col-12"">
                                                        <input type="number" class="form-control" min="0"
                                                               placeholder="Số điểm tối đa" name="aa_scores" id="aa_scores_update" required>
                                                    </div>
                                                    <div class="form-group col-12">
                                                        <select onchange="UpdateActiveAchievementGetCategory('default','default')" name="c_id" id="c_id_update" value="default" class="form-control" required>
                                                            {{--nạp ở đây--}}
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-12">
                                                        <fieldset class="text-center ">
                                                            <h6>Chọn một giá trị</h6>
                                                            <div id="group_child_update" class="checkboxes-and-radios">
                                                                {{--nạp ở đây--}}
                                                            </div>
                                                        </fieldset>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-success btn-sm box-shadow-3 ">
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

