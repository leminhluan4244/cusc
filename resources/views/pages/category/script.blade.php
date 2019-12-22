<script>
    //Xử lý thêm
    function changeHideCreate() {

        if(!$('#max_scores_create').is(':checked')){
            console.log('a');
            $('#c_max_scores_create').css("display", "block");

        } else {
            $('#c_max_scores_create').css("display", "none");

        }
    }
    //Xử lý sửa
    function UpdateGet(id) {
        //lấy thông tin chi tiết
        var url_category = '{{route('category/api/search',['id'=> ':slug'])}}';
        url_category = url_category.replace(':slug', id);
        $.ajax({
            type: 'GET',
            url: url_category,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#c_id_update").val(chitiet.c_id);
                $("#c_item_update").val(chitiet.c_item);
                $("#c_name_update").val(chitiet.c_name);
                if(chitiet.c_type==1){
                    document.getElementById("c_type_3").checked = true;
                }
                else if(chitiet.c_type==0){
                    document.getElementById("c_type_4").checked = true;
                }

                if(chitiet.c_max_scores==10000000){
                    $("#max_scores_update").prop("checked", true);
                    $('#c_max_scores_update').val(0);
                    $('#c_max_scores_update').css("display", "none");
                }
                else{
                    $("#max_scores_update").prop("checked", false);
                    $('#c_max_scores_update').val(chitiet.c_max_scores);
                    $('#c_max_scores_update').css("display", "block");
                }

            }
        });
        $('#updateModel').modal('show');

    }
    function changeHideUpdate() {

        if(!$('#max_scores_update').is(':checked')){
            console.log('a');
            $('#c_max_scores_update').css("display", "block");

        } else {
            $('#c_max_scores_update').css("display", "none");

        }
    }
    //Xóa tạm
    function hide(id) {
        var urlHide = '{{route('category/hide',['id'=>':slug'])}}';
        urlHide = urlHide.replace(':slug', id);
        logicDelete(function() {window.location.href = urlHide})
    }
    //Xóa vĩnh diễn
    function remove(id) {
        var urlRemove = '{{route('category/remove',['id'=>':slug'])}}';
        urlRemove = urlRemove.replace(':slug', id);
        physicalDelete(function() {window.location.href = urlRemove},'Dữ liệu mục con và các khung điểm liên quan sẽ xóa, tuy nhiên điểm đã cộng sẽ được giữ nguyên')
    }
</script>