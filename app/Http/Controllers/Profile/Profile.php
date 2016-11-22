<?php namespace App\Http\Controllers\Profile;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Routing\Route;

class Profile extends Controller
{
	public function index(Request $request)
	{
		$data = [
			'title' => 'My profile',
			'styles' => [
				'profile.css'
			]
		];
		if((\Route::input("type") == null) || (\Route::input("type") == "tracks"))
		{
			$data['content'] = "tracks";
		}
		else if(\Route::input("type") == "playlists")
		{
			$data['content'] = "playlists";
		}
		else if(\Route::input("type") == "albums")
		{
			$data['content'] = "albums";
		}
		else if(\Route::input("type") == "mycommunities")
		{
			$data['content'] = "mycommunities";
		}
		else if(\Route::input("type") == "settings")
		{
			$data['content'] = "settings";
		}

		if ($request->ajax())
			return view('pages.profile.profile', $data);
		else
			return view('pages.profile.profile-section', $data);
	}
}
