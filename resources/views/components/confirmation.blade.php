<script>
    function logicDelete(successFunction){
        swal({
            title: "Mục này sẽ bị xóa tạm ?",
            text: "Sau khi xóa tạm bạn có thể khôi phục từ Trash hoặc tiến hành xóa vĩnh viễn !",
            type: "warning",
            className: "logicDelete",
            buttons: {
                cancel: {
                    text: "Hủy",
                        value: null,
                        visible: true,
                        className: "bg-gray",
                },
                confirm: {
                    text: "Đồng ý",
                        value: true,
                        visible: true,
                        className: "bg-warning",
                }
            },
        })
        .then((isConfirm ) => {
            if (isConfirm) {
                successFunction()
            }
        });
    }

    function physicalDelete(successFunction,text){
        swal({
            title: "Xóa vĩnh viễn mục này và các mục liên quan ?",
            text: text,
            type: "warning",
            className: "physicalDelete",
            buttons: {
                cancel: {
                    text: "Hủy",
                    value: null,
                    visible: true,
                    className: "bg-gray",
                },
                confirm: {
                    text: "Đồng ý",
                    value: true,
                    visible: true,
                    className: "bg-danger",
                }
            },
        })
        .then((isConfirm ) => {
            if (isConfirm) {
                successFunction()
            }
        });
    }

    function successSelect(successFunction,text){
        swal({
            title: "Xác nhận thao tác ?",
            text: text,
            type: "warning",
            className: "successAction",
            buttons: {
                cancel: {
                    text: "Hủy",
                    value: null,
                    visible: true,
                    className: "bg-gray",
                },
                confirm: {
                    text: "Đồng ý",
                    value: true,
                    visible: true,
                    className: "bg-info",
                }
            },
        })
        .then((isConfirm ) => {
            if (isConfirm) {
                successFunction()
            }
        });
    }
</script>