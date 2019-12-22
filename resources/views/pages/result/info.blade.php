@if(isset($data['user']))
    <div class="col-12">
        <div class="card"  id="category_list" >
            <div class="card-header bg-dark">
                <h4 class="card-title white">{{$data['user']->name}} -
                    <span class="menu-title">Điểm hiện tại: </span>
                    <span class="badge badge badge-danger badge-pill mr-2">{{$data['user']->scores}}</span>
                </h4>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                        <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-content collapse">
                <div class="card-body">
                    <p class="card-text">CUSC ID: {{$data['user']->cusc_id}}</p>
                    <p class="card-text">Email: {{$data['user']->email}}</p>
                    <p class="card-text">Birthday: {{$data['user']->birthday}}</p>
                    @if($data['user']->gender==1)
                        <p class="card-text">Giới tính: Nam</p>
                    @else
                        <p class="card-text">Giới tính: Nữ</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endif