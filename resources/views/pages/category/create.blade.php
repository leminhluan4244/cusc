<div class="modal fade" id="addModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-info">
                    <h4 class="card-title white" id="hidden-label-basic-form">Nhập thông chu kỳ</h4>
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

                        <form method="post" action="{{route('category/create')}}" class="form">
                            @csrf
                            <div class="form-body">
                                <div class="row">
                                    <div class="form-group col-md-3 col-12 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="Đề mục ." name="c_item" id="c_item_create" required>
                                    </div>
                                    <div class="form-group col-md-9 col-12 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="Tên mục lớn" name="c_name" id="c_name_create" required>
                                    </div>
                                    <div class="form-group col-md-6 col-12 mb-0">
                                        <input type="number" class="form-control"
                                               placeholder="Điểm tối đa" name="c_max_scores" id="c_max_scores_create" max="100000" min="0" value="0">
                                    </div>
                                    <div class="form-group col-md-6 col-12 mb-0">
                                        <div id="max_scores_radio" class="checkboxes-and-radios" style="margin: 0;background: #fff;">
                                            <input type="checkbox" onclick="changeHideCreate()" value="max" name="max_scores_create" id="max_scores_create"><label for="max_scores_create">Không giới hạn</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-12 mb-0">
                                        <h5 class="form-section"><b><i class="la la-paperclip"></i> Lựa chọn cơ chế cộng</b></h5>
                                    </div>
                                    <div class="form-group col-md-6 col-12 mb-2">
                                        <div id="max_scores_radio" class="checkboxes-and-radios" style="background: #fff;">
                                            <input type="radio" name="c_type" id="c_type_1" value="1" required><label for="c_type_1">Cộng tổng mục con</label>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6 col-12 mb-2">
                                        <div id="max_scores_radio" class="checkboxes-and-radios" style="background: #fff;">
                                            <input type="radio" name="c_type" id="c_type_2" value="0" required><label for="c_type_2">Mục con lớn nhất</label>
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
