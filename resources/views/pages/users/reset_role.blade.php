<div class="modal fade" id="userResetRoles" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card mb-0">
                <div class="card-header bg-dark">
                    <h4 class="card-title white" id="basic-layout-form">Khôi phục tài khoản</h4>
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
                        <form class="form" method="post" action="{{route('users/reset/role')}}">
                            @csrf
                            <input type="hidden" value="" name="u_id" id="reset_u_id">
                            <div class="form-body">
                                <h4 class="form-section"><b><i class="ft-user"></i>Chọn lại phân quyền</b></h4>
                                <div class="form-group">
                                    <select id="r_id_list_reset" value="default" name="r_id" class="jui-select-podcasts" required>
                                    </select>
                                </div>
                                <div class="form-group mb-0">
                                    <label class="font-weight-bold">Phạm vi áp dụng</label><br>
                                    <div id="max_scores_radio" class="checkboxes-and-radios pl-2 pr-2 display-inline-block" style="background: #fff;">
                                        <input type="radio" name="type" id="type_set_1" value="1" checked required><label class="m-0" for="type_set_1">Chỉ tài khoản này</label>
                                    </div>
                                    <div id="max_scores_radio" class="checkboxes-and-radios p-0 display-inline-block" style="background: #fff;">
                                        <input type="radio" name="type" id="type_set_2" value="2" required><label class="m-0" for="type_set_2">Tất cả tài khoản</label>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center mt-1">
                                <button class="btn btn-dark btn-sm box-shadow-3 ">
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

<script>
    /**
     * Lấy danh sách các phân quyền cho cán bộ
     * @param id
     */
    function getResetRole(id) {
        $.ajax({
            type: 'GET',
            url: '{{route('users/api/get/roles/list')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#r_id_list_reset").innerHTML = '';
                $(".ui-selectmenu-text").text('Chọn phân quyền');
                htmlTable = '<option disabled selected value="default" data-class="ft-unlock">Chọn một phân quyền</option>';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<option value="'+element.r_id+'" >'+element.r_name +'</option>'
                });
                $("#r_id_list_reset").html(htmlTable);
                $('#reset_u_id').val(id);
                $('#userResetRoles').modal('show');
            }
        });
    }
</script>