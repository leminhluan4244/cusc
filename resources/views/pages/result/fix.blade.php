{{--Bộ nút memu--}}
<div class="btn-back-to-top bg0-hov" id="myBtn" style="display: flex;">
    <nav class="menu">
        <input type="checkbox" href="#" class="menu-open" name="menu-open" id="menu-open" />
        <label class="menu-open-button " for="menu-open">
            <span class="lines line-1"></span>
            <span class="lines line-2"></span>
            <span class="lines line-3"></span>
        </label>

        <a  href="#category_list" data-toggle="popover" data-content="Mục lớn" data-trigger="hover" data-placement="top" class="menu-item-nns bblue white"> <i class="ft-chevrons-up font-large-1"></i> </a>
        <a href="" data-toggle="popover" data-content="Tự động chấm" data-trigger="hover" data-placement="right" class="menu-item-nns bgreen" > <i class="ft-disc font-large-1"></i> </a>
        <a href="" data-toggle="popover" data-content="Mục con" data-trigger="hover" data-placement="right" class="menu-item-nns bred" > <i class="ft-heart font-large-1"></i> </a>
        <a  onclick="goBottom()" data-toggle="popover" data-content="Cuối trang" data-trigger="hover" data-placement="bottom" class="menu-item-nns bpurple" > <i class="ft-chevrons-down font-large-1"></i> </a>
        <a href="" data-toggle="popover" data-content="Chờ duyệt" data-trigger="hover" data-placement="left" class="menu-item-nns borange" > <i class="ft-pause font-large-1"></i> </a>
        <a onclick="showHide('framePlus')" data-toggle="popover" data-content="Thêm điểm" data-trigger="hover" data-placement="left" class="menu-item-nns blightblue white"> <i class="ft-plus font-large-1"></i> </a>
    </nav>
</div>