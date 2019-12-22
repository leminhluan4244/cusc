{{--Đã check--}}
<div class="modal fade" id="userAddEmployeeModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card mb-0">
                <div class="card-header bg-info">
                    <h4 class="card-title white" id="basic-layout-form">Nhập thông tin tài khoản</h4>
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
                        <form class="form" method="post" action="{{route('users/create')}}">
                            @csrf
                            <input type="text" hidden value="" id="r_id_create" name="r_id">
                            <div class="form-body">
                                <h4 class="form-section"><b><i class="ft-user"></i>Thông tin chính</b></h4>
                                <div class="form-group">
                                    <select id="r_id_list" value="default" name="r_id" class="jui-select-podcasts"
                                            required>
                                    </select>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-1">
                                            <label class="font-weight-bold">CUSC ID</label>
                                            <input type="text" class="form-control input-sm" placeholder="CUSC ID"
                                                   name="cusc_id" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-1">
                                            <label class="font-weight-bold">Tên</label>
                                            <input type="text" class="form-control input-sm" placeholder="Tên"
                                                   name="name" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Email</label>
                                            <input type="email" class="form-control input-sm" placeholder="E-mail"
                                                   name="email" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">SĐT</label>
                                            <input type="number" class="form-control input-sm"
                                                   placeholder="Số điện thoại" name="phone" required>
                                        </div>
                                    </div>
                                </div>
                                <h4 class="form-section"><b><i class="la la-paperclip"></i> Thông tin đính kèm</b></h4>
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Ngày sinh</label>
                                            <input type="date" class="form-control input-sm" name="birthday" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Giới tính</label><br>
                                            <div id="max_scores_radio"
                                                 class="checkboxes-and-radios pl-2 display-inline-block"
                                                 style="background: #fff;">
                                                <input type="radio" name="gender" id="type_1" value="1" required>
                                                <label class="m-0" for="type_1">Nam</label>
                                            </div>
                                            <div id="max_scores_radio"
                                                 class="checkboxes-and-radios p-0 display-inline-block"
                                                 style="background: #fff;">
                                                <input type="radio" name="gender" id="type_2" value="0" required>
                                                <label class="m-0" for="type_2">Nữ</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-0">
                                    <label class="font-weight-bold">Địa chỉ</label>
                                    <textarea rows="5" class="form-control" name="address"
                                              placeholder="Địa chỉ cư trú" required>
                                    </textarea>
                                </div>
                            </div>
                            <div class="text-center mt-1">
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
{{--Nhiều trường sử dụng chung nên để script trong modal YES--}}
<script>
    {{--Lấy dữ liệu danh sách các phân quyền cán bộ--}}
    function getEmployeeList() {
        $.ajax({
            type: 'GET',
            {{--UsersApiController@employee--}}
            url: '{{route('users/api/get/roles/list')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#r_id_list").innerHTML = '';
                $(".ui-selectmenu-text").text('Chọn phân quyền');
                htmlTable = '<option disabled selected value="default" data-class="ft-unlock">Chọn một phân quyền</option>';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<option value="' + element.r_id + '" data-class="la la-paper-plane">' + element.r_name + '</option>'
                });
                $("#r_id_list").html(htmlTable);
                $('#userAddEmployeeModel').modal('show');
            }
        });
    }
</script>