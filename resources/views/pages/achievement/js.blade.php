<script>
    {{--Hàm xóa tạm--}}
    function AchievementHide(id_achievement) {
        var url_ = '{{route('achievement/api/hide',['id'=> ':slug'])}}';
        url_ = url_.replace(':slug', id_achievement);
        $.ajax({
            type: 'GET',
            url: url_,
            data: {
                _token: '{{csrf_token()}}'
            },
            success: function (res) {
                if(res.status=='r00'){
                    $( "#key"+id_achievement ).remove();

                    //Chạy lại datatable
                    var table = $('#table_index').DataTable();
                    table.destroy();
                    //Kiểm tra bảng , cột nào có vai trò trùng với nó thì xóa hết
                    $('.'+id_achievement).remove();
                    $('#table_index').DataTable();
                    toastr.success('', 'Thao tác thành công');

                }
                else{

                        toastr.error('', 'Thao tác thất bại');

                }

            }

        })
    }

    {{--Hàm xóa vĩnh viễn--}}
    function AchievementRemove(id_achievement) {
        var url_ = '{{route('achievement/api/remove',['id'=> ':slug'])}}';
        url_ = url_.replace(':slug', id_achievement);
        $.ajax({
            type: 'GET',
            url: url_,
            data: {
                _token: '{{csrf_token()}}'
            },
            success: function (res) {
                if(res.status=='r00') {
                    $( "#key"+id_achievement ).remove();
                    //Chạy lại datatable
                    var table = $('#table_index').DataTable();
                    table.destroy();
                    //Kiểm tra bảng , cột nào có vai trò trùng với nó thì xóa hết
                    $('.'+id_achievement).remove();
                    $('#table_index').DataTable();
                    toastr.success('', 'Thao tác thành công');
                }
                else{

                        toastr.error('', 'Thao tác thất bại');

                }

            }

        })
    }
</script>

{{--Các hàm gọi tới để hỗ trợ hàm thêm--}}
<script>
    {{--Lấy danh sách chuyên mục--}}
    function CreateActiveGetCategory() {
        {{--CategoryApiController@list--}}
        var url_category = '{{route('category/api/list')}}';
        $.ajax({
            type: 'GET',
            url: url_category,
            data: {
                _token: '{{csrf_token()}}'
            },
            success: function (res) {
                chitiet = res.data;
                $("#c_id_create").innerHTML = '';
                $(".ui-selectmenu-text").text('Chọn một mục lớn');
                htmlTable = '<option disabled selected value="default" data-class="ft-unlock">Chọn một mục lớn</option>';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<option value="'+element.c_id+'" data-class="la la-paper-plane" class="ui-menu-item ui-menu-item-wrapper">'+element.c_item +' - '+element.c_name+'</option>'
                });
                $("#c_id_create").html(htmlTable);
            }
        });
        $('#addAchievementModel').modal('show');
    }

    {{--Lấy danh sách con khi chọn một mục cha từ form thêm--}}
    function CreateActiveGetChildByCategory() {
        var id_category = $("#c_id_create").val();
        {{--CategoryApiController@search_full_child--}}
        var url_child = '{{route('category/api/search_full',['id'=> ':slug'])}}';
        url_child = url_child.replace(':slug', id_category);
        $.ajax({
            type: 'GET',
            url: url_child,
            data: {
                _token: '{{csrf_token()}}'
            },
            success: function (res) {
                chitiet = res.data.child;
                $("#group_child_create").innerHTML = '';
                htmlTable = '';
                if(chitiet.length==0){
                    htmlTable =
                        `<div class="row">
                            <div class="col-12">
                                <div class="card bg-white m-1 border">
                                    <div class="card-content ">
                                        <div class="card-body">
                                            <div class="media d-flex">
                                                <div class="media-body text-info text-left">
                                                    <h6 class="font-weight-bold">Dữ liệu đang rỗng</h6>
                                                    <span>Chọn thêm giá trị mục con ở phần quản lý cấu trúc để tạo mới dữ liệu</span>
                                                </div>
                                                <div class="align-self-center">
                                                    <i class="ft-search text-white bg-info float-right background-round"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>`;
                }
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<input type="radio" name="cc_id" id="'+element.cc_id+'" value="'+element.cc_id+'" required><label for="'+element.cc_id+'">'+element.cc_item +' - '+element.cc_name+'</label>';
                });
                $("#group_child_create").html(htmlTable);
            }
        })
    }
