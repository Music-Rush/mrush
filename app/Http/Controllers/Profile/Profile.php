<?php namespace App\Http\Controllers\Profile;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class Profile extends Controller
{
	public function index()
	{
		$data = [
			'title' => 'My profile',
			'styles' => [
				'profile.css'
			]
		];

		return view('pages.profile.profile', $data);
	}
}
