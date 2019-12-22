<div class="modal fade" id="activeUpdateModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="card mb-0">
                <div class="card-header bg-success">
                    <h4 class="card-title white" id="basic-layout-form">Cập nhật thông tin sự kiện</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements white">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body pt-0">
                        <form class="form" method="post" action="{{route('active/change')}}">
                            @csrf
                            <input type="hidden" value="" name="a_id" id="a_id_update">
                            <div class="form-body">
                                <div class="row form-section pt-1">
                                    <h4 class=" col-md-6 col-12"><b><i class="ft-user"></i>Thông số sự kiện</b></h4>
                                    <div class="col-md-6 col-12 text-right ">
                                        <button class="btn btn-success btn-sm box-shadow-3 ">
                                            Lưu
                                        </button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="form-group mb-1">
                                            <label class="font-weight-bold">Tên sự kiện</label>
                                            <input type="text" class="form-control input-sm" placeholder="Tên sự kiện"
                                                   name="a_name" id="a_name_update" required>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Số lượng tối đa</label>
                                            <input type="number" class="form-control input-sm"
                                                   placeholder="Số người " id="a_number_update" name="a_number" min="0" max="99999999"
                                                   required>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Ngày bắt đầu</label>
                                            <input type="date" class="form-control input-sm" id="a_begin_update" name="a_begin" required>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Ngày kết thúc</label>
                                            <input type="date" class="form-control input-sm" id="a_end_update" name="a_end" required>
                                        </div>
                                    </div>
                                </div>
                                <h4 class="form-section"><b><i class="la la-paperclip"></i> Mô tả</b></h4>
                                <div class="form-group">
                                    <textarea name="a_note" id="a_note_update" cols="30" rows="15" class="ckeditor">

							        </textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    function UpdateActiveGet(id) {
        //Kéo dữ liệu về từ id
        var url_active = '{{route('active/api/search',['id'=> ':slug'])}}';
        url_active = url_active.replace(':slug', id);
        $.ajax({
            type: 'GET',
            url: url_active,
            data: {
                _token: '{{csrf_token()}}'
            },
            success: function (res) {
                chitiet = res.data;
                //Nạp các thành phần
                $('#a_id_update').val(chitiet.a_id);
                $('#a_name_update').val(chitiet.a_name);
                $('#a_begin_update').val(chitiet.a_begin);
                $('#a_end_update').val(chitiet.a_end);
                $('#a_number_update').val(chitiet.a_number);
                CKEDITOR.instances.a_note_update.setData(chitiet.a_note);
                //kéo mục lớn
                $('#activeUpdateModel').modal('show');
            }
        });
    }
</script>