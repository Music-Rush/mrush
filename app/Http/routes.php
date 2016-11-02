<?php

Route::get('/', 'HomeController@index');
Route::get('/home', function(){
	return redirect('/');
});

Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);

Route::get('/signin', 'Auth\AuthController@getLogin');
Route::post('/signin', 'Auth\AuthController@postLogin');
Route::get('/signup', 'Auth\AuthController@getRegister');
Route::post('/singup', 'Auth\AuthController@postRegister');
Route::get('/logout', 'Auth\AuthController@getLogout');
