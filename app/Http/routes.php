<?php

Route::get('/', 'HomeController@index');
Route::get('/home', function(){
	return redirect('/');
});


Route::get('/allmusic', 'AllMusic\AllMusic@index');
Route::post('/allmusic/tracks', 'AllMusic\AllMusic@GetTracks');
Route::post('/allmusic/albums', 'AllMusic\AllMusic@GetAlbums');

Route::get('/signin', 'Auth\AuthController@getLogin');
Route::post('/signin', 'Auth\AuthController@postLogin');
Route::get('/signup', 'Auth\AuthController@getRegister');
Route::post('/signup', 'Auth\AuthController@postRegister');
Route::get('/logout', 'Auth\AuthController@getLogout');
