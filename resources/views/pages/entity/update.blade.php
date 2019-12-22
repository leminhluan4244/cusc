<div class="modal fade" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-success">
                    <h4 class="card-title white" id="name">Cập nhật thông tin </h4>
                    <a class="heading-elements-toggle white"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collpase show">
                    <div class="card-body">
                        <form method="post" action="{{route('entity/change')}}" class="form">
                            @csrf
                            <input type="hidden" id="ec_id_update" name="ec_id">
                            <div class="form-body">
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <input  type="text" class="form-control"
                                               placeholder="Giá trị" name="ec_name" id="ec_name_update" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <input type="date" class="form-control"
                                               placeholder="Thời gian bắt đầu" name="ec_begin" id="ec_begin_update" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <input type="date" class="form-control"
                                               placeholder="Thời gian kết thúc" name="ec_end" id="ec_end_update" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <select onchange="getListSelect('default','default')" name="cy_id" id="update_ec_cy" value="default" class="form-control" required>
                                        {{--class="jui-select-podcasts"--}}
                                    </select>
                                </div>
                                <div class="form-group">
                                    <fieldset class="text-center ">
                                        <h6>Chọn một giá trị</h6>
                                        <div id="group_radio_update" class="checkboxes-and-radios">

                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-success btn-sm box-shadow-3 mt-1 ">
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

