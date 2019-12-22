<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::group([
    'prefix' => 'auth'
], function () {
    Route::post('login', 'AuthController@login');

    Route::group([
        'middleware' => 'auth:api'
    ], function() {
        Route::get('logout', 'AuthController@logout');
    });
});

//Phân quyền ****************************************************************************
Route::group(['prefix' => 'roles'],function (){
    Route::group(['middleware' => 'auth:api'],function (){
        //Tất cả phân quyền
        Route::get('index', 'RolesApiController@index');
        //Thêm một phân quyền
        Route::post('create','RolesApiController@create');
        //Sửa một phân quyền cho phép
        Route::put('change','RolesApiController@change');
        //Xóa tạm một phân quyền
        Route::put('hide','RolesApiController@hide');
        //Xóa vĩnh viễn một phân quyền
        Route::delete('remove','RolesApiController@remove');


    });
});

//Tài khoản  ****************************************************************************
Route::group(['prefix' => 'user'], function () {
    Route::group(['middleware' => 'auth:api'], function() {
        //Danh sách tài khoản theo một phân quyền nào đó
        Route::get('index', 'UsersApiController@index');
        //Chi tiết một tài khoản
        Route::get('profile','UsersApiController@profile');
        //Thêm một tài khoản
        Route::post('create','UsersApiController@create');
        //Sửa một tài khoản
        Route::put('change', 'UsersApiController@change');
        //Đổi phân quyền một tài khoản
        Route::put('rerole', 'UsersApiController@rerole');
        //Block một tài khoản
        Route::put('block','UsersApiController@block');
        //Xóa tạm một tài khoản
        Route::put('hide', 'UsersApiController@hide');
        //Xóa vĩnh diễn một tài khoản
        Route::delete('remove','UsersApiController@remove');

        //Đếm số lượng theo phân quyền
        Route::get('count','UsersApiController@count');
    });
});

//Năm học ******************************************************************************
Route::group(['prefix'=>'year'],function (){
    Route::group(['middleware' => 'auth:api'],function (){
        //Danh sách các khóa
        Route::get('index', 'SchoolYearApiController@index');
        //Thêm một khóa
        Route::post('create','SchoolYearApiController@create');
        //Sửa tên một khóa
        Route::put('change','SchoolYearApiController@change');
        //Xóa tạm một khóa
        Route::put('hide', 'SchoolYearApiController@hide');
        //Xóa vĩnh viễn một khóa
        Route::delete('remove','SchoolYearApiController@remove');
    });
});

//Lớp học ****************************************************************************
Route::group(['prefix'=>'class'],function (){
    Route::group(['middleware'=>'auth:api'],function (){
        //Danh sách các lớp
        Route::get('index','ClassApiController@index');
        //Thêm một lớp
        Route::post('create','ClassApiController@create');
        //Sửa một lớp
        Route::put('change','ClassApiController@change');
        //Xóa tạm một lớp
        Route::put('hide','ClassApiController@hide');
        //Xóa vĩnh viễn một lớp
        Route::delete('remove','ClassApiController@remove');


        //Danh sách các học sinh thuộc lớp
        Route::get('member', 'ClassApiController@member');
        //Danh sách các học sinh không thuộc lớp
        Route::get('outside', 'ClassApiController@outside');
        //Thêm học sinh cho lớp đó
        Route::post('add/student','ClassApiController@add_student');
        //Xóa học sinh khỏi lớp
        Route::delete('remove/student', 'ClassApiController@remove_student');

    });
});


//Mục lớn
Route::group(['prefix' => 'category'],function (){
    Route::group(['middleware' => 'auth:api'],function (){
        //Danh sách các mục lớn
        Route::get('index', 'CategryApiController@index');
        //Thêm một mục lớn
        Route::post('create', 'CategoryApiController@create');
        //Sửa một mục lớn
        Route::put('change','CategoryApiController@change');
        //Xóa tạm một mục lớn
        Route::put('hide', 'CategoryApiController@hide');
        //Xóa vĩnh viễn một mục lớn
        Route::delete('remove','CategoryApiController@remove');

        //Danh sách mục lớn và mục con đầy đủ
        Route::get('full', 'CategoryApiController@full');
    });
});

