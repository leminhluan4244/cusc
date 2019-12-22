<div class="btn-back-to-top bg0-hov" id="myBtn" style="display: flex;">
    <nav class="menu">
        <input type="checkbox" href="#" class="menu-open" name="menu-open" id="menu-open" />
        <label class="menu-open-button " for="menu-open">
            <span class="lines line-1"></span>
            <span class="lines line-2"></span>
            <span class="lines line-3"></span>
        </label>

        <a href="{{route('active/index',['key' => 'all','keyword'=>'active'])}}" data-toggle="popover" data-content="Tất cả sự kiện" data-trigger="hover" data-placement="top" class="menu-item-nns bblue"> <i class="ft-bar-chart-2 font-large-1"></i> </a>
        <a href="{{route('active/index',['key' => 'happen','keyword'=>'active'])}}" data-toggle="popover" data-content="Sự kiện đang diễn ra" data-trigger="hover" data-placement="right" class="menu-item-nns bgreen" > <i class="ft-flag font-large-1"></i> </a>
        <a href="{{route('active/index',['key' => 'coming','keyword'=>'active'])}}" data-toggle="popover" data-content="Sự kiện sắp diễn ra" data-trigger="hover" data-placement="right" class="menu-item-nns bred" > <i class="ft-heart font-large-1"></i> </a>
        <a href="{{route('active/index',['key' => 'passed', 'keyword'=>'active'])}}" data-toggle="popover" data-content="Đã diễn ra" data-trigger="hover" data-placement="bottom" class="menu-item-nns bpurple" > <i class="ft-paperclip font-large-1"></i> </a>
        <a href="{{route('active/index',['key' => 'wait', 'keyword'=>'active'])}}" data-toggle="popover" data-content="Chờ duyệt" data-trigger="hover" data-placement="left" class="menu-item-nns borange" > <i class="ft-pause font-large-1"></i> </a>
        <a href="#" onclick="showHide('infoChild')"  data-toggle="popover" data-content="Tìm kiếm" data-trigger="hover" data-placement="left" class="menu-item-nns blightblue"> <i class="ft-search font-large-1"></i> </a>
    </nav>
</div>