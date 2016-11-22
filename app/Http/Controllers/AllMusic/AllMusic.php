<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Tracks;
use Illuminate\Http\Request;
use Illuminate\View\View;

class AllMusic extends Controller {

	public function index(Request $request)
	{
		$data = [
			'title' => 'All music',
			'styles' => [
				'allmusic.css',
				'tracks.css'
			]
		];

		if ($request->ajax())
			return view('pages.allmusic.allmusic');
		else
			return view('pages.allmusic.allmusic-section', $data);
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

	public static function GetTracks($returnHowArray = false)
	{
		setcookie('music_type', 'tracks', time() + 3600, '/');

		$tracks = Tracks::leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks.track_id')
			->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')->get();

		if ($returnHowArray)
			return $tracks;

		echo json_encode($tracks);
	}
}
