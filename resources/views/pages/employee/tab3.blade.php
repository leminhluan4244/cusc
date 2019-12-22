<div class="tab-pane" id="tabIcon23" aria-labelledby="baseIcon-tab23">
    <p>Bảng điểm cộng</p>

    <table class="table">
        <thead>
        <tr>
            <th>Sự kiện</th>
            <th>Vai trò</th>
            <th>Điểm</th>
            <th>Tùy chỉnh</th>
        </tr>
        </thead>
        <tbody>
        @if(sizeof($val_child['achievement']))
            @foreach($val_child['achievement'] as $key_ach=> $val_ach)
                <tr>
                    <td>{{$val_ach->a_name}}</td>
                    <td>{{$val_ach->aa_name}}</td>
                    <td><span class="badge badge badge-danger badge-pill mr-2">{{$val_ach->aa_scores}}</span></td>
                    <td>{{$val_ach->updated_at}}</td>
                </tr>
            @endforeach
        @endif
        </tbody>
    </table>
</div>