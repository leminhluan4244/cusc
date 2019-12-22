{{--Xử lý cho form thêm--}}
<script>
    function CategoryChildGetListCycle() {
        //Lấy danh sách chu kỳ
        $.ajax({
            type: 'GET',
            url: '{{route('cycle/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                var htmlTable = '';
                $("#category_create_group_cycle_radio").innerHTML = '';
                htmlTable = htmlTable + '<option value="" selected disabled>Chọn một chu kỳ</option>';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable + '<option value="'+element.cy_id+'">'+element.cy_name+'</option>';
                });
                $("#category_create_group_cycle_radio").html(htmlTable);
                $("#category_create_group_cycle_radio").prop("multiple", "");

            }
        });
    }
    //Lấy danh sách phân quyền
    function CategoryChildGetListRoles() {
        $.ajax({
            type: 'GET',
            url: '{{route('roles/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                var htmlTable = '';
                $("#category_create_group_role_checkbox").innerHTML = '';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable + '<option value="'+element.r_id+'">'+element.r_name+'</option>';
                });
                $("#category_create_group_role_checkbox").html(htmlTable);
            }
        });
    }
    //Nạp mặc định
    function CategoryChildGetForm(id_category, name_category){
        $('#add_child_title').html('Nhập thông tin cho mục con của: '+name_category);
        $('#c_id_create').val(id_category);
        CategoryChildGetListCycle();
        CategoryChildGetListRoles();
        $('#addChildModel').modal('show');
    }
    //Ẩn hiện khi ấn nút tối đa
    function ChildChangeHideCreate() {

        if(!$('#max_scores_cycle_create').is(':checked')){
            $('#cc_max_scores_cycle_create').css("display", "block");

        } else {
            $('#cc_max_scores_cycle_create').css("display", "none");

        }
    }
</script>

{{--Xử lý form sửa--}}

<script>
    function CategoryChildUpdateGetListCycle(id) {
        //Lấy danh sách chu kỳ
        $.ajax({
            type: 'GET',
            url: '{{route('cycle/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                var htmlTable = '';
                $("#category_update_group_cycle_radio").innerHTML = '';
                chitiet.forEach(function (element) {
                    if(id == element.cy_id)
                        htmlTable = htmlTable + '<option value="'+element.cy_id+'" selected>'+element.cy_name+'</option>';
                    else htmlTable = htmlTable + '<option value="'+element.cy_id+'">'+element.cy_name+'</option>';
                });
                $("#category_update_group_cycle_radio").html(htmlTable);
                $("#category_update_group_cycle_radio").prop("multiple", "");
            }
        });
    }
    //Lấy danh sách phân quyền
    function CategoryChildUpdateGetListRoles(roles) {
        $.ajax({
            type: 'GET',
            url: '{{route('roles/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                var htmlTable = '';
                $("#category_update_group_role_checkbox").innerHTML = '';
                chitiet.forEach(function (element) {
                    var found = roles.find(function(element2) {
                        return element2.r_id == element.r_id;
                    });
                    if(found!=undefined)
                        htmlTable = htmlTable + '<option value="'+element.r_id+'" selected>'+element.r_name+'</option>';
                    else htmlTable = htmlTable + '<option value="'+element.r_id+'">'+element.r_name+'</option>';
                });
                $("#category_update_group_role_checkbox").html(htmlTable);
            }
        });
    }
    //Lấy danh sách mục cha
    function CategoryChildUpdateGetListCategory(id) {
        //Lấy danh sách mục cha
        $.ajax({
            type: 'GET',
            url: '{{route('category/api/list')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                var htmlTable = '';
                $("#c_id_update_child").innerHTML = '';
                chitiet.forEach(function (element) {
                    if(id == element.c_id){
                        $(".ui-selectmenu-text").text(element.c_name);
                        check= 'selected';
                    }
                    else check = '';
                    htmlTable = htmlTable +
                        '<option value="'+element.c_id+'" '+check+'>'+element.c_name +'</option>';
                });
                $("#c_id_update_child").html(htmlTable);
            }
        });
    }
    //Nạp mặc định
    function CategoryChildGetUpdateForm(id_child){
        //Lấy thông tin mục con về
        var url_child = '{{route('child/api/search',['id'=> ':slug'])}}';
        url_child = url_child.replace(':slug', id_child);
        $.ajax({
            type: 'GET',
            url: url_child,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $('#update_child_title').html('Chỉnh sửa mục con: '+ chitiet.cc_name);
                $('#cc_id_update').val(chitiet.cc_id);
                $('#cc_item_update').val(chitiet.cc_item);
                $('#cc_name_update').val(chitiet.cc_name);
                $('#cc_max_scores_update').val(chitiet.cc_max_scores);
                $('#cc_max_amount_update').val(chitiet.cc_max_amount);


                if(chitiet.cc_max_scores_cycle==10000000){
                    $("#max_scores_cycle_update").prop("checked", true);
                    $('#cc_max_scores_cycle_update').val(0);
                    $('#cc_max_scores_cycle_update').css("display", "none");
                }
                else{
                    $("#max_scores_cycle_update").prop("checked", false);
                    $('#cc_max_scores_cycle_update').val(chitiet.cc_max_scores);
                    $('#cc_max_scores_cycle_update').css("display", "block");
                }

                CategoryChildUpdateGetListCategory(chitiet.c_id);
                CategoryChildUpdateGetListCycle(chitiet.cycle[0].cy_id);
                CategoryChildUpdateGetListRoles(chitiet.roles);

            }
        });
        $('#updateChildModel').modal('show');
    }
    //Ẩn hiện khi ấn nút tối đa
    function ChildChangeHideUpdate() {
        if(!$('#max_scores_cycle_update').is(':checked')){
            $('#cc_max_scores_cycle_update').css("display", "block");

        } else {
            $('#cc_max_scores_cycle_update').css("display", "none");
        }
    }
</script>
<script>
    //Xóa tạm
    function hideChildCategory(id) {
        var urlHide = '{{route('child/hide',['id'=>':slug'])}}';
        urlHide = urlHide.replace(':slug', id);
        logicDelete(function() {window.location.href = urlHide})
    }
    //Xóa vĩnh diễn
    function removeChildCategory(id) {
        var urlRemove = '{{route('child/remove',['id'=>':slug'])}}';
        urlRemove = urlRemove.replace(':slug', id);
        physicalDelete(function() {window.location.href = urlRemove},'Sau khi xóa mục này, các khoản cộng điểm liên quan sẽ tự hủy')
    }
    //Hiển thị chi tiết
    function infoChild(id) {
        $('#infoChildModel').modal('show');
    }
</script>