//Mục con
Route::group(['prefix' => 'child'],function (){
    Route::group(['middleware' => 'auth:api'],function (){
        //Thêm mục con
        Route::post('create','CategoryChildApiController@create');
        //Sửa mục con
        Route::put('change','CategoryChildApiController@change');
        //Xóa tạm một mục
        Route::put('hide','CategoryChildApiController@hide');
        //Xóa vĩnh viễn một mục
        Route::delete('remove', 'CategoryChildApiController@remove');
    });
});

//Chu kỳ
Route::group(['prefix' => 'cycle'],function (){
    Route::group(['middleware' => 'auth:api'],function (){
        //Hiển thị các chu kỳ
        Route::get('index','CycleApiController@index');
        //Thêm một chu kỳ
        Route::post('create', 'CycleApiController@create');
        //Sửa một chu kỳ
        Route::put('change','CycleApiController@change');
        //Xóa tạm một chu kỳ
        Route::put('hide','CycleApiController@hide');
        //Xóa vĩnh viễn một chu kỳ
        Route::delete('remove','CycleApiController@remove');
    });
});

//Bộ chọn cho chu kỳ
Route::group(['prefix' => 'select'],function (){
    Route::group(['middleware'=> 'auth:api'],function (){
        //Danh sách bộ chọn cho một chu kỳ
        Route::get('index','CycSelectApiController@index');
        //Thêm một bộ chọn
        Route::post('create','CycSelectApiController@create');
        //Sửa một bộ chọn
        Route::put('change','CycleSelectApiController@change');
        //Xóa một bộ chọn
        Route::put('hide','CycleSelectApiController@hide');

    });
});

//Thực thể cho một chu kỳ

Route::group(['prefix' => 'entity'],function (){
    Route::group(['middleware'=> 'auth:api'],function (){
        //Danh sách bộ chọn cho một chu kỳ
        Route::get('index','EntityCycleApiController@index');
        //Thêm một thực thể
        Route::post('create','EntityCycleApiController@create');
        //Sửa một thực thể
        Route::put('change','EntityCycleApiController@change');
        //Xóa một thực thể
        Route::put('hide','EntityCycleApiController@hide');

    });
});

//Bảng đăng ký

Route::group(['prefix' => 'point'],function (){
    Route::group(['middleware'=> 'auth:api'],function (){
        //Danh sách bảng đăng ký
        Route::get('index','RegistrationApiController@index');
        //Thêm một bảng đăng ký, khi sinh viên được thêm
        Route::post('create','RegistrationApiController@create');
        //Sửa một bảng đăng ký
        Route::put('change','RegistrationApiController@change');
        //Xóa một bảng đăng ký
        Route::put('hide','RegistrationApiController@hide');
    });
});

//Hoạt động
Route::group(['prefix' => 'active'],function(){
    Route::group(['middleware' => 'auth:api'],function (){
        Route::get('index', 'ActiveApiController@index');
        Route::post('create', 'ActiveApiController@create');
        Route::put('change','ActiveApiController@change');
        Route::put('hide','ActiveApiController@hide');
        Route::delete('remove','ActiveApiController@remove');
    });
});

//Phân công cho mỗi hoạt động
Route::group(['prefix' => 'achievement'],function(){
    Route::group(['middleware' => 'auth:api'],function (){
        Route::get('index', 'ActiveAchievementApiController@index');
        Route::post('create', 'ActiveAchievementApiController@create');
        Route::put('change','ActiveAchievementApiController@change');
        Route::put('hide','ActiveAchievementApiController@hide');
        Route::delete('remove','ActiveAchievementApiController@remove');
    });
});


