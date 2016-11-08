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
		$item['album_image'] = 'picture';
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
		$item['track_image'] = 'picture';
		$tracks[] = $item;

		echo json_encode($tracks);
	}
}
