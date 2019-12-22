<div class="modal fade" id="successModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-dark ">
                    <h4 class="card-title white" id="hidden-label-basic-form">Xác nhận chốt chu kỳ</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0 white">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collpase show">
                    <div class="card-body">
                        <form method="post" action="{{route('entity/success')}}" class="form" id="successForm">
                            @csrf
                            <input type="hidden" value="{{\Illuminate\Support\Facades\Auth::user()->id}}" name="id">
                            <input type="hidden" id="successIDEntity" value="{{\Illuminate\Support\Facades\Auth::user()->id}}" name="ec_id">
                            <div class="form-body">
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <input type="text" class="form-control"
                                               placeholder="CUSC ID" name="cusc_id" id="cusc_id_success" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12 mb-2">
                                        <input type="password" class="form-control"
                                               placeholder="Password" name="password" id="password_success" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <select name="next_ec" id="next_ec_success" class="form-control" required>
                                        {{--điền option ở đây--}}
                                    </select>
                                </div>
                                <div class="form-group">
                                    <fieldset class="text-center ">
                                        <h6 class="danger text-bold-600">Vui lòng xác nhận bằng ID và Password của bạn vì hoạt động này sẽ tác động đến điểm toàn bộ sinh viên</h6>
                                    </fieldset>
                                </div>
                            </div>
                            <div id="inputIDSuccess"></div>
                            <div class="text-center">
                                <button class="btn btn-dark btn-sm mr-1">
                                     Xác nhận
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
