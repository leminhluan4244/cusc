<script>
    //Đưa dữ liệu vào bảng chỉnh sửa
    function getbyId(id, name, long){
        document.getElementById("cy_id_update").value = id;
        document.getElementById("cy_name_update").value = name;
        document.getElementById("cy_long_update").value = long;
        $('#updateCycleModel').modal('show');
    }
    //Đưa dữ liệu vào controll điều hướng thao tác
    function getControl(id,name, long) {
        $("#ctrlUpdate").on("click", function () {
            getbyId(id,name, long);
        });
        var urlHide = '{{route('cycle/hide',['id'=>':slug'])}}';
        urlHide = urlHide.replace(':slug', id);
        $("#ctrlLogicDelete").on("click",function () {
            logicDelete(function() {window.location.href = urlHide})
        });
        var urlRemove = '{{route('cycle/remove',['id'=>':slug'])}}';
        urlRemove = urlRemove.replace(':slug', id);
        $("#ctrlPhysicalDelete").on("click",function () {
            physicalDelete(function() {window.location.href = urlRemove},'Bộ chọn, bộ giá trị và tất cả các mục điểm liên quan tới chu kỳ này sẽ xóa, đây là thao tác quan trọng hãy cẩn trọng trước khi thực hiện')
        });
        $('#controlModel').modal('show');
    }
</script>