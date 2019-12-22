<script>
    {{--Chạy lại datatable sau khi load--}}
    $( document ).ready(function() {
        var table = $('#achievement_list_user_table').DataTable();
        table.destroy();
        $('#achievement_list_user_table').DataTable();
    });
</script>
<script>
    {{--Lấy danh sách người dùng cho một vai trò--}}
    function getListUserForAchievement(id_achievement, name_achievement) {
        var url = '{{route('achievement/api/list_member',['id'=> ':slug'])}}';
        url = url.replace(':slug', id_achievement);
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#achievement_item_tbody").innerHTML = '';
                htmlTable = '';
                chitiet.forEach(function (element) {
                    var gender = element.gender == 1 ? 'Nam' : 'Nữ';
                    htmlTable +=
                        '<tr role="row" class="odd">' +
                        '<td class="sorting_1">' +
                        '<label class="nng">' + element.cusc_id +
                        '<input type="checkbox" name="user_id[]" id="' + element.id + '" value="' + element.id + '">' +
                        '<span class="checkmark checkmark_del"></span>' +
                        '</label>' +
                        '</td>' +
                        '<td>' + element.name + '</td>' +
                        '<td>' + gender + '</td>' +
                        '<td>' + element.birthday + '</td>' +
                        '</tr>';
                });
                //Hủy datatable sau đó render lại
                var table = $('#achievement_list_user_table').DataTable();
                table.destroy();
                $("#achievement_item_tbody").html(htmlTable);
                $('#achievement_list_user_table').DataTable();

                $("#achievement_add_user_save_button").innerHTML = '';
                $("#achievement_add_user_save_button").html(
                    '<button class="btn btn-info mr-1 round box-shadow-3" onclick="getListNonUserForAchievement(\'' + id_achievement + '\',\'' + name_achievement + '\')">' +
                    '<i class="la la-plus"></i> Thêm thành viên' +
                    '</button>' +
                    '<button class="btn btn-danger mr-1 round box-shadow-3" onclick="removeMemberToAchievement(\'' + id_achievement + '\',\'' + name_achievement + '\')">' +
                    '<i class="la la-trash"></i> Xóa các mục đã chọn' +
                    '</button>'
                );
                $('.content-body').css({'height': 'fit-content'});
            }
        });
    }

    {{--Lấy danh sách tài khoản thuộc một vai trò--}}
    function getListNonUserForAchievement(id_achievement, name_achievement) {
        var url = '{{route('achievement/api/non_member',['id'=> ':slug'])}}';
        url = url.replace(':slug', id_achievement);
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#achievement_item_tbody").innerHTML = '';
                htmlTable = '';
                chitiet.forEach(function (element) {
                    var gender = element.gender == 1 ? 'Nam' : 'Nữ';
                    htmlTable +=
                        '<tr role="row" class="odd">' +
                        '<td class="sorting_1">' +
                        '<label class="nng">' + element.cusc_id +
                        '<input type="checkbox" name="user_id[]" id="' + element.id + '" value="' + element.id + '">' +
                        '<span class="checkmark"></span>' +
                        '</label>' +
                        '</td>' +
                        '<td>' + element.name + '</td>' +
                        '<td>' + gender + '</td>' +
                        '<td>' + element.birthday + '</td>' +
                        '</tr>';
                });
                //Hủy datatable sau đó render lại
                var table = $('#achievement_list_user_table').DataTable();
                table.destroy();
                $("#achievement_item_tbody").html(htmlTable);
                $('#achievement_list_user_table').DataTable();

                $("#achievement_add_user_save_button").innerHTML = '';
                $("#achievement_add_user_save_button").html(
                    '<button class="btn btn-success mr-1 round box-shadow-3" onclick="addMemberToAchievement(\'' + id_achievement + '\',\'' + name_achievement + '\')">' +
                    '<i class="ft-check-square"></i> Lưu lại' +
                    '</button>');
                $('.content-body').css({'height': 'fit-content'});
            }
        });
    }

    {{--Thêm thành viên cho một vai trò--}}
    function addMemberToAchievement(id_achievement, name_achievement) {
        var url = '{{route('achievement/api/add_member',['id'=> ':slug'])}}';
        url = url.replace(':slug', id_achievement);
        var user_id =
            $("input[name='user_id[]']:checked")
                .map(function () {
                    return $(this).val();
                })
                .get();
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                user_id: user_id,
                aa_id: id_achievement
            },
            success: function (res) {
                {{--Gọi lại danh sách thành viên cho một vai trò--}}
                getListUserForAchievement(id_achievement, name_achievement);
                if(res.status == 'r00'){
                    toastr.success('Danh sách thành viên đã được bổ sung', 'Thao tác thành công');
                }
                else if(res.status == 'r02'){
                    res.message.forEach(e =>{
                        toastr.error(e, 'Thao tác chỉ thành công một với một số tài khoản hợp lệ');
                    });
                }
                else{
                    @foreach ($errors->all() as $error)
                        toastr.error('{{$error }}', 'Lỗi nhập dữ liệu!', {timeOut : 0, extendedTimeOut: 0});
                    @endforeach
                }
            }
        });
    }

    {{--Loại bỏ thành viên khỏi vai trò--}}
    function removeMemberToAchievement(id_achievement, name_achievement) {
        var url = '{{route('achievement/api/remove_member',['id'=> ':slug'])}}';
        url = url.replace(':slug', id_achievement);
        var user_id =
            $("input[name='user_id[]']:checked")
                .map(function () {
                    return $(this).val();
                })
                .get();
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                user_id: user_id,
                aa_id: id_achievement
            },
            success: function (res) {
                {{--Gọi lại danh sách các thành viên của vai trò--}}
                getListUserForAchievement(id_achievement, name_achievement);
                if(res.status == 'r00'){
                    toastr.success('Xóa thành công', 'Thao tác thành công');
                }
            }
        });
    }
</script>