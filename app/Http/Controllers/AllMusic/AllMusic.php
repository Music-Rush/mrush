<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Tracks;
use Illuminate\Http\Request;

class AllMusic extends Controller {

	public function index()
	{
		$data = [
			'title' => 'All music',
			'styles' => [
				'allmusic.css',
				'tracks.css'
			]
		];

		return view('pages.allmusic.allmusic', $data);
	}

	public function GetAlbums()
	{
		
		setcookie('music_type', 'albums', time() + 3600, '/');
		$albums = array();
		$item['artist_name'] = 'Kek';
		$item['album_name'] = 'Lol album';
		$item['year'] = 2016;
		$item['album_image'] = 'https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max';
		$albums[] = $item;

		echo json_encode($albums);
	}

	public function GetTracks()
	{
		setcookie('music_type', 'tracks', time() + 3600, '/');
		$tracks = array();
		$item['track_name'] = 'Kek track';
		$item['artist_name'] = 'Lol';
		$item['year'] = 2016;
		$item['track_image'] = 'https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max';
		$tracks[] = $item;

		echo json_encode($tracks);
	}
}