</script>
{{--Các hàm gọi tới để hỗ trợ hàm sửa--}}
<script>
    {{--Lấy danh sách chuyên mục--}}
    function UpdateActiveAchievementGetCategory(id_category, id_child) {
        //kéo danh sách các mục lớn
        var url_category = '{{route('category/api/list')}}';
        $.ajax({
            type: 'GET',
            url: url_category,
            data: {
                _token: '{{csrf_token()}}'
            },
            success: function (res) {
                var htmlTable = '';
                chitiet = res.data;
                $("#c_id_update").innerHTML = '';
                chitiet.forEach(function (element) {
                    var check = '';
                    if(element.c_id==id_category){
                        $(".ui-selectmenu-text").text('Chọn một mục lớn');
                        check = 'selected';
                    }
                    htmlTable = htmlTable +
                        '<option value="'+element.c_id+'" '+check+' data-class="la la-paper-plane" class="ui-menu-item ui-menu-item-wrapper">'+element.c_item +' - '+element.c_name+'</option>'
                });
                UpdateActiveAchievementGetChildByCategory(id_category,id_child);
                $("#c_id_update").html(htmlTable);


            }
        });
    }
    {{--Lấy danh sách con khi chọn một mục cha từ form thêm--}}
    function UpdateActiveAchievementGetChildByCategory(id_category_default,id_child_default) {
        //Lấy và nạp lai giá trị
        var id;
        var id_cc;
        if(id_category_default=='default'){
            id = $("#c_id_update").val();
            //tim kiem id truoc do
            id_cc = sessionStorage[$("#cc_id_update").val()];

        }
        else{
            id= id_category_default;
            //Khong co thì lưu vào session
            if(id_cc=='default'){
                //Mac dinh thi lay ra tu session
                id_cc = sessionStorage[$("#cc_id_update").val()];
            }
            else{
                //Co thi luu vao session
                id_cc = id_child_default;
                sessionStorage.setItem($("#cc_id_update").val(), id_cc);
            }
        }
        var url_child = '{{route('category/api/search_full',['id'=> ':slug'])}}';
        url_child = url_child.replace(':slug', id);
        $.ajax({
            type: 'GET',
            url: url_child,
            data: {
                _token: '{{csrf_token()}}'
            },
            success: function (res) {
                chitiet = res.data.child;
                $("#group_child_update").innerHTML = '';
                htmlTable = '';
                if(chitiet.length==0) htmlTable = 'Danh sách rỗng';
                chitiet.forEach(function (element) {
                    var check = '';
                    if(id_cc==element.cc_id){
                        check = 'checked';
                    }
                    else{
                        check = '';
                    }
                    htmlTable = htmlTable +
                        '<input type="radio" '+check+' name="cc_id" id="'+element.cc_id+'" value="'+element.cc_id+'" required><label for="'+element.cc_id+'">'+element.cc_item +' - '+element.cc_name+'</label>';
                });
                $("#group_child_update").html(htmlTable);
            }
        });
    }
    {{--Thao tác trước khi kéo api--}}
    function UpdateActiveAchievement(id) {
        //Kéo dữ liệu về từ id
        var url_achievement = '{{route('achievement/api/search',['id'=> ':slug'])}}';
        url_achievement = url_achievement.replace(':slug', id);
        $.ajax({
            type: 'GET',
            url: url_achievement,
            data: {
                _token: '{{csrf_token()}}'
            },
            success: function (res) {
                if(res.status == 'r00'){
                    console.log('dfasdfas');
                    chitiet = res.data;
                    //Nạp các thành phần
                    $('#a_id_update').val(chitiet.a_id);
                    $('#aa_id_update').val(chitiet.aa_id);
                    $('#aa_name_update').val(chitiet.aa_name);
                    $('#aa_scores_update').val(chitiet.aa_scores);
                    //kéo mục lớn
                    UpdateActiveAchievementGetCategory(chitiet.c_id,chitiet.cc_id);
                    $('#updateAchievementModel').modal('show');
                }
                else{
                    res.message.forEach(e =>{
                        toastr.error(e, 'Thao tác thất bại');
                    });
                }
            }
        });
    }
</script>