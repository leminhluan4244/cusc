<div class="modal fade" id="importModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="card m-0">
                <div class="card-header bg-success">
                    <h4 class="card-title white" id="hidden-label-basic-form">Nhập file excel theo mẫu</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements white">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collpase show">
                    <div class="card-body">
                        <label class="danger"> Trước khi thực hiện nạp hãy chắt chắn rằng dữ liệu của bạn đúng mẫu</label>
                        <form style="border: 4px solid #a1a1a1;margin-top: 15px;padding: 10px;" action="{{route('users/import')}}" class="form-horizontal" method="post" enctype="multipart/form-data" accept="application/vnd.ms-excel">
                            <input type="file" name="import_file" />
                            @csrf
                            <button class="btn btn-success">Nạp dữ liệu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>