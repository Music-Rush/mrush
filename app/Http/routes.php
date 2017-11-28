<?php

Route::get('/', 'HomeController@index');
Route::get('/home', function(){
	return redirect('/');
});

Route::group(['middleware' => 'auth'], function(){
	Route::match(['get', 'post'], '/profile/tracks/{track_id}/delete', 'AllMusic\Tracks@DeleteTrackFromUserTracks');
	Route::get('/profile/{type?}', 'Profile\Profile@index');
	Route::post('/tracks/upload', 'AllMusic\Tracks@Create');
	Route::post('/profile/tracks/{track_id}/add', 'AllMusic\Tracks@AddTrackToUserList');
	Route::post('/profile/tracks/{track_id}/get', 'AllMusic\Tracks@GetTrackById');
	Route::post('/profile/tracks/{track_id}/edit', 'AllMusic\Tracks@SaveTrackChanges');
	Route::post('/profile/albums/add', 'AllMusic\Albums@Create');
	Route::post('/profile/albums/{album_id}/getAlbumTracks', 'AllMusic\Albums@GetAlbumTracks');
	Route::post('/profile/albums/{album_id}/getAlbumById', 'AllMusic\Albums@GetAlbumById');
	Route::post('/profile/albums/{album_id}/edit', 'AllMusic\Albums@AlbumEdit');
	Route::get('/profile/playlists', 'AllMusic\Playlists@GetUserPlaylists');
	Route::post('/profile/playlists/add', 'AllMusic\Playlists@Create');
	Route::post('/profile/playlists/{playlist_id}/getPlaylistTracks', 'AllMusic\Playlists@GetPlaylistTracks');
	Route::post('/profile/playlists/{playlist_id}/getPlaylistById', 'AllMusic\Playlists@GetPlaylistById');
	Route::post('/profile/playlists/{playlist_id}/edit', 'AllMusic\Playlists@PlaylistEdit');
	Route::post('/community/create', 'AllMusic\Communities@Create');
	Route::post('/comments/create', 'AllMusic\Comments@Create');
	Route::post('/communities/{community_Id}/join', 'AllMusic\Communities@Join');
	Route::post('/communities/{community_id}/leave', 'AllMusic\Communities@Leave');
	Route::post('/profile/mycommunities', 'AllMusic\Communities@GetUserCommunity');
});

Route::get('/communities/{community_id}', 'AllMusic\Communities@GetCommunity');
Route::get('/communities', 'AllMusic\Communities@index');

//Route::post('/track/{track_id}/info', 'AllMusic\Tracks@Info');

Route::post('/track/info', 'AllMusic\Tracks@Info');

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
