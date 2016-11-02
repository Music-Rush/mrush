<?php namespace App\Http\Controllers;

class HomeController extends Controller
{
	/*public function __construct()
	{
		$this->middleware('auth');
	}*/

	public function index()
	{
		$data = [
			'title' => 'Music Rush'
		];

		return view('pages.home.home', $data);
	}

}
