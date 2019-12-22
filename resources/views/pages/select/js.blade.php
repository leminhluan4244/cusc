<script>
    {{--Nạp dữ liệu vào bảng thêm--}}
    function getListCycle() {
        $.ajax({
            type: 'GET',
            {{--CycleApiController@index--}}
            url: '{{route('cycle/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#create_cs_cy").innerHTML = '';
                $(".ui-selectmenu-text").text('Chọn một chu kỳ');
                htmlTable = '';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<option value="'+element.cy_id+'" data-class="la la-paper-plane">'+element.cy_name +' - '+element.cy_long+'</option>'
                });
                $("#create_cs_cy").html(htmlTable);
                $('#addSelectModel').modal('show');
            }
        });
    }
    {{--Đưa dữ liệu vào bảng chỉnh sửa--}}
    function getListUpdate(cs_id,cy_id, name, begin, end) {
        $.ajax({
            type: 'GET',
            {{--CycleApiController@index--}}
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
    {{--//Đưa dữ liệu vào controll điều hướng thao tác--}}
    function getControl(cs_id,cy_id, name, begin, end) {
        $("#ctrlUpdate").on("click", function () {
            getListUpdate(cs_id,cy_id, name, begin, end);
        });
        var urlHide = '{{route('select/hide',['id'=>':slug'])}}';
        urlHide = urlHide.replace(':slug', cs_id);
        $("#ctrlLogicDelete").on("click",function () {
            logicDelete(function() {window.location.href = urlHide})
        });
        var urlRemove = '{{route('select/remove',['id'=>':slug'])}}';
        urlRemove = urlRemove.replace(':slug', cs_id);
        $("#ctrlPhysicalDelete").on("click",function () {
            physicalDelete(function() {window.location.href = urlRemove},'Các giá trị chu kỳ thuộc mục này, cùng các hoạt động cộng điểm liên quan sẽ bị xóa')
        });
        $('#controlModel').modal('show');
    }
</script>