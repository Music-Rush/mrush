<?php namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
	/*public function __construct()
	{
		$this->middleware('auth');
	}*/

	public function index(Request $request)
	{
		$data = [
			'title' => 'Music Rush'
		];

		if ($request->ajax())
			return view('pages.home.home');
		else
			return view('pages.home.home-section', $data);
	}

}
