<div class="col-12">
    <table class="table  table-striped table-bordered dataex-html5-export table-responsive-sm" style="display: none;">
        <thead>
        <tr class="bg-info white">
            <th>CUSC ID</th>
            <th>Họ và tên</th>
            <th>SĐT</th>
            <th>Email</th>
            <th>Giới tính</th>
            <th>Ngày sinh</th>
            <th>Điểm</th>
        </tr>
        </thead>
        <tbody>
        @if(isset($data['list']) && sizeof($data['list'])>0)
            @foreach($data['list'] as $key => $value)
                <tr>
                    <td>{{$value->cusc_id}}</td>
                    <td>{{$value->name}}</td>
                    <td>{{$value->phone}}</td>
                    <td>{{$value->email}}</td>
                    @if($value->gender==1)
                        <td>Nam</td>
                    @else
                        <td>Nữ</td>
                    @endif
                    <td>{{date_format(new DateTime($value->birthday),'d-m-Y')}}</td>
                    <td class="text-center">{{$value->scores}}</td>
                </tr>
            @endforeach
        @endif

        </tbody>
        <tfoot>
        <tr class="">
            <th>CUSC ID</th>
            <th>Họ và tên</th>
            <th>SĐT</th>
            <th>Email</th>
            <th>Giới tính</th>
            <th>Ngày sinh</th>
            <th>Điểm</th>
        </tr>
        </tfoot>
    </table>
    <div class="row">
        <div class="nns-pagination">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="{{ $data['list']->toArray()['first_page_url'] }}"><i class="ft-chevrons-left"></i></a></li>
            </ul>
            {!! $data['list']->links() !!}
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="{{ $data['list']->toArray()['last_page_url'] }}"><i class="ft-chevrons-right"></i></a></li>
            </ul>

        </div>
    </div>
</div>