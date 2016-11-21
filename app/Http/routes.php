<?php

Route::get('/', 'HomeController@index');
Route::get('/home', function(){
	return redirect('/');
});

Route::group(['middleware' => 'auth'], function(){
	Route::get('/profile/{type?}', 'Profile\Profile@index');
	Route::post('/tracks/upload', 'AllMusic\Tracks@Create');
});

Route::get('/allmusic', 'AllMusic\AllMusic@index');
Route::post('/allmusic/tracks', 'AllMusic\AllMusic@GetTracks');
Route::post('/allmusic/albums', 'AllMusic\AllMusic@GetAlbums');

Route::get('/signin', 'Auth\AuthController@getLogin');
Route::post('/signin', 'Auth\AuthController@postLogin');
Route::post('/signin/ajax', 'Auth\AuthController@ajaxLogin');
Route::get('/signup', 'Auth\AuthController@getRegister');
Route::post('/signup', 'Auth\AuthController@postRegister');
Route::get('/logout', 'Auth\AuthController@getLogout');

Route::get('/concerts', 'Concerts\Concerts@index');
Route::match(['get', 'post'], '/concerts/getConcerts', 'Concerts\Concerts@getConcerts');
