<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Albums;
use App\Models\Tracks;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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

	public static function GetAlbums($returnHowArray = false)
	{
		
		setcookie('music_type', 'albums', time() + 3600, '/');

		$userId = \Auth::check() ? \Auth::user()->user_id : 0;

		$albums = Albums::where('albums.album_id', '>', 0)
			->leftJoin('albums_in_artists', 'albums_in_artists.album_id', '=', 'albums.album_id')
			->leftJoin('artists', 'artists.artist_id', '=', 'albums_in_artists.artist_id');

		if (\Input::has('search_singer'))
		{
			$singer = \Input::get('search_singer');
			if ($singer != '')
				$albums = $albums->where('albums.artist_name', 'LIKE', '%' . $singer . '%');
		}
		if (\Input::has('search_song'))
		{
			$song = \Input::get('search_song');
			if ($song != '')
				$albums = $albums->where('albums.album_name', 'LIKE', '%' . $song . '%');
		}
		if (\Input::has('genre'))
		{
			$genre = \Input::get('genre');
			if ($genre != '')
				$albums = $albums->where('albums.genre_id', '=', $genre);
		}

		$albums = $albums->get();

		if ($returnHowArray)
			return $albums;

		echo json_encode($albums);
	}

	public static function GetTracks($returnHowArray = false)
	{
		setcookie('music_type', 'tracks', time() + 3600, '/');

		$userId = \Auth::check() ? \Auth::user()->user_id : 0;

//		$tracks = Tracks::select(\DB::raw("*, (SELECT track_in_user_id FROM tracks_in_users WHERE tracks_in_users.user_id = {$userId} AND tracks_in_users.track_id = tracks.track_id) as exist_id"))
//			->leftJoin('genres', 'genres.genre_id', '=', 'tracks.genre_id')
//			->where('tracks.is_copy', '=', 0);

		$tracks = Tracks::select(\DB::raw("*, (SELECT track_in_user_id FROM tracks_in_users WHERE tracks_in_users.user_id = {$userId} AND tracks_in_users.track_id = tracks.track_id) as exist_id"))
			->leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks.track_id')
			->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')
			->leftJoin('tracks_in_genres', 'tracks_in_genres.track_id', '=', 'tracks.track_id')
			->leftJoin('genres', 'genres.genre_id', '=', 'tracks_in_genres.genre_id')
			->where('tracks.is_copy', '=', 0);

		if (\Input::has('search_singer'))
		{
			$singer = \Input::get('search_singer');
			if ($singer != '')
				$tracks = $tracks->where('tracks.artist_name', 'LIKE', '%' . $singer . '%');
		}
		if (\Input::has('search_song'))
		{
			$song = \Input::get('search_song');
			if ($song != '')
				$tracks = $tracks->where('tracks.track_name', 'LIKE', '%' . $song . '%');
		}
		if (\Input::has('genre'))
		{
			$genre = \Input::get('genre');
			if ($genre != '')
				$tracks = $tracks->where('genres.genre_id', '=', $genre);
		}

		$tracks = $tracks->get();

		if ($returnHowArray)
			return $tracks;

		echo json_encode($tracks);
	}

	public static function AuthCheck()
	{
		if(\Auth::check()) {
			return true;
		}

		return false;
	}
}
