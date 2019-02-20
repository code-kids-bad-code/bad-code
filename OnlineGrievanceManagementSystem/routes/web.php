<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */
function cannotProcessData(){
	return response("Cannot Process Data",412);
}

Route::get('/', function () {
    return View::make('index');
});


Route::get('/testPartial', function () {
    return view('partials/testPartial');
});

Route::get('/testTemplate', function(){
    return view('templates/testTemplate');
});

Route::post('/register','LoginController@register');

Route::post('/grievances', 'grievanceController@showOpenGrievances');

Route::middleware('auth.basic')->group(function(){
	Route::post('/login','LoginController@checkAuth');
});


Route::get('/ui_gridSample', function(){
    return view('templates/ui_gridSample');
});

