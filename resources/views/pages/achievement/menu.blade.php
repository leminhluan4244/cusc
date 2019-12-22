<div class="btn-back-to-top bg0-hov" id="myBtn" style="display: flex;">
    <nav class="menu">
        <input type="checkbox" href="#" class="menu-open" name="menu-open" id="menu-open" />
        <label class="menu-open-button " for="menu-open">
            <span class="lines line-1"></span>
            <span class="lines line-2"></span>
            <span class="lines line-3"></span>
        </label>

        <a  onclick="CreateActiveGetCategory()" data-toggle="popover" data-content="Thêm vai trò" data-trigger="hover" data-placement="top" class="menu-item-nns bblue white"> <i class="ft-plus font-large-1"></i> </a>
        <a href="{{route('achievement/users',['id'=>$data['active']['a_id']])}}" data-toggle="popover" data-content="Điều hướng phân công" data-trigger="hover" data-placement="right" class="menu-item-nns bgreen" > <i class="ft-activity font-large-1"></i> </a>
        <a href="{{route('active/index',['key' => 'coming'])}}" data-toggle="popover" data-content="Sự kiện sắp diễn ra" data-trigger="hover" data-placement="right" class="menu-item-nns bred" > <i class="ft-heart font-large-1"></i> </a>
        <a href="{{route('active/index',['key' => 'passed'])}}" data-toggle="popover" data-content="Đã diễn ra" data-trigger="hover" data-placement="bottom" class="menu-item-nns bpurple" > <i class="ft-paperclip font-large-1"></i> </a>
        <a href="{{route('active/index',['key' => 'wait'])}}" data-toggle="popover" data-content="Chờ duyệt" data-trigger="hover" data-placement="left" class="menu-item-nns borange" > <i class="ft-pause font-large-1"></i> </a>
        <a href="#" data-toggle="popover" data-content="Tìm kiếm" data-trigger="hover" data-placement="left" class="menu-item-nns blightblue"> <i class="ft-search font-large-1"></i> </a>
    </nav>
</div>