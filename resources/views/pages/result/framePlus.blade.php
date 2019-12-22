<div class="btn-back-to-top bg0-hov div-fix-left " id="framePlus" style="display: none;">
    <div class="row bg-white" style="width: 400px;" >
        <div class="col-12 pt-1 border-2 bg-info" >
            <h4 id="createPointNameChild" class="text-center p-1 white"></h4>
            <input type="hidden" id="createPointIDChild" value="">
            <input type="hidden" id="createPointIDUser" value="">
            <div class="position-relative has-icon-left">
                <input type="number" min="0" class="form-control" id="create_rp_scores" name="rp_scores" placeholder="Điểm" required>
                <div class="form-control-position">
                    <i class="ft-edit"></i>
                </div>
            </div>
            <div class="position-relative has-icon-left mt-1">
                <textarea rows="3" class="form-control" id="create_rp_note" name="rp_note" placeholder="Chú thích" required></textarea>
                <div class="form-control-position">
                    <i class="ft-file"></i>
                </div>
            </div>
            <div class=" text-center p-1">
                <button class="btn btn-dark btn-sm box-shadow-3 " onclick="addPointSubmit()">
                    Lưu
                </button>
                <button type="button" onclick="showHide('framePlus')" class="btn btn-dark btn-sm box-shadow-3 ">
                    Hủy
                </button>
            </div>
        </div>
    </div>
</div>