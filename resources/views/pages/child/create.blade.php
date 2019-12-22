<div class="modal fade" id="addChildModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered " role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-info">
                    <h4 class="card-title white" id="add_child_title">Nhập thông mục con</h4>
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
                        <form method="post" action="{{route('child/create')}}" class="form" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" id="c_id_create" name="c_id" value="">
                            <div class="form-body">
                                <div class="row">
                                    <div class="form-group col-md-3 col-12 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="Đề mục ." name="cc_item" id="cc_item_create" required>
                                    </div>
                                    <div class="form-group col-md-9 col-12 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="Tên mục con" name="cc_name" id="cc_name_create" required>
                                    </div>
                                    <div class="form-group col-md-6 col-12 ">
                                        <input type="number" class="form-control"
                                               placeholder="Điểm tối đa / 1 lần" name="cc_max_scores" id="cc_max_scores_create" max="100000" min="0" required>
                                    </div>
                                    <div class="form-group col-md-6 col-12 ">
                                        <input type="number" class="form-control"
                                               placeholder="Lần tối đa / chu kỳ" name="cc_max_amount" id="cc_max_amount_create" max="100000" min="0" required>
                                    </div>
                                    <div class="form-group col-md-6 col-12 mb-0">
                                        <input type="number" class="form-control"
                                               placeholder="Điểm giới hạn" name="cc_max_scores_cycle" id="cc_max_scores_cycle_create" max="100000" min="0" >
                                    </div>
                                    <div class="form-group col-md-6 col-12 mb-0">
                                        <div id="max_scores_radio" class="checkboxes-and-radios" style="margin: 0;background: #fff;">
                                            <input type="checkbox" onclick="ChildChangeHideCreate()" value="max" name="max_scores_cycle" id="max_scores_cycle_create"><label for="max_scores_cycle_create">Không giới hạn</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12 mb-0">
                                        <h5 class="form-section"><b><i class="la la-paperclip"></i> Chọn chu kỳ thực hiện</b></h5>
                                    </div>
                                    <div class="form-group col-12 mb-0">
                                        <select class="select2 form-control" name="cy_id" multiple id="category_create_group_cycle_radio" style="width: 100%" required>
                                            {{--Chèn ở đây--}}
                                        </select>
                                    </div>
                                    <div class="form-group col-12 mb-0">
                                        <h5 class="form-section"><b><i class="la la-paperclip"></i> Phân quyền được chấm mục này</b></h5>
                                    </div>
                                    <div class="form-group col-12 mb-0">
                                        <select class="select2 form-control" name="r_id[]" multiple id="category_create_group_role_checkbox" style="width: 100%" required>
                                            {{--Chèn ở đây--}}
                                        </select>
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

