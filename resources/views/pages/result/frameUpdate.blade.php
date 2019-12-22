<div class="btn-back-to-top bg0-hov div-fix-left " id="frameUpdate" style="display: none;">
    <div class="row bg-white" style="width: 400px;" >
        <div class="col-12 pt-1 border-2 bg-success" >
            <h4 id="updatePointNameChild" class="text-center p-1 white"></h4>
            <input type="hidden" id="updatePointID" value="">
            <div class="position-relative has-icon-left">
                <input type="number" min="0" class="form-control" id="update_rp_scores" name="rp_scores" placeholder="Điểm" required>
                <div class="form-control-position">
                    <i class="ft-edit"></i>
                </div>
            </div>
            <div class="position-relative has-icon-left mt-1">
                <textarea rows="3" class="form-control" id="update_rp_note" name="rp_note" placeholder="Chú thích" required></textarea>
                <div class="form-control-position">
                    <i class="ft-file"></i>
                </div>
            </div>
            <div class=" text-center p-1">
                <button class="btn btn-dark btn-sm box-shadow-3 " onclick="updatePointSubmit()">
                    Lưu
                </button>
                <button type="button" onclick="showHide('frameUpdate')" class="btn btn-dark btn-sm box-shadow-3 ">
                    Hủy
                </button>
            </div>
        </div>
    </div>
</div>