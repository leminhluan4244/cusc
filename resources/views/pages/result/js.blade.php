<script>
    /***
     * Thay đổi trạng thái ẩn hiện dựa theo id
     * @param id
     */
    function showHide(id) {
        if($('#'+id).css('display')=='none'){
            $('#'+id).show('slow');
        }
        else{
            $('#'+id).hide('slow');
        }
    }

    /***
     * Đến cuối trang
     */
    function goBottom() {
        $("html, body").animate({ scrollTop: $(document).height()-$(window).height() });
    }

    /***
     * Ẩn chi tiết điểm của một mục con
     */
    function clearPointChild() {
        $('#formPoint').hide();
    }

    /***
     * Kéo danh sách mục con và thêm vào view sau khi click mục lớn
     * @param id_category id mục cha
     * @param id_student id học viên
     */
    function getChildForCategory(id_category, id_student) {
        var url = '{{route('point/registration/api/full')}}';
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                c_id: id_category,
                u_id: id_student
            },
            success: function (res) {
                chitiet = res.data;
                if(typeof chitiet !== 'undefined' && chitiet.length > 0){
                    $("#childList").innerHTML = '';
                    html = '';
                    var i = 0;
                    chitiet.forEach(function(element) {
                        console.log(element.cycle);
                        html = html + `<div class="col-6 ">
                            <div class="card mb-1" >
                                <div class="card-content">
                                    <div class="card-body pt-0 pb-0 `+ (i % 2==0 ? `pr-0` : `pl-0`)+`" style="background: rgb(244, 245, 233);">
                                        <div class="media-list list-group">
                                            <div class="list-group-item media p-1  ">
                                                <span class="media-link" >
                                                    <h6 onclick="getChildAction('`+id_category+`','`+element.cc_id+`' , '`+id_student+`')" class="text-bold-600 m-0 mb-1 border-bottom nns-small-card cursor-pointer"><b>`+element.cc_item +`. `+element.cc_name+`</b>`+(element.select > 0 ? `<i class=" ft-star pl-1 yellow text-bold-600"></i><i class=" ft-star pl-1 yellow text-bold-600"></i><i class=" ft-star pl-1 yellow text-bold-600"></i>` : ``)+`
                                                    </h6>
                                                    <span class="media-body text-right text-center">
                                                        <span onclick="getChildInfo('`+id_category+`','`+element.cc_id+`' ,'`+id_student+`')" class="badge badge badge-info badge-pill mr-2 cursor-pointer">Chi tiết</span>
                                                        <span onclick="addPointShow('` + element.cc_name + `','` + element.cc_max_scores + `','` + element.cc_id + `','` + id_student + `') " class="badge badge badge-success badge-pill mr-2 cursor-pointer">Cộng điểm</span>
                                                        Chu kỳ:
                                                        <span class="badge badge badge-danger badge-pill mr-2"> `+ element.cycle[0].cy_name + `</span>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>`;
                        i = i + 1;
                    });
                    $("#childList").html(html);
                }
                else{
                    $("#childList").html(`
                    <div class="col-12">
                        <div class="card bg-white m-1 border">
                            <div class="card-content ">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="media-body text-info text-left">
                                            <h4 class="font-weight-bold">Dữ liệu mục con đang rỗng</h4>
                                            <span>Chọn thêm bộ chọn để tạo mới dữ liệu</span>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="ft-search text-white bg-info float-right background-round"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    `);
                }
            }
        });
        goBottom();
        clearPointChild();
    }

    /***
     * Truyền dữ liệu vào form con chi tiết của mục con
     * @param id_category: id mục lớn
     * @param id_child : id mục con
     * @param id_student: id sinh viên
     */
    function getChildInfo(id_category, id_child, id_student) {
        var url = '{{route('result/api/child/detail')}}';
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                c_id: id_category,
                cc_id: id_child,
                id:id_student
            },
            success: function (res) {
                chitiet = res.data;
                if(typeof chitiet !== 'undefined'){
                    $("#infoChild").innerHTML = '';
                    html = '';
                        var i = 0;
                        html = html +
                        `<div class="card mb-1">
                            <div class="card-content">
                                <div class="card-body p-1 border-radius" style="background: #ff9149;">
                                    <div class="media-list list-group">
                                        <div class="list-group-item media p-1  ">
                                            <a class="media-link">
                                                <h6 class="text-bold-600 m-0 mb-1 border-bottom nns-small-card"><b><span id="infoChildItem">`+chitiet.cc_item+`</span> . <span id="infoChildName">`+chitiet.cc_name+`</span></b>
                                                </h6>
                                                <span class="media-left">
                                                  <p class="font-small-3 text-muted m-0 dark"> <i class="ft-chevrons-right"></i> Điểm tối đa / Lần :</p>
                                                  <p class="font-small-3 text-muted m-0 dark"> <i class="ft-chevrons-right"></i> Lần tối đa / Chu kỳ:</p>
                                                  <p class="font-small-3 text-muted m-0 dark"> <i class="ft-chevrons-right"></i> Điểm tối đa / Chu kỳ:</p>
                                                </span>
                                                <span class="media-body text-right">
                                                  <p class="font-small-3 text-muted m-0 danger ">
                                                    <b>
                                                       <span class="badge badge badge-dark badge-pill mr-2">`+chitiet.cc_max_scores+`</span>
                                                    </b>
                                                  </p>
                                                    <p class="font-small-3 text-muted m-0 danger"><b><span class="badge badge badge-danger badge-pill mr-2">`+chitiet.cc_max_amount+`</span></b></p>
                                                  <p class="font-small-3 text-muted m-0 danger">
                                                     <span class="badge badge badge-success badge-pill mr-2">`+(chitiet.cc_max_scores_cycle==10000000 ? 'Không giới hạn' : chitiet.cc_max_scores_cycle)+`</span>
                                                  </p>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                    <div onclick="showHide('infoChild')" class="text-center p-1">
                                        <i class="ft-eye background-round bg-dark white"></i>
                                    </div>
                                </div>
                            </div>
                        </div>`;
                        i++;
                    $("#infoChild").html(html);
                }
                else{
                    $("#infoChild").html(`
                    <div class="col-12">
                        <div class="card bg-white m-1 border">
                            <div class="card-content ">
                                <div class="card-body">
                                    <div class="media d-flex">
                                        <div class="media-body text-info text-left">
                                            <h4 class="font-weight-bold">Dữ liệu mục con đang rỗng</h4>
                                            <span>Chọn mục khác hoặc thêm con cho mục hiện tại</span>
                                        </div>
                                        <div class="align-self-center">
                                            <div onclick="showHide('infoChild')" class="text-center p-1">
                                                <i class="ft-eye background-round bg-dark white"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    `);
                }
            }
        });
        $('#infoChild').show('slow');
    }

    /***
     * Tạo các thẻ sự kiện khi click vào mục con
     * @param id_category: id mục lớn
     * @param id_child : id mục con
     * @param id_student: id sinh viên
     */
    function getChildAction(id_category, id_child, id_student) {
        $('#selectPoint').html(`
            <b id="btnPointChild" onclick="getChildPoint(`+id_category+`,`+id_child+` , `+id_student+`)"><span class="badge badge badge-dark font-size-large cursor-pointer">Điểm chu kỳ</span> <i class="ft-chevrons-right"></i></b>
            <b id="btnLogChild" onclick="getChildLog(`+id_category+`,`+id_child+` , `+id_student+`)"><span class="badge badge badge-dark font-size-large cursor-pointer">Tích lũy </span> <i class="ft-chevrons-right"></i></b>
            <b id="btnSuggestChild" onclick="getChildSuggest(`+id_category+`,`+id_child+` , `+id_student+`)"><span class="badge badge badge-dark font-size-large cursor-pointer">Gợi ý cộng từ hoạt động</span> </b>
        `);
        getChildPoint(id_category, id_child, id_student);
        $('#formPoint').show();
        setTimeout(function(){ goBottom() }, 300);

    }

    /***
     * Lấy thông tin về điểm trong một chu kỳ của một mục con
     * @param id_category : id mục lớn
     * @param id_child : id mục con
     * @param id_student : id học viên
     */
    function getChildPoint(id_category, id_child, id_student){
        var url = '{{route('result/api/get/point')}}';
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                c_id: id_category,
                cc_id: id_child,
                u_id:id_student
            },
            success: function (res) {
                chitiet = res.data;
                if (typeof chitiet !== 'undefined' && chitiet.length > 0) {
                    $('#tbBodyPoint').html('');
                    $('.tbPoint1').text('Số điểm');
                    $('.tbPoint2').text('Ghi chú');
                    $('.tbPoint3').text('Thay đổi gần nhất');
                    $('.tbPoint4').text('Người thực hiện');
                    $('.tbPoint5').text('Tùy chỉnh');
                    $('.tbPoint4').show()
                    $('.tbPoint5').show()
                    var html = ``;
                    chitiet.forEach(function(element) {
                        html = html +
                        `<tr>
                            <td>`+element.rp_scores+`</td>
                            <td>`+element.rp_note+`</td>
                            <td>`+element.updated_at+`</td>
                            <td>`+element.name+`</td>
                            <td class="text-center">
                                <span onclick="updatePointShow('`+element.rp_id+`')">
                                    <i class="ft-edit-3 dark btn-outline-success background-round round"></i>
                                </span>
                                <span onclick="physicalDelete(function() {deletePointSubmit('`+element.rp_id+`')},'')">
                                    <i class="ft-trash dark btn-outline-danger background-round round"></i>
                                </span>
                            </td>
                        </tr> `;
                    });

                    $('#cardPoint').css('display','block');
                    $('#formPoint').css('display','block');

                    var table = $('#tablePoint').DataTable();
                    table.destroy();
                    $('#tbBodyPoint').html(html);
                    $('#tablePoint').DataTable();
                }
                else{
                    // $('#cardPoint').css('display','none');
                    $('#formPoint').css('display','none');
                }
            }
        });
        caculatorPoint(id_category, id_child, id_student);
    }

    /***
     * Lấy thông tin về điểm toàn phần của một mục con
     * @param id_category : id mục lớn
     * @param id_child : id mục con
     * @param id_student : id học viên
     */
    function getChildLog(id_category, id_child, id_student){
        var url = '{{route('result/api/get/log')}}';
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                c_id: id_category,
                cc_id: id_child,
                u_id: id_student
            },
            success: function (res) {
                chitiet = res.data;
                var sum = 0;
                if (typeof chitiet !== 'undefined' && chitiet.length > 0) {
                    $('#tbBodyPoint').html('');
                    $('.tbPoint1').text('Số điểm');
                    $('.tbPoint2').text('Ghi chú');
                    $('.tbPoint3').text('Chu kỳ');
                    $('.tbPoint4').text('Mục con');
                    $('.tbPoint5').text('Mục lớn');
                    $('.tbPoint4').show()
                    $('.tbPoint5').show()
                    var html = '';
                    chitiet.forEach(function(element) {
                        sum += element.rl_scores;
                        html = html +
                        `<tr>
                            <td>`+element.rl_scores+`</td>
                            <td>`+element.rl_note +`</td>
                            <td>`+element.ec_name +`</td>
                            <td>`+element.cc_name +`</td>
                            <td>`+element.c_name +`</td>
                        </tr>`;
                    });
                    $('#tbBodyPoint').html(html);
                    $('#cardPoint').css('display','block');
                    $('#formPoint').css('display','block');
                    var table = $('#tablePoint').DataTable();
                    table.destroy();
                    $('#tbBodyPoint').html(html);
                    $('#tablePoint').DataTable();
                    $('#scoresPoint').text(sum);
                }
                else{
                    // $('#cardPoint').css('display','none');
                    $('#formPoint').css('display','none');
                    $('#scoresPoint').text('0');
                }
            }
        });
        $('#scoresPoint').text('0');

    }

    /***
     * Danh sách gợi ý cộng điểm
     * @param id_category : id mục lớn
     * @param id_child : id mục con
     * @param id_student : id học viên
     */
    function getChildSuggest(id_category, id_child, id_student){
        var url = '{{route('result/api/get/suggest')}}';
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                c_id: id_category,
                cc_id: id_child,
                u_id:id_student
            },
            success: function (res) {
                chitiet = res.data;
                if (typeof chitiet !== 'undefined' && chitiet.length > 0) {
                    $('#tbBodyPoint').html('');
                    $('.tbPoint1').text('Số điểm');
                    $('.tbPoint2').text('Hoạt động');
                    $('.tbPoint3').text('Vai trò');
                    $('.tbPoint4').hide();
                    $('.tbPoint5').hide();
                    var html = ``;
                    chitiet.forEach(function(element) {
                        html = html +
                            `<tr>
                            <td>`+element.aa_scores+`</td>
                            <td>`+element.a_name+`</td>
                            <td>`+element.aa_name+`</td>
                        </tr> `;
                    });

                    $('#cardPoint').css('display','block');
                    $('#formPoint').css('display','block');
                    var table = $('#tablePoint').DataTable();
                    table.destroy();
                    $('#tbBodyPoint').html(html);
                    $('#tablePoint').DataTable();
                }
                else{
                    // $('#cardPoint').css('display','none');
                    $('#formPoint').css('display','none');
                }
            }
        });
        $('#scoresPoint').text('Không giới hạn số điểm');
    }

    /***
     * Tính toán điểm tổng hợp theo chu kỳ hiện tại của mục con
     * @param id_category : id mục lớn
     * @param id_child : id mục con
     * @param id_student : id học viên
     */
    function caculatorPoint(id_category, id_child, id_student) {
        var url = '{{route('result/api/get/point/sum')}}';
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
                c_id: id_category,
                cc_id: id_child,
                u_id:id_student
            },
            success: function (res) {
                chitiet = res.data;
                if (typeof chitiet !== 'undefined'){
                    $('#scoresPoint').text(chitiet);
                }
                else $('#scoresPoint').text('0');
            }
        });
    }

    /***
     * Nạp dữ liệu form thêm điểm
     */

    function addPointShow(name_child,max_scores, id_child, id_student) {
        $('#createPointNameChild').text(name_child);
        $('#createPointIDChild').val(id_child);
        $('#createPointIDUser').val(id_student);
        $("#create_rp_scores").attr({"max" : max_scores});
        $('#framePlus').show('slow');
    }

    /***
     * Thêm điểm
     */

    function addPointSubmit() {
        $.ajax({
            type: 'GET',
            url: '{{route('result/api/create')}}',
            data: {
                _token: '{{csrf_token()}}',
                rp_scores: $("#create_rp_scores").val(),
                rp_note: $("#create_rp_note").val(),
                u_id: $('#createPointIDUser').val(),
                cc_id: $('#createPointIDChild').val(),
                rp_make: '{{\Illuminate\Support\Facades\Auth::user()->id}}'
            },
            success: function (res) {
                if(res.status == 'r00'){
                    toastr.success('Thêm kết quả cộng điểm thành công', 'Thao tác thành công');
                    $('#btnPointChild').click();
                }
                else{
                    res.message.forEach(function(element) {
                        toastr.error(element, 'Thao tác thất bại');
                    });
                }
            }
        });
    }

    /***
     * Nạp dữ liệu lên form tùy chỉnh
     */
    function updatePointShow(rp_id) {
        $('#frameUpdate').show('slow');
        var url = '{{route('result/api/info',['id'=> ':slug'])}}';
        url = url.replace(':slug', rp_id);
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                _token: '{{csrf_token()}}',
            },
            success: function (res) {
                chitiet = res.data;
                $('#updatePointNameChild').text(chitiet.cc_name);
                $('#updatePointID').val(chitiet.rp_id);
                $("#create_rp_scores").attr({"max" : chitiet.cc_max_scores});
                $("#update_rp_scores").val(chitiet.rp_scores);
                $("#update_rp_note").val(chitiet.rp_note);
                $('#frameUpdate').show('slow');
            }
        });
    }

    /***
     * Cập nhật điểm
     */
    function updatePointSubmit() {
        $.ajax({
            type: 'GET',
            url: '{{route('result/api/change')}}',
            data: {
                _token: '{{csrf_token()}}',
                rp_id: $("#updatePointID").val(),
                rp_scores: $("#update_rp_scores").val(),
                rp_note: $("#update_rp_note").val(),
                rp_make: '{{\Illuminate\Support\Facades\Auth::user()->id}}'
            },
            success: function (res) {
                if(res.status == 'r00'){
                    toastr.success('Tùy chỉnh điểm thành công', 'Thao tác thành công');
                    $('#btnPointChild').click();
                }
                else{
                    res.message.forEach(function(element) {
                        toastr.error(element, 'Thao tác thất bại');
                    });
                }
            }
        });
    }

    /***
     * Xóa điểm
     */
    function deletePointSubmit(rp_id) {
        $.ajax({
            type: 'GET',
            url: '{{route('result/api/remove')}}',
            data: {
                _token: '{{csrf_token()}}',
                rp_id: rp_id,
                rp_make: '{{\Illuminate\Support\Facades\Auth::user()->id}}'
            },
            success: function (res) {
                if(res.status == 'r00'){
                    toastr.success('Tùy chỉnh điểm thành công', 'Thao tác thành công');
                    $('#btnPointChild').click();
                }
                else{
                    res.message.forEach(function(element) {
                        toastr.error(element, 'Thao tác thất bại');
                    });
                }
            }
        });
    }


</script>