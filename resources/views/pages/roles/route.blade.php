<div class="modal fade" id="routeModel" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" >
            <div class="modal-body p-0">
                <div class="card m-0">
                    <div class="card-header bg-danger">
                        <h4 class="card-title white" id="hidden-label-basic-form">Danh sách được phép truy cập</h4>
                        <div class="heading-elements white">
                            <ul class="list-inline mb-0">
                                <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                <li><a data-dismiss="modal"><i class="ft-x"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collpase show">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-10 col-12 pr-0">
                                    <div class="form-group">
                                        <input type="text" id="searchroute" class="form-control round "
                                               placeholder="Tìm kiếm nhanh trên trang này" name="rateperhour">

                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group mt-1">
                                    <i class="ft-x white background-round bg-danger font-size-large" onclick="clearInput()"></i>
                                    </div>
                                </div>
                               <div class="col-12">
                                   <section id="scroll-wheel">
                                       <div class="row match-height">
                                           <div class="default-wheel-speed scroll-example height-250" style="width: 100%; border: 0;">
                                               <div class="form-group">
                                                   <fieldset class="">
                                                       <div id="contentRoute" class="row m-1 mb-2">

                                                       </div>
                                                   </fieldset>
                                               </div>
                                           </div>
                                       </div>
                                   </section>
                               </div>
                                <div class="col-12">
                                    <div class="text-center">
                                        <button class="btn btn-danger btn-sm box-shadow-3 mt-1" data-dismiss="modal">
                                            Trở về
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>