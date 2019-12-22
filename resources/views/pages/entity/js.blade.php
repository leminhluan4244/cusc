{{--JS for cycle--}}
<script>

    {{--Đưa dữ liệu vào modal chỉnh sửa chu kỳ--}}
    function getbyId(id, name, long){
        document.getElementById("cy_id_update").value = id;
        document.getElementById("cy_name_update").value = name;
        document.getElementById("cy_long_update").value = long;
        $('#updateCycleModel').modal('show');
    }

</script>


{{--JS for select--}}
<script>

    {{--Nạp dữ liệu vào select option chu kỳ modal thêm--}}
    function CreateSelectgetListCycle() {
        $.ajax({
            type: 'GET',
            url: '{{route('cycle/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#create_cs_cy").innerHTML = '';
                $(".ui-selectmenu-text").text('Chọn một chu kỳ');
                htmlTable = '<option disabled selected value="default" data-class="ft-unlock">Chọn một chu kỳ</option>';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<option value="'+element.cy_id+'" data-class="la la-paper-plane">'+element.cy_name +' - '+element.cy_long+'</option>'
                });
                $("#create_cs_cy").html(htmlTable);
                $('#addSelectModel').modal('show');
            }
        });
    }

    {{--Nạp dữ liệu vào select option chu kỳ modal sửa--}}
    function UpdateSelectgetListCycle(cs_id,cy_id, name, begin, end) {
        $.ajax({
            type: 'GET',
            url: '{{route('cycle/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#update_cs_cy").innerHTML = '';
                htmlTable = '';
                chitiet.forEach(function (element) {
                    if(cy_id==element.cy_id){
                        $(".ui-selectmenu-text").text(element.cy_name);
                        htmlTable = htmlTable +
                            '<option value="'+element.cy_id+'" selected>'+element.cy_name +' - '+element.cy_long+'</option>'
                    }

                    else
                        htmlTable = htmlTable +
                            '<option value="'+element.cy_id+'">'+element.cy_name +' - '+element.cy_long+'</option>'
                });
                $("#update_cs_cy").html(htmlTable);
            }
        });
        document.getElementById("cs_id_update").value = cs_id;
        document.getElementById("cs_name_update").value = name;
        document.getElementById("cs_begin_update").value = begin;
        document.getElementById("cs_end_update").value = end;
        document.getElementById("update_cs_cy").value = cy_id;
        $('#updateSelectModel').modal('show');

    }

</script>

