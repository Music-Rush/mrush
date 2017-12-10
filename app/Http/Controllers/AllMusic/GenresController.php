<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Genres;
use App\Models\TracksInGenres;
use Illuminate\Http\Request;

class GenresController extends Controller
{
    public static function Create($genreName)
    {
        $genre = Genres::where('genre_name', '=', $genreName)->first();

        if (is_null($genre))
        {
            $genre = new Genres();
            $genre->genre_name = $genreName;
            $genre->save();
        }

        return $genre->genre_id;
    }

    public static function AssociateWithTrack($trackId, $genreId)
    {
        $trackInGenres = TracksInGenres::where('track_id', '=', $trackId)
            ->where('genre_id', '=', $genreId)
            ->get();

        if(!is_null($trackInGenres)) {
            return $trackInGenres->track_in_genre_id;
        }

        $trackInGenres = new TracksInGenres();

        $trackInGenres->track_id = $trackId;
        $trackInGenres->genre_id = $genreId;

        $trackInGenres->save();

        return $trackInGenres->track_in_genre_id;
    }
}
