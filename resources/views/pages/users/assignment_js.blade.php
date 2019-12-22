<script>
    /**
     * Lấy ra danh sách user không thuộc phân công của tài khoản này YES
     * @param id
     */
    function getListNonClassForUser(id) {
        {{--AssignmentApiController@non_member--}}
        var url = '{{route('users/api/nonassignment',['id'=> ':slug'])}}';
        url = url.replace(':slug', id);
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                //Nếu có dữ liệu
                if(res.status == 'r00'){
                    var chitiet = res.data;
                    $("#class_item_tbody").innerHTML = '';
                    htmlTable = '';
                    chitiet.forEach(function (element) {
                        htmlTable +=
                            '<tr role="row" class="odd">' +
                            '<td class="sorting_1">' +
                            '<label class="nng">' + element.cl_code +
                            '<input type="checkbox" name="cl_id[]" id="' + element.cl_id + '" value="' + element.cl_id + '">' +
                            '<span class="checkmark"></span>' +
                            '</label>' +
                            '</td>' +
                            '<td>' + element.cl_name + '</td>' +
                            '<td>' + element.name + '</td>' +
                            '<td>' + element.sy_name + '</td>' +
                            '</tr>';
                    });
                    $("#assignment_save_group").innerHTML = '';
                    $("#assignment_save_group").html(
                        '<button class="btn btn-success mr-1 round box-shadow-3" onclick="addClassToAsignMent(' + id + ')">' +
                        '<i class="la la-check white"></i> Lưu lại' +
                        '</button>');

                    $('.content-body').css({'height': 'fit-content'});
                    $('#assignment_list_class_table').css({'display': ''});
                    var table = $('#assignment_list_class_table').DataTable();
                    table.destroy();
                    $("#class_item_tbody").html(htmlTable);
                    $('#assignment_list_class_table').DataTable();
                    $('#emptyDataShowInfo').css({'display': 'none'});
                }
                //Nếu không có dữ liệu
                else{
                    res.message.forEach(element => {
                        toastr.error(element,'Không có dữ liệu');
                    });
                }
            }
        });
    }

    /**
     * Thêm vào danh sách các lớp cho phân công cán bộ YES
     * @param id
     */
    function addClassToAsignMent(id) {
        {{--AssignmentApiController@add_member--}}
        var url = '{{route('users/api/assignment/add',['id'=> ':slug'])}}';
        url = url.replace(':slug', id);
        var cl_id =
            $("input[name='cl_id[]']:checked")
                .map(function () {
                    return $(this).val();
                })
                .get();
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                cl_id: cl_id,
                u_id: id
            },
            success: function (res) {
                if(res.status != 'r00'){
                    res.message.forEach(element => {
                        toastr.error(element,'Không có dữ liệu');
                    });
                }
                getListClassForAssignment(id);
            }
        });
    }

    /**
     * Loại bỏ danh sách các lớp cho phân công cán bộ YES
     * @param id
     */
    function removeClassToAsignMent(id) {
        {{--AssignmentApiController@remove_member--}}
        var url = '{{route('users/api/assignment/remove',['id'=> ':slug'])}}';
        url = url.replace(':slug', id);
        var cl_id =
            $("input[name='cl_id[]']:checked")
                .map(function () {
                    return $(this).val();
                })
                .get();
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                cl_id: cl_id,
                u_id: id
            },
            success: function (res) {
                if(res.status != 'r00'){
                    res.message.forEach(element => {
                        toastr.error(element,'Không có dữ liệu');
                    });
                }
                getListClassForAssignment(id);
            }
        });
    }

    /***
     * Lấy lại danh sách các lớp thuộc phân quyền của một cán bộ được chấm YES
     * @param id
     */
    function getListClassForAssignment(id) {
        var url = '{{route('users/api/assignment',['id'=> ':slug'])}}';
        url = url.replace(':slug', id);
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                if(res.status = 'r00'){
                    if(res.data){
                        chitiet = res.data;
                        $("#class_item_tbody").innerHTML = '';
                        htmlTable = '';
                        chitiet.forEach(function (element) {
                            htmlTable +=
                                '<tr role="row" class="odd">' +
                                '<td class="sorting_1">' +
                                '<label class="nng">' + element.cl_code +
                                '<input type="checkbox" name="cl_id[]" id="' + element.cl_id + '" value="' + element.cl_id + '">' +
                                '<span class="checkmark checkmarkdel"></span>' +
                                '</label>' +
                                '</td>' +
                                '<td>' + element.cl_name + '</td>' +
                                '<td>' + element.name + '</td>' +
                                '<td>' + element.sy_name + '</td>' +
                                '</tr>';
                        });
                        $("#class_item_tbody").html(htmlTable);
                        $("#assignment_save_group").innerHTML = '';
                        $("#assignment_save_group").html(
                            '<button class="btn btn-info mr-1 round box-shadow-3" onclick="getListNonClassForUser(\'' + id + '\')">' +
                            '<i class="la la-plus"></i> Thêm lớp' +
                            '</button>' +
                            '<button class="btn btn-danger mr-1 round box-shadow-3" onclick="removeClassToAsignMent(\'' + id + '\')">' +
                            '<i class="la la-trash"></i> Xóa các mục đã chọn' +
                            '</button>'
                        );
                        $('.content-body').css({'height': 'fit-content'});
                        $('#assignment_list_class_table').css({'display': ''});
                        var table = $('#assignment_list_class_table').DataTable();
                        table.destroy();
                        $("#class_item_tbody").html(htmlTable);
                        $('#assignment_list_class_table').DataTable();
                        $('#emptyDataShowInfo').css({'display': 'none'});
                    }
                    else{
                        $('#assignment_list_class_table').css({'display': 'none'});
                        var table = $('#assignment_list_class_table').DataTable();
                        table.destroy();
                        $('#emptyDataShowInfo').css({'display': ''});
                    }

                }
                else {
                    res.message.forEach(element => {
                        toastr.error(element,'Lỗi input');
                    });
                }

            }
        });
    }

</script>