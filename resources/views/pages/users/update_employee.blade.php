<div class="modal fade" id="userUpdateModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card mb-0">
                <div class="card-header border-top-3 border-top-success bg-success">
                    <h4 class="card-title white" id="basic-layout-form">Cập nhật tài khoản</h4>
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
                        <form class="form" method="post" action="{{route('users/change')}}">
                            @csrf
                            <input type="hidden" value="" id="r_id_update" name="r_id">
                            <input type="hidden" value="" id="id_update" name="id">
                            <div class="form-body">
                                <h4 class="form-section"><b><i class="ft-user"></i>Thông tin chính</b></h4>
                                <div class="form-group">
                                    <select id="r_id_list_update" value="default" name="r_id" class="jui-select-podcasts"
                                            required>
                                    </select>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-1">
                                            <label class="font-weight-bold">CUSC ID</label>
                                            <input type="text" class="form-control input-sm" placeholder="CUSC ID" name="cusc_id" id="cusc_id_update" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-1">
                                            <label class="font-weight-bold">Tên</label>
                                            <input type="text"  class="form-control input-sm" placeholder="Tên" name="name" id="name_update" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Email</label>
                                            <input type="email" class="form-control input-sm" placeholder="E-mail" name="email" id="email_update" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">SĐT</label>
                                            <input type="number" class="form-control input-sm" placeholder="Số điện thoại" name="phone" id="phone_update" required>
                                        </div>
                                    </div>
                                </div>
                                <h4 class="form-section"><b><i class="la la-paperclip"></i> Thông tin đính kèm</b></h4>
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Ngày sinh</label>
                                            <input type="date"  class="form-control input-sm"  name="birthday" id="birthday_update" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Giới tính</label><br>
                                            <div id="max_scores_radio" class="checkboxes-and-radios pl-2 display-inline-block" style="background: #fff;">
                                                <input type="radio" name="gender" id="type_3" value="1" required><label class="m-0" for="type_3">Nam</label>
                                            </div>
                                            <div id="max_scores_radio" class="checkboxes-and-radios p-0 display-inline-block" style="background: #fff;">
                                                <input type="radio" name="gender" id="type_4" value="0" required><label class="m-0" for="type_4">Nữ</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-0">
                                    <label class="font-weight-bold" >Địa chỉ</label>
                                    <textarea  rows="5" class="form-control" name="address" id="address_update" placeholder="Địa chỉ cư trú" required></textarea>
                                </div>
                            </div>
                            <div class="text-center mt-1">
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
{{--Sử dụng api kéo dữ liệu về--}}
<script>
    function getEmployeeListUpdate(id_roles) {
        $.ajax({
            type: 'GET',
            {{--UsersApiController@employee--}}
            url: '{{route('users/api/get/roles/list')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#r_id_list_update").innerHTML = '';
                htmlTable = '<option disabled selected value="default" data-class="ft-unlock">Chọn một phân quyền</option>';
                chitiet.forEach(function (element) {
                    console.log(element.r_name)
                    console.log(element.r_id)
                    console.log(id_roles)
                    if(element.r_id == id_roles){
                        console.log(element.r_name)
                        $(".ui-selectmenu-text").text(element.r_name);
                        htmlTable = htmlTable +
                            '<option value="' + element.r_id + '" selected data-class="la la-paper-plane">' + element.r_name + '</option>';
                    }
                    else
                        htmlTable = htmlTable +
                            '<option value="' + element.r_id + '"  data-class="la la-paper-plane">' + element.r_name + '</option>';
                });
                $("#r_id_list_update").html(htmlTable);
            }
        });
    }
</script>

{{--Nạp form cập nhật dùng api keo info về--}}
<script>
    function UpdateUserGetRoles(id_roles, id_user){
        getEmployeeListUpdate(id_roles);
        var url_user = '{{route('users/api/search',['id'=> ':slug'])}}';
        url_user = url_user.replace(':slug', id_user);
        $.ajax({
            type: 'GET',
            url: url_user,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $('#id_update').val(chitiet.id);
                $('#cusc_id_update').val(chitiet.cusc_id);
                $('#name_update').val(chitiet.name);
                $('#birthday_update').val(chitiet.birthday);
                $('#phone_update').val(chitiet.phone);
                $('#email_update').val(chitiet.email);
                $('#address_update').val(chitiet.address);
                if(chitiet.gender==1){
                    document.getElementById("type_3").checked = true;
                }
                else if(chitiet.gender==0){
                    document.getElementById("type_4").checked = true;
                }
                $('#userUpdateModel').modal('show');
            }
        })

    }
</script>