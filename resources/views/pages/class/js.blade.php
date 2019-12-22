<script>
    /**
     * Gọi form thêm YES
     */
    function getListMajorAndSchoolYear() {
        {{--Lấy danh sách ngành--}}
        $.ajax({
            type: 'GET',
            {{--MajorsApiController@index--}}
            url: '{{route('majors/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                htmlTable = '';
                $(".group_major_create").innerHTML = '';
                if(chitiet.length==0) htmlTable = '<h6 class="danger">Danh sách rỗng</h6>';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<div class="col-12 "><input type="radio" name="m_id" id="'+element.m_id+'" value="'+element.m_id+'" required><label for="'+element.m_id+'"><i class="la la-graduation-cap yellow mr-1"></i> '+element.m_name+'</label></div>';
                });
                $(".group_major_create").html(htmlTable);
            }
        });

        {{--Lấy danh sách niên khóa--}}
        $.ajax({
            type: 'GET',
            {{--SchoolYearApiController@index--}}
            url: '{{route('year/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                htmlTable = '';
                $(".group_school_year_create").innerHTML = '';
                if(chitiet.length==0) htmlTable = '<h6 class="danger">Danh sách rỗng</h6>';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<div class="col-12 "><input type="radio" name="sy_id" id="'+element.sy_id+'" value="'+element.sy_id+'" required><label for="'+element.sy_id+'"><i class="la la-hourglass info mr-1"></i> '+element.sy_name+'</label></div>';
                });
                $(".group_school_year_create").html(htmlTable);
            }
        });
        {{--Lấy danh sách cố vấn--}}
        var url_role = '{{route('users/api',['id'=> ':slug'])}}';
        url_role = url_role.replace(':slug', '0826eaf8086b01749bf7ff65742a200c');
        $.ajax({
            type: 'GET',
            url: url_role,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data.list;
                htmlTable = '';
                $(".group_employee_create").innerHTML = '';
                if(chitiet.length==0) htmlTable = '<h6 class="danger">Danh sách rỗng</h6>';
                chitiet.forEach(function (element) {
                    htmlTable = htmlTable +
                        '<div class="col-12 "><input type="radio" name="u_manager_id" id="'+element.id+'" value="'+element.id+'" required><label for="'+element.id+'"><i class="la la-user danger mr-1"></i> '+element.name+'</label></div>';
                });
                $(".group_employee_create").html(htmlTable);
            }
        });
        //Bật model
        $('#addClassModel').modal('show');
    }

    /**
     * Gọi form cập nhật YES
     * @param id
     * @constructor
     */
    function UpdateGet(id) {
        //Lấy thông tin lớp
        var url_class = '{{route('class/api/search',['id'=> ':slug'])}}';
        url_class = url_class.replace(':slug', id);
        $.ajax({
            type: 'GET',
            url: url_class,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $("#cl_name_update").val(chitiet.cl_name);
                $("#cl_id_update").val(chitiet.cl_id);
                $("#cl_code_update").val(chitiet.cl_code);
                updateChangeModal(chitiet.m_id,chitiet.sy_id,chitiet.u_manager_id);
            }
        });

    }

    /**
     * Kéo dữ liệu nạp lại form cập nhật YES
     * @param m_id
     * @param sy_id
     * @param u_manager_id
     */
    function updateChangeModal(m_id,sy_id,u_manager_id){
        //Lấy danh sách ngành
        $.ajax({
            type: 'GET',
            url: '{{route('majors/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                htmlTable = '';
                $(".group_major_update").innerHTML = '';
                if(chitiet.length==0) htmlTable = '<h6 class="danger">Danh sách rỗng</h6>';
                chitiet.forEach(function (element) {
                    if(m_id==element.m_id)
                        htmlTable = htmlTable +
                            '<div class="col-12 "><input checked type="radio" name="m_id" id="'+element.m_id+'" value="'+element.m_id+'" required><label for="'+element.m_id+'"><i class="la la-graduation-cap yellow mr-1"></i> '+element.m_name+'</label></div>';
                    else
                        htmlTable = htmlTable +
                            '<div class="col-12 "><input type="radio" name="m_id" id="'+element.m_id+'" value="'+element.m_id+'" required><label for="'+element.m_id+'"><i class="la la-graduation-cap yellow mr-1"></i> '+element.m_name+'</label></div>';
                });
                $(".group_major_update").html(htmlTable);
            }
        });
        //Lấy danh sách niên khóa
        $.ajax({
            type: 'GET',
            url: '{{route('year/api')}}',
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                htmlTable = '';
                $(".group_school_year_update").innerHTML = '';
                if(chitiet.length==0) htmlTable = '<h6 class="danger">Danh sách rỗng</h6>';
                chitiet.forEach(function (element) {
                    if(sy_id==element.sy_id)
                        htmlTable = htmlTable +
                            '<div class="col-12 "><input type="radio" checked name="sy_id" id="'+element.sy_id+'" value="'+element.sy_id+'" required><label for="'+element.sy_id+'"><i class="la la-hourglass info mr-1"></i> '+element.sy_name+'</label></div>';
                    else htmlTable = htmlTable +
                        '<div class="col-12 "><input type="radio" name="sy_id" id="'+element.sy_id+'" value="'+element.sy_id+'" required><label for="'+element.sy_id+'"><i class="la la-hourglass info mr-1"></i> '+element.sy_name+'</label></div>';
                });
                $(".group_school_year_update").html(htmlTable);
            }
        });
        //Lấy danh sách cố vấn
        var url_role = '{{route('users/api',['id'=> ':slug'])}}';
        url_role = url_role.replace(':slug', '0826eaf8086b01749bf7ff65742a200c');
        $.ajax({
            type: 'GET',
            url: url_role,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data.list;
                htmlTable = '';
                $(".group_employee_update").innerHTML = '';
                if(chitiet.length==0) htmlTable = '<h6 class="danger">Danh sách rỗng</h6>';
                chitiet.forEach(function (element) {
                    if(u_manager_id==element.id){
                        htmlTable = htmlTable +
                            '<div class="col-12 "><input type="radio" checked name="u_manager_id" id="'+element.id+'" value="'+element.id+'" required><label for="'+element.id+'"><i class="la la-user danger mr-1"></i> '+element.name+'</label></div>';
                    }
                    else htmlTable = htmlTable +
                        '<div class="col-12 "><input type="radio" name="u_manager_id" id="'+element.id+'" value="'+element.id+'" required><label for="'+element.id+'"><i class="la la-user danger mr-1"></i> '+element.name+'</label></div>';
                });
                $(".group_employee_update").html(htmlTable);
            }
        });
        //Bật form sửa
        $('#updateClassModel').modal('show');
    }

    /**
     * Đưa dữ liệu vào controll điều hướng thao tác YES
     * @param cl_id : Mã lớp
     * @param cl_code : ID lớp
     * @param cl_name : tên lớp
     * @param cusc_id : id CUSC user cố vấn
     * @param name : tên cố vấn
     * @param m_code : id ngành
     * @param m_name : tên ngành
     * @param sy_name : tên niên khóa
     */
    function getControl(cl_id,cl_code,cl_name,cusc_id,name,m_code,m_name,sy_name) {
        $('#ctrl_name').text(cl_name);
        $('#ctrl_cl_id').text(cl_code);
        $('#teacher_id').text(name);
        $('#teacher_cusc_id').text(cusc_id);
        $('#ctrl_m_name').text(m_name);
        $('#ctrl_m_code').text(m_code);
        $('#ctrl_sy_name').text(sy_name);
        $("#ctrlUpdate").on("click", function () {
            UpdateGet(cl_id);
        });
        //Ẩn lớp
        var urlHide = '{{route('class/hide',['id'=>':slug'])}}';
        urlHide = urlHide.replace(':slug', cl_id);
        $("#ctrlLogicDelete").on("click",function () {
            logicDelete(function() {window.location.href = urlHide})
        });
        //Xóa lớp
        var urlRemove = '{{route('class/remove',['id'=>':slug'])}}';
        urlRemove = urlRemove.replace(':slug', cl_id);
        $("#ctrlPhysicalDelete").on("click",function () {
            physicalDelete(function() {window.location.href = urlRemove},'Sau khi xóa sẽ loại bỏ các liên kết với học viên thuộc lớp này')
        });
        //Hiển thị form thông tin
        $('#controlModel').modal('show');
    }
</script>