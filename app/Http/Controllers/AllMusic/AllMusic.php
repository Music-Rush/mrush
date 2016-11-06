<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class AllMusic extends Controller {

	public function index()
	{
		$data = [
			'title' => 'All music',
			'styles' => [
				'allmusic.css'
			]
		];
		return view('pages.allmusic.allmusic', $data);
	}
}
