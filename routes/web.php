<?php

Route::get('/', 'HomeController@index');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('pages.home');

Route::group(['middleware' => 'auth'], function (){

    /**
     * Báo lỗi truy cập
     */
    Route::get('error',function (){
        $result = [
            'status'=> 'r03',
            'data' => [],
            'message' => ['Phân quyền của bạn không được phép truy cập đường dẫn này']
        ];
        return view('components.notfound', compact('result'));
    });

    Route::group(['middleware' => 'permission'], function () {
        /***
         * Quản lý tài khoản YES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */

        /**
         * Bộ controller users
         */
        Route::group(['prefix' => 'users'], function () {

            /***
             * Lấy danh sách tài khoản theo id phân quyền truyền vào YES
             */
            Route::get('/{role}', 'UsersController@index')->name('users/index');

            /**
             * Thêm tài khoản YES
             */
            Route::post('/create', 'UsersController@create')->name('users/create');

            /**
             * Sửa tài khoản YES
             */
            Route::post('/change', 'UsersController@change')->name('users/change');

            /**
             * Xóa tạm YES
             */
            Route::get('/hide/{id}', 'UsersController@hide')->name('users/hide');

            /**
             * Khôi phục YES
             */
            Route::get('/undo/{id}', 'UsersController@undo')->name('users/undo');

            /**
             * Xóa vĩnh viễn YES
             */
            Route::get('/remove/{id}', 'UsersController@remove')->name('users/remove');

            /**
             * Cấp lại phân quyền YES
             */
            Route::post('reset/role', 'UsersController@resetRoles')->name('users/reset/role');

            /**
             * Import excel YES
             */
            Route::post('/import', 'ExcelImportController@importExcel')->name('users/import');

            /**
             * Danh sách phân công cho một cán bộ YES
             */
            Route::get('/assignment/{id}', 'AssignmentController@index')->name('users/assignment');

        });

        /**
         * Bộ api users
         */
        Route::group(['prefix' => 'users/api'], function () {
            /**
             * Lấy danh sách 1 nhóm users bằng cách sử dụng api
             */
            Route::get('{role}', 'UsersApiController@index')->name('users/api');

            /**
             * Danh sách các phân quyền không phải phân quyền mặc định
             */
            Route::get('get/roles/list', 'UsersApiController@employee')->name('users/api/get/roles/list');

            /**
             * Tìm kiếm tài khoản bằng api
             */
            Route::get('search/{id}', 'UsersApiController@search')->name('users/api/search');

            /**
             * Danh sách các lớp phân công cho cán bộ chấm điểm
             */
            Route::get('assignment/{id}', 'AssignmentApiController@index')->name('users/api/assignment');

            /***
             * Danh sách các lớp không thuộc quản lý của một cán bộ
             */
            Route::get('nonassignment/{id}', 'AssignmentApiController@non_member')->name('users/api/nonassignment');

            /**
             * Thêm một danh sách các lớp vào phân công cho một cán bộ
             */
            Route::get('assignment/add/{id}', 'AssignmentApiController@add_member')->name('users/api/assignment/add');

            /**
             * Loại bỏ một danh sách các lớp khỏi phân công cho một cán bộ
             */
            Route::get('assignment/remove/{id}', 'AssignmentApiController@remove_member')->name('users/api/assignment/remove');
        });

        /**
         * Quản lý lớp YES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */

        /**
         * Bộ controller class YES
         */
        Route::group(['prefix' => 'class'],function(){
            /**
             * Lấy danh sách lớp YES
             */
            Route::get('/', 'ClassController@index')->name('class/index');

            /**
             * Lấy tất cả học sinh trong lớp
             */
            Route::get ('/student/{id}/{id_manager}', 'ClassController@student')->name('class/student');

            /**
             * Lấy tất cả học sinh không trong lớp đó
             */
            Route::get ('/exclude/{id}/{id_manager}', 'ClassController@exclude')->name('class/exclude');
            /**
             * Thêm một lớp
             */
            Route::post('/create', 'ClassController@create')->name('class/create');
            /*
             * Thêm học viên vào lớp
             */
            Route::post('/add_student', 'ClassController@add_student')->name('class/add_student');

            /**
             * Sửa lớp
             */
            Route::post('/change', 'ClassController@change')->name('class/change');
            /**
             * Xóa tạm lớp
             */
            Route::get('/hide/{id}', 'ClassController@hide')->name('class/hide');

            /**
             * Khôi phục
             */
            Route::get('/undo/{id}', 'ClassController@undo')->name('class/undo');

            /**
             * Xóa vĩnh viễn
             */
            Route::get('/remove/{id}', 'ClassController@remove')->name('class/remove');

            /**
             * Xóa 1 học viên khỏi lớp
             */
            Route::get('/remove_one/{id_user}/{id_class}', 'ClassController@remove_one')->name('class/remove_one');

            /**
             * Xóa tất cả học viên trong lớp
             */
            Route::get('/remove_all/{id}', 'ClassController@remove_all')->name('class/remove_all');
        });

        /**
         * Bộ api class YES
         */
        Route::group(['prefix' => 'class/api'],function(){
            /**
             * Lấy thông tin lớp bằng API
             */
            Route::get('search/{id}', 'ClassApiController@search')->name('class/api/search');
        });

        /**
         * Quản lý hoạt động YES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */

        /**
         * Bộ controller và api hoạt động
         */
        Route::group(['prefix' => 'active'],function(){

            /**
             * Thêm sự kiện YES
             */
            Route::post('/create', 'ActiveController@create')->name('active/create');

            /**
             * Sửa sự kiện YES
             */
            Route::post('/change', 'ActiveController@change')->name('active/change');

            /**
             * Xóa tạm sự kiện YES
             */
            Route::get('/hide/{id}', 'ActiveController@hide')->name('active/hide');

            /**
             * Khôi phục sự kiện YES
             */
            Route::get('/undo/{id}', 'ActiveController@undo')->name('active/undo');

            /**
             * Xóa vĩnh viễn sự kiện YES
             */
            Route::get('/remove/{id}', 'ActiveController@remove')->name('active/remove');

            /**
             * Duyệt sự kiện YES
             */
            Route::get('/approved/{id}', 'ActiveController@approved')->name('active/approved');

            /**
             * Danh sách sự kiện YES
             */
            Route::get('{key}/{keyword}', 'ActiveController@index')->name('active/index');

            /**
             * Lấy info sự kiện thông tin bằng api
             */
            Route::get('/api', 'ActiveApiController@index')->name('active/api');

            /**
             * Tìm kiếm sự kiện bằng api
             */
            Route::get('/api/search/{id}', 'ActiveApiController@search')->name('active/api/search');

            /**
             * Đếm số học viên tham gia sự kiện nào đó YES
             */
            Route::get('/api/count/{id}', 'ActiveApiController@count')->name('active/api/count');
        });

        /**
         * Quản lý vai trò YES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        /**
         * Bộ controller và api quản lý vai trò hoạt động
         */
        Route::group(['prefix' => 'achievement'],function(){

            /**
             * Danh sách YES
             */
            Route::get('/{id}', 'ActiveAchievementController@index')->name('achievement/index');

            /**
             * Thêm vai trò YES
             */
            Route::post('/create', 'ActiveAchievementController@create')->name('achievement/create');

            /**
             * Sửa vai trò YES
             */
            Route::post('/change', 'ActiveAchievementController@change')->name('achievement/change');

            //Nạp danh sách học viên để chọn
            Route::get('/users/{id}', 'ActiveAchievementController@users')->name('achievement/users');

            /**
             * Xóa tạm vai trò YES
             */
            Route::get('/api/hide/{id}', 'ActiveAchievementApiController@hide')->name('achievement/api/hide');

            /**
             * Khôi phục vai trò YES
             */
            Route::get('/api/undo/{id}', 'ActiveAchievementApiController@undo')->name('achievement/api/undo');

            /**
             * Xóa vĩnh viễn vai trò YES
             */
            Route::get('/api/remove/{id}', 'ActiveAchievementApiController@remove')->name('achievement/api/remove');

            //Lấy info thông tin bằng api
            Route::get('/api', 'ActiveAchievementApiController@index')->name('achievement/api');

            /**
             * Tìm kiếm bằng api YES
             */
            Route::get('/api/search/{id}', 'ActiveAchievementApiController@search')->name('achievement/api/search');

            /**
             * Tìm kiếm danh sách sinh viên tham gia bằng api YES
             */
            Route::get('/api/list_member/{id}', 'ActiveAchievementApiController@list_member')->name('achievement/api/list_member');

            /**
             * Tìm kiếm không phải thành viên YES
             */
            Route::get('/api/non_member/{id}', 'ActiveAchievementApiController@non_member')->name('achievement/api/non_member');

            /**
             * Thêm thành viên YES
             */
            Route::get('/api/add_member/{id}', 'ActiveAchievementApiController@add_member')->name('achievement/api/add_member');

            /**
             * Xóa thành viên YES
             */
            Route::get('/api/remove_member/{id}', 'ActiveAchievementApiController@remove_member')->name('achievement/api/remove_member');

        });

        /**
         * Quản lý chu kỳ YES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'cycle'],function(){
            /**
             * Lấy danh sách chu kỳ YES
             */
            Route::get('/', 'CycleController@index')->name('cycle/index');

            /**
             * Thêm chu kỳ YES
             */
            Route::post('/create', 'CycleController@create')->name('cycle/create');

            /**
             * Sửa chu kỳ YES
             */
            Route::post('/change', 'CycleController@change')->name('cycle/change');

            /**
             * Ẩn chu kỳ YES
             */
            Route::get('/hide/{id}', 'CycleController@hide')->name('cycle/hide');

            /**
             * Khôi phục chu kỳ YES
             */
            Route::get('/undo/{id}', 'CycleController@undo')->name('cycle/undo');

            /**
             * Xóa vĩnh viễn chu kỳ YES
             */
            Route::get('/remove/{id}', 'CycleController@remove')->name('cycle/remove');

            /**
             * Lấy danh sách chu kỳ bằng api YES
             */
            Route::get('/api', 'CycleApiController@index')->name('cycle/api');
        });

        /**
         * Quản lý bộ chọn chu kỳ YES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'select'],function(){
            /**
             * Lấy bộ chọn theo id chu kỳ YES
             */
            Route::get('/', 'CycleSelectController@index')->name('select/index');

            /**
             * Thêm bộ chọn YES
             */
            Route::post('/create', 'CycleSelectController@create')->name('select/create');

            /**
             * Sửa bộ chọn YES
             */
            Route::post('/change', 'CycleSelectController@change')->name('select/change');

            /**
             * Xóa tạm bộ chọn YES
             */
            Route::get('/hide/{id}', 'CycleSelectController@hide')->name('select/hide');

            /**
             * Khôi phục bộ chọn YES
             */
            Route::get('/undo/{id}', 'CycleSelectController@undo')->name('select/undo');

            /**
             * Xóa vĩnh viễn YES
             */
            Route::get('/remove/{id}', 'CycleSelectController@remove')->name('select/remove');

            /**
             * Lấy danh sách theo chu kỳ bằng api YES
             */
            Route::get('/api/search_cy/{id}', 'CycleSelectApiController@search_by_cycle')->name('select/api/search_cy');

        });

        /**
         * Quản lý giá trị chu kỳ YES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'entity'],function(){

            /**
             * Danh sách các giá trị YES
             */
            Route::get('/', 'EntityCycleController@index')->name('entity/index');

            /**
             * Thêm giá trị YES
             */
            Route::post('/create', 'EntityCycleController@create')->name('entity/create');

            /**
             * Sửa giá trị
             */
            Route::post('/change', 'EntityCycleController@change')->name('entity/change');

            /**
             * Đặt một giá trị làm giá trị mặt định
             */
            Route::get('/set_default/{id}', 'EntityCycleController@set_default')->name('entity/set_default');

            /***
             * Chốt chu kỳ và ghi điểm sang bảng log
             * > success
             * > Form Xác nhận chốt chu kỳ, entity.success
             */
            Route::post('/success', 'ResultPointController@success')->name('entity/success');

            /**
             * Xóa tạm một giá trị chu kỳ
             */
            Route::get('/hide/{id}', 'EntityCycleController@hide')->name('entity/hide');

            /**
             * Khôi phục chu kỳ  YES
             */
            Route::get('/undo/{id}', 'EntityCycleController@undo')->name('entity/undo');

            /**
             * Xóa vĩnh viễn YES
             */
            Route::get('/remove/{id}', 'EntityCycleController@remove')->name('entity/remove');

            /**
             * Lấy thông tin chu kỳ bằng api
             */
            Route::get('/api/search/{id}', 'EntityCycleApiController@search')->name('entity/api/search');


            /**
             * Lấy thông tin các chu kỳ chưa chốt
             */
            Route::get('/select/get/{id}/{child}', 'ResultPointApiController@nextEntity')->name('select/get');

            /***
             * Lấy ra chu kỳ sẵn sàng tiếp theo chuẩn bị cho xác nhận chu kỳ
             * > success
             * > From xác nhận chốt chu kỳ, js: entity.js
             */
            Route::get('/api/get/next', 'EntityCycleApiController@getAvailableNextEntity')->name('entity/api/get/next');

        });

        /**
         * Quản lý niên khóa >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'year'],function(){

            /**
             * Danh sách các niên khóa YES
             */
            Route::get('/', 'SchoolYearController@index')->name('year/index');

            /**
             * Thêm niên khóa YES
             *              */
            Route::post('/create', 'SchoolYearController@create')->name('year/create');

            /**
             * Sửa niên khóa YES
             */
            Route::post('/change', 'SchoolYearController@change')->name('year/change');

            /**
             * Xóa niên khóa YES
             */
            Route::get('/hide/{id}', 'SchoolYearController@hide')->name('year/hide');

            /**
             * Khôi phục niên khóa YES
             */
            Route::get('/undo/{id}', 'SchoolYearController@undo')->name('year/undo');

            /**
             * Xóa niên khóa YES
             */
            Route::get('/remove/{id}', 'SchoolYearController@remove')->name('year/remove');

            /**
             * Lấy danh sách bằng api YES
             */
            Route::get('/api', 'SchoolYearApiController@index')->name('year/api');
        });

        /**
         * Quản lý chuyên ngành >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'majors'],function(){

            /**
             * Danh sách chuyên ngành YES
             */
            Route::get('/', 'MajorsController@index')->name('majors/index');

            /**
             * Thêm chuyên ngành YES
             */
            Route::post('/create', 'MajorsController@create')->name('majors/create');

            /**
             * Sửa chuyên ngành
             */
            Route::post('/change', 'MajorsController@change')->name('majors/change');

            /**
             * Ẩn chuyên ngành YES
             */
            Route::get('/hide/{id}', 'MajorsController@hide')->name('majors/hide');

            /**
             * Khôi phục chuyên ngành YES
             */
            Route::get('/undo/{id}', 'MajorsController@undo')->name('majors/undo');

            /**
             * Xóa vĩnh viễn chuyên ngành YES
             */
            Route::get('/remove/{id}', 'MajorsController@remove')->name('majors/remove');

            ////////////////////////////////////////////////////////////////Kéo api
            /**
             * Lấy danh sách bằng api YES
             */
            Route::get('/api', 'MajorsApiController@index')->name('majors/api');
        });

        /**
         * Quản lý mục lớn >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'category'],function(){
            /**
             * Danh sách các mục lớn YES
             */
            Route::get('/', 'CategoryController@index')->name('category/index');

            /**
             * Thêm mục lớn YES
             */
            Route::post('/create', 'CategoryController@create')->name('category/create');

            /**
             * Sửa mục lớn YES
             */
            Route::post('/change', 'CategoryController@change')->name('category/change');

            /**
             * Xóa tạm mục lớn YES
             */
            Route::get('/hide/{id}', 'CategoryController@hide')->name('category/hide');

            /**
             * Khôi phục mục lớn
             */
            Route::get('/undo/{id}', 'CategoryController@undo')->name('category/undo');

            /**
             * Khôi xóa vĩnh viễn mục lớn
             */
            Route::get('/remove/{id}', 'CategoryController@remove')->name('category/remove');

            /**
             * Danh sách các mục con bằng api YES
             */
            Route::get('/api', 'CategoryApiController@index')->name('category/api');

            /**
             * Danh sách mục lớn bằng api YES
             */
            Route::get('/api/list', 'CategoryApiController@list')->name('category/api/list');

            /**
             * Thông tin mục lớn bằng api YES
             */
            Route::get('/api/search/{id}', 'CategoryApiController@search')->name('category/api/search');

            /**
             * Thông tin mục lớn với đầy đủ mục con bằng api
             */
            Route::get('/api/search_full/{id}', 'CategoryApiController@search_full_child')->name('category/api/search_full');

        });

        /**
         * Quản lý mục con >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'child'],function(){
            /**
             * Lấy thông tin danh sách mục con YES
             */
            Route::get('/', 'CategoryChildController@index')->name('child/index');

            /**
             * Thêm mục con YES
             */
            Route::post('/create', 'CategoryChildController@create')->name('child/create');

            /**
             * Sửa mục con YES
             */
            Route::post('/change', 'CategoryChildController@change')->name('child/change');

            /**
             * Ẩn mục con YES
             */
            Route::get('/hide/{id}', 'CategoryChildController@hide')->name('child/hide');

            /**
             * Khôi phục mục con YES
             */
            Route::get('/undo/{id}', 'CategoryChildController@undo')->name('child/undo');

            /**
             * Xóa vĩnh viễn mục con YES
             */
            Route::get('/remove/{id}', 'CategoryChildController@remove')->name('child/remove');


            /**
             * Lấy danh sach mục con bang api YES
             */
            Route::get('/api', 'CategoryChildApiController@index')->name('child/api');

            /*
             * Lấy info thông tin mục con bằng api YES
             */
            Route::get('/api/search/{id}', 'CategoryChildApiController@search')->name('child/api/search');
        });

        /**
         * Quản lý phân quyền >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'roles'],function(){
            /**
             * Danh sách phân quyền YES
             */
            Route::get('/', 'RolesController@index')->name('roles/index');

            /**
             * Thêm phân quyền YES
             */
            Route::post('/create', 'RolesController@create')->name('roles/create');

            /**
             * Sửa phân quyền YES
             */
            Route::post('/change', 'RolesController@change')->name('roles/change');

            /**
             * Ẩn phân quyền YES
             */
            Route::get('/hide/{id}', 'RolesController@hide')->name('roles/hide');

            /**
             * Khôi phục YES
             */
            Route::get('/undo/{id}', 'RolesController@undo')->name('roles/undo');

            /**
             * Xóa phân quyền YES
             */
            Route::get('/remove/{id}', 'RolesController@remove')->name('roles/remove');

            /**
             * Lấy danh sách phân quyền bằng api YES
             */
            Route::get('/api', 'RolesApiController@index')->name('roles/api');
        });

        /**
         * Quản lý bảng đăng ký >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'point'],function(){


            /**
             * Bảng đăng ký học viên YES
             */
            Route::get ('/registration/{id}', 'RegistrationController@registration')->name('point/registration');

            /**
             * Bảng điểm học viên YES ***
             */
            Route::get ('/result/{id}', 'ResultPointController@result')->name('point/result');

            /**
             * Thay đổi đăng ký YES
             */
            Route::post('/change', 'RegistrationController@change')->name('point/change');

            /**
             * Lấy bảng đăng ký học viên ??
             */
            Route::get('registration/api/full', 'RegistrationApiController@search_full_child')->name('point/registration/api/full');

            //Lấy thông tin danh sách ??
            Route::get('/', 'RegistrationController@index')->name('point/index');
            //Lấy tất cả học sinh trong lớp đó ??
            Route::get ('/class/{id}', 'RegistrationController@class')->name('point/class');

        });

        /**
         * Quản lý kết quả >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'result'],function(){
            //Thêm
            Route::any('/api/create', 'ResultPointApiController@create')->name('result/api/create');
            //Lấy info thông tin với bằng api truyền vào cập nhật
            Route::get('/api/info/{id}', 'ResultPointApiController@info')->name('result/api/info');
            //Lấy chi tiết mục con
            Route::get('/api/child/detail', 'ResultPointApiController@child_detail')->name('result/api/child/detail');
            //Sửa
            Route::any('/api/change', 'ResultPointApiController@change')->name('result/api/change');
            //Xóa
            Route::any('/api/remove', 'ResultPointApiController@remove')->name('result/api/remove');
            //Lấy điểm chu kỳ hiện tại của một học viên
            Route::get('/api/get/point', 'ResultPointApiController@getPointOnChild')->name('result/api/get/point');
            //Lấy điểm chu kỳ hiện tại của một học viên
            Route::get('/api/get/log', 'ResultPointApiController@getLogOnChild')->name('result/api/get/log');
            //Lấy ra các sự kiện gợi ý
            Route::get('/api/get/suggest', 'ResultPointApiController@getChildSuggest')->name('result/api/get/suggest');
            //Tính toán tổng điểm chu kỳ cho mục con hiện tại
            Route::get('/api/get/point/sum', 'ResultPointApiController@getSumPointOnChild')->name('result/api/get/point/sum');
            //Tính toán tổng điểm tích lũy cho mục con hiện tại
            Route::get('/api/get/log/sum', 'ResultPointApiController@getSumLogOnChild')->name('result/api/get/log/sum');

        });

        /**
         * Quản lý phân công >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
         */
        Route::group(['prefix' => 'assignment'],function(){
            //Hiển thị
            Route::get('/list_class', 'AssignmentController@list_class')->name('assignment/list_class');
            Route::get ('/result/{id}', 'AssignmentController@result')->name('assignment/result');
            //Thêm
            Route::post('/api/create', 'AssignmentApiController@create')->name('assignment/api/create');
            //Lấy info thông tin với con bằng api
            Route::get('/api/info/{id}', 'AssignmentApiController@info')->name('assignment/api/info');
            //Sửa
            Route::post('/api/change', 'AssignmentApiController@change')->name('assignment/api/change');
            //Xóa
            Route::get('/api/remove/{id}', 'AssignmentApiController@remove')->name('assignment/api/remove');
        });

        Route::group(['prefix' => 'permission'],function(){
            //Hiển thị
            Route::get('/{id}', 'PermissionController@index')->name('permission');

            /**
             * Hiển thị danh sách được truy cập của một phân quyền  YES
             */
            Route::get('/api/{id}', 'RoutePermissionApiController@index')->name('permission/api');

            /**
             * Thêm route vào hệ thống  YES
             */
            Route::post('create', 'PermissionController@create')->name('permission/create');
            //Xóa
            Route::get('/api/remove/{id}', 'RoutePermissionApiController@remove')->name('permission/api/remove');
        });
        //Danh sách chưa được truy cập
        Route::get('api/route/{id}', 'RoutePermissionApiController@getRouteList')->name('get/route/list');
        Route::post('users/resetPass', 'UsersController@resetPass')->name('users/resetPass');


    });

    Route::group(['prefix' => 'teacher'],function(){
        //Hiển thị
        Route::get('/list_class', 'TeacherController@list_class')->name('teacher/list_class');
        Route::get ('/result/{id}', 'TeacherController@result')->name('teacher/result');
        //Thêm
        Route::post('/api/create', 'TeacherApiController@create')->name('teacher/api/create');
        //Lấy info thông tin với con bằng api
        Route::get('/api/info/{id}', 'TeacherApiController@info')->name('teacher/api/info');
        //Sửa
        Route::post('/api/change', 'TeacherApiController@change')->name('teacher/api/change');
        //Xóa
        Route::get('/api/remove/{id}', 'TeacherApiController@remove')->name('teacher/api/remove');
    });

});