<a class="dropdown-item" href="#"><i class="ft-mail"></i> Tùy chỉnh</a>
<?php $roles = \App\Http\Controllers\Auth\arrayListRoute::classifyRoles(\Illuminate\Support\Facades\Auth::user()->id) ?>
@if($roles = "student")
    <a class="dropdown-item" href="#"><i class="ft-check-square"></i> Bảng điểm của tôi</a>
@endif
<a class="dropdown-item" href="{{route('assignment/list_class')}}"><i class="ft-check-square"></i> Chấm điểm học viên</a>
<a class="dropdown-item" href="{{route('teacher/list_class')}}"><i class="ft-message-square"></i> Giáo viên chấm điểm</a>
<div class="dropdown-divider"></div>
<form action="{{ route('logout') }}" method="POST" >
    @csrf
    <button type="submit" class="dropdown-item" ><i class="ft-power"></i> Logout</button>
</form>