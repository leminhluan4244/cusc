<div class="modal fade" id="activeAddModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="card mb-0">
                <div class="card-header bg-info">
                    <h4 class="card-title white" id="basic-layout-form">Nhập thông tin cho sự kiện</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements white">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body pt-0">
                        <form class="form" method="post" action="{{route('active/create')}}">
                            @csrf
                            <input type="hidden" name="u_id" required value="{{\Illuminate\Support\Facades\Auth::user()->id}}">
                            <div class="form-body">
                                <div class="row form-section pt-1">
                                    <h4 class=" col-md-6 col-12"><b><i class="ft-user"></i>Thông số sự kiện</b></h4>
                                    <div class="col-md-6 col-12 text-right ">
                                        <button class="btn btn-info btn-sm box-shadow-3 ">
                                            Lưu
                                        </button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="form-group mb-1">
                                            <label class="font-weight-bold">Tên sự kiện</label>
                                            <input type="text" class="form-control input-sm" placeholder="Tên sự kiện"
                                                   name="a_name" id="a_name_create" required>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Số lượng tối đa</label>
                                            <input type="number" class="form-control input-sm"
                                                   placeholder="Số người " id="a_number_create" name="a_number" min="0" max="99999999"
                                                   required>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Ngày bắt đầu</label>
                                            <input type="date" class="form-control input-sm" id="a_begin_create" name="a_begin" required>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="form-group mb-0">
                                            <label class="font-weight-bold">Ngày kết thúc</label>
                                            <input type="date" class="form-control input-sm" id="a_end_create" name="a_end" required>
                                        </div>
                                    </div>
                                </div>
                                <h4 class="form-section"><b><i class="la la-paperclip"></i> Mô tả</b></h4>
                                <div class="form-group">
                                    <textarea name="a_note" id="a_note_create" cols="30" rows="15" class="ckeditor">

							        </textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    {{--function CreateActiveGetCategory() {--}}
        {{--var url_category = '{{route('category/api/list')}}';--}}
        {{--$.ajax({--}}
            {{--type: 'GET',--}}
            {{--url: url_category,--}}
            {{--data: {--}}
                {{--_token: '{{csrf_token()}}'--}}
            {{--},--}}
            {{--success: function (res) {--}}
                {{--chitiet = res.data;--}}
                {{--$("#c_id_create").innerHTML = '';--}}
                {{--$(".ui-selectmenu-text").text('Chọn một mục lớn');--}}
                {{--htmlTable = '<option disabled selected value="default" data-class="ft-unlock">Chọn một mục lớn</option>';--}}
                {{--chitiet.forEach(function (element) {--}}
                    {{--htmlTable = htmlTable +--}}
                        {{--'<option value="'+element.c_id+'" data-class="la la-paper-plane" class="ui-menu-item ui-menu-item-wrapper">'+element.c_item +' - '+element.c_name+'</option>'--}}
                {{--});--}}
                {{--$("#c_id_create").html(htmlTable);--}}
            {{--}--}}
        {{--})--}}
        {{--$('#activeAddModel').modal('show');--}}
    {{--}--}}
    {{--function CreateActiveGetChildByCategory() {--}}
        {{--var id_category = $("#c_id_create").val();--}}
        {{--var url_child = '{{route('category/api/search_full',['id'=> ':slug'])}}';--}}
        {{--url_child = url_child.replace(':slug', id_category);--}}
        {{--$.ajax({--}}
            {{--type: 'GET',--}}
            {{--url: url_child,--}}
            {{--data: {--}}
                {{--_token: '{{csrf_token()}}'--}}
            {{--},--}}
            {{--success: function (res) {--}}
                {{--chitiet = res.data.child;--}}
                {{--$("#group_child_create").innerHTML = '';--}}
                {{--htmlTable = '';--}}
                {{--if(chitiet.length==0) htmlTable = 'Danh sách rỗng';--}}
                {{--chitiet.forEach(function (element) {--}}
                    {{--htmlTable = htmlTable +--}}
                        {{--'<input type="radio" name="cc_id" id="'+element.cc_id+'" value="'+element.cc_id+'" required><label for="'+element.cc_id+'">'+element.cc_item +' - '+element.cc_name+'</label>';--}}
                {{--});--}}
                {{--$("#group_child_create").html(htmlTable);--}}
            {{--}--}}
        {{--})--}}
    {{--}--}}
</script>