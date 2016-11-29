<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class Communities extends Controller 
{
    public function Index(Request $request)
    {
        $data = [
            'title' => 'Communities',
            'styles' => [
                'allmusic.css',
                'tracks.css',
                'community.css'
            ]
        ];

        if ($request->ajax())
            return view('pages.allmusic.communities');
        else
            return view('pages.allmusic.communities-section', $data);
    }
}
