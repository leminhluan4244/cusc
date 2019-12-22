<div class="modal fade" id="userInfoModel" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-xs" role="document">
        <div class="modal-content">
            <div class="modal-body p-0">
                <div class="card profile-card-with-cover mb-0">
                    <div class="card-img-top img-fluid bg-cover height-200" style="background: url('{{url('theme/app-assets/images/carousel/18.jpg')}}');"></div>
                    <div class="card-profile-image">
                        <img src="{{url('theme/app-assets/images/portrait/small/avatar-s-4.png')}}" class="rounded-circle img-border box-shadow-1" alt="Card image">
                    </div>
                    <div class="profile-card-with-cover-content text-center ">
                        <div class="card-body">
                            <h4 class="card-title" id="name_info">Tên tài khoản</h4>
                            <h6 class="  btn-round btn-warning white font-weight-bold pt-1 pb-1" >Tích lũy: <span id="scores_info"></span></h6>
                            <ul class="list-inline list-inline-pipe">
                                <li >ID: <b id="cusc_id_info"></b></li>
                                <li id="birthday_info" class="font-weight-bold">SĐT tài khoản</li>
                            </ul>
                            <ul class="list-inline list-inline-pipe">
                                <li id="email_info">Gmail Tài khoản</li>
                                <li id="phone_info">SĐT tài khoản</li>
                            </ul>

                            <h6 class="" id="gender_info">Giới tính</h6>
                            <h6 class="" id="address_info">Địa chỉ tài khoản</h6>
                            <div class="text-center mt-1">
                                <i class="ft-x white background-round bg-gray font-size-large" data-dismiss="modal"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //Hiển thị info thông tin học viên
    function infoStudent(id_user) {
        //Nạp dữ liệu theo id
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
                $('#cusc_id_info').text(chitiet.cusc_id);
                $('#name_info').text(chitiet.name);
                $('#birthday_info').text(chitiet.birthday);
                $('#phone_info').text(chitiet.phone);
                $('#email_info').text(chitiet.email);
                $('#address_info').text(chitiet.address);
                $('#scores_info').text(chitiet.scores);
                if(chitiet.gender==1){
                    $('#gender_info').html('<span class="badge badge badge-danger ">Nam</span>');
                }
                else if(chitiet.gender==0){
                    $('#gender_info').html('<span class="badge badge badge-info ">Nữ</span>');
                }
                $('#userInfoModel').modal('show');
            }
        })
    }
</script>