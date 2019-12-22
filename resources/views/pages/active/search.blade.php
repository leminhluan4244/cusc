<div class="btn-back-to-top bg0-hov " id="infoChild" style="display: none; min-width: 30%; max-width: 80%;">
    <div class="card mb-1">
        <div class="card-content">
            <div class="card-body p-1 " >
                <label  class="font-weight-bold ">Nhập từ khóa tìm kiếm theo tên sự kiện</label>
                <div class="position-relative has-icon-left">
                   <input type="text" class="form-control" id="keyword" placeholder="Từ khóa" required>
                    <div class="form-control-position">
                        <i class="ft-edit"></i>
                    </div>
                </div>
                <div class=" text-center p-1">
                    <button class="btn btn-info btn-sm box-shadow-3 " onclick="getFind()">
                        Tìm
                    </button>
                    <button type="button" onclick="showHide('infoChild')" class="btn btn-danger btn-sm box-shadow-3 ">
                        Hủy
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>