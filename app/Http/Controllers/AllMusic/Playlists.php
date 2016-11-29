<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class Playlists extends Controller
{
    public function Create()
    {
        $playlistName = \Input::get('playlist_name');

        
    }
}