{{--JS for entity--}}
<script>

    {{--Phần thực hiện thêm bộ giá trị--}}
    {{--Hàm tổng--}}
    function CreateEntity(){
        {{--Gọi đến hàm nạp dữ liệu cho select--}}
        CreateEntitygetListCycle();
        $('#addModel').modal('show');
    }

    {{--Nạp dữ liệu vào select option chu kỳ modal thêm--}}
    function CreateEntitygetListCycle() {
        $.ajax({
            type: 'GET',
            url: '{{route('cycle/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#create_ec_cy").innerHTML = '';
                $(".ui-selectmenu-text").text('Chọn một chu kỳ');
                htmlTable = '<option disabled selected value="default" data-class="ft-unlock">Chọn một chu kỳ</option>';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<option value="'+element.cy_id+'" data-class="la la-paper-plane" class="ui-menu-item ui-menu-item-wrapper">'+element.cy_name +' - '+element.cy_long+'</option>'
                });
                $("#create_ec_cy").html(htmlTable);
            }
        });
    }

    {{--Nạp dữ liệu vào select option bộ chọn chu kỳ modal thêm khi thay đổi giá trị chu kỳ trong select option--}}
    function CreategetListSelect(id_default = "") {
        var id = $("#create_ec_cy").val();
        var url = '{{route('select/api/search_cy',['id'=> ':slug'])}}';
        url = url.replace(':slug', id);
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#group_radio").innerHTML = '';
                htmlTable = '';
                if(chitiet.length==0) htmlTable = 'Danh sách rỗng';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<input type="radio" name="cs_id" id="'+element.cs_id+'" value="'+element.cs_id+'" required><label for="'+element.cs_id+'">'+element.cs_name+'</label>';
                });
                $("#group_radio").html(htmlTable);
            }
        });
    }

    {{--Phần thực hiện sửa bộ giá trị--}}
    {{--Hàm tổng--}}
    function UpdateEntity(id, name){
        $('#name').text('Cập nhật: '+ name);
        var url = '{{route('entity/api/search',['id'=> ':slug'])}}';
        url = url.replace(':slug', id);
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {

                chitiet = res.data;
                // nạp các giá trị lên trên modal
                document.getElementById("ec_id_update").value = chitiet.ec_id;
                document.getElementById("ec_name_update").value = chitiet.ec_name;
                document.getElementById("ec_begin_update").value = chitiet.ec_begin;
                document.getElementById("ec_end_update").value = chitiet.ec_end;
                // Gọi đến hàm nạp dữ liệu cho select
                UpdateEntitygetListCycle(chitiet.cy_id,chitiet.cs_id);
                $('#updateModel').modal('show');
            }
        });
    }

    {{--Nạp dữ liệu vào select option chu kỳ modal sửa--}}
    function UpdateEntitygetListCycle(id_cycle_default,id_select_default) {
        $.ajax({
            type: 'GET',
            url: '{{route('cycle/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#update_ec_cy").innerHTML = '';
                $(".ui-selectmenu-text").text('Chọn một chu kỳ');
                htmlTable = '<option disabled selected value="default" data-class="ft-unlock">Chọn một chu kỳ</option>';
                chitiet.forEach(function (element) {
                    if(id_cycle_default==element.cy_id){
                        htmlTable = htmlTable +
                            '<option selected value="'+element.cy_id+'" data-class="la la-paper-plane" class="ui-menu-item ui-menu-item-wrapper">'+element.cy_name +' - '+element.cy_long+'</option>'

                    }
                    else{
                        htmlTable = htmlTable +
                            '<option value="'+element.cy_id+'" data-class="la la-paper-plane" class="ui-menu-item ui-menu-item-wrapper">'+element.cy_name +' - '+element.cy_long+'</option>'
                    }
                });
                getListSelect(id_cycle_default,id_select_default);
                $("#update_ec_cy").html(htmlTable);
            }
        });
    }

    {{--Nạp dữ liệu vào select option bộ chọn chu kỳ modal sửa khi thay đổi giá trị chu kỳ trong select option--}}
    function getListSelect(id_cycle_default,id_select_default) {
        var id;
        var id_cs;
        if(id_cycle_default=='default'){
            id = $("#update_ec_cy").val();
            //tim kiem id truoc do
            id_cs = sessionStorage[$("#ec_id_update").val()];

        }
        else{
            id= id_cycle_default;
            //Khong co thì lưu vào session
            if(id_cs=='default'){
                //Mac dinh thi lay ra tu session
                id_cs = sessionStorage[$("#ec_id_update").val()];
            }
            else{
                //Co thi luu vao session
                id_cs = id_select_default;
                sessionStorage.setItem($("#ec_id_update").val(), id_cs);
            }
        }

        var url = '{{route('select/api/search_cy',['id'=> ':slug'])}}';
        url = url.replace(':slug', id);
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#group_radio_update").innerHTML = '';
                htmlTable = '';
                chitiet.forEach(function (element) {
                    if(id_cs==element.cs_id){
                        htmlTable = htmlTable +
                            '<input checked type="radio" name="cs_id" id="'+element.cs_id+'" value="'+element.cs_id+'" required><label for="'+element.cs_id+'">'+element.cs_name+'</label>';
                    }
                    else{
                        htmlTable = htmlTable +
                            '<input type="radio" name="cs_id" id="'+element.cs_id+'" value="'+element.cs_id+'" required><label for="'+element.cs_id+'">'+element.cs_name+'</label>';
                    }

                });
                $("#group_radio_update").html(htmlTable);
            }
        });
    }

    {{--Lấy ra chu kỳ thích hợp đẩy vào danh sách chu kỳ có thể chọn làm mặc định--}}
    {{--success--}}
    function getAvailableNextEntity(id_entity){
        var url = '{{route('entity/api/get/next')}}';
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                ec_id : id_entity,
            },
            success: function (res) {
                if(res.status == 'r00'){
                    var chitiet = res.data;
                    $('#next_ec_success').innerHTML = '';
                    htmlTable = '<option disabled selected value="default" data-class="ft-unlock">Chọn chu kỳ mặc định tiếp theo cho chu kỳ này</option>';
                    chitiet.forEach(function (element) {
                        htmlTable = htmlTable +
                            '<option value="'+element.ec_id+'" data-class="la la-paper-plane" class="ui-menu-item ui-menu-item-wrapper">'+element.ec_name +'</option>'
                    });
                    $("#next_ec_success").html(htmlTable);
                    $("#successIDEntity").val(id_entity);
                    $('#successModel').modal('show');
                }
                else {
                    res.message.foreach(function (element) {
                        toastr.error(element, 'Thao tác thất bại');
                    });

                }
            },
            error: function () {
                toastr.error('Lỗi kết nối', 'Thao tác thất bại');
            }
        });
    }

</script>