<div class="col-12 mt-1">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title" >Bảng điểm chi tiết
            </h4>
            <div class="heading-elements">
                <ul class="list-inline mb-0">
                    <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                    <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="card-content " id="cardPoint" style="background: rgb(244, 245, 233); display: block;">
            <div class="card m-1">
                <div class="card-content">
                    <div class="card-body p-0 " style="background: rgb(244, 245, 233);">
                        <div class="media-list list-group">
                            <div class="list-group-item media p-1  ">
                                <span class="media-link" >
                                    <div class="text-bold-600 m-0 mb-1 border-bottom nns-small-card" id="selectPoint">
                                        {{--Các tab lựa chọn sẽ thêm vào đây--}}
                                    </div>
                                    <div class="mb-1 text-bold-600"><i class="ft-pocket"></i>
                                        <span class="menu-title">Tổng điểm: </span>
                                        <span class="badge badge badge-danger badge-pill mr-2" id="scoresPoint"></span>
                                    </div>
                                    <div id="formPoint" style="display: none;">
                                        {{--Các phần tùy chỉnh sẽ đỗ vào đây--}}
                                        <table id="tablePoint" class="table table-striped default-ordering table-borderless">
                                          <thead class="bg-yellow bg-lighten-4">
                                            <tr >
                                              <th><span class="tbPoint1">NAME1</span></th>
                                              <th><span class="tbPoint2">NAME2</span></th>
                                              <th><span class="tbPoint3">NAME3</span></th>
                                              <th><span class="tbPoint4">NAME4</span></th>
                                              <th><span class="tbPoint5">NAME5</span></th>
                                            </tr>
                                          </thead>
                                          <tbody id="tbBodyPoint">
                                            {{--Dữ liệu sẽ đổ vào đây--}}
                                          </tbody>
                                          <tfoot>
                                            <tr>
                                              <th><span class="tbPoint1">NAME1</span></th>
                                              <th><span class="tbPoint2">NAME2</span></th>
                                              <th><span class="tbPoint3">NAME3</span></th>
                                              <th><span class="tbPoint4">NAME4</span></th>
                                              <th><span class="tbPoint5">NAME5</span></th>
                                            </tr>
                                          </tfoot>
                                        </table>
                                    </div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>