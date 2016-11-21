<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Artists as ArtistsModel;

use App\Models\TracksInArtists;
use Illuminate\Http\Request;

class Artists extends Controller
{
    public static function Create($artistName)
    {
        $artist = ArtistsModel::where('artist_name', '=', $artistName)->first();

        if (is_null($artist))
        {
            $artist = new ArtistsModel();
            $artist->artist_name = $artistName;
            $artist->save();
        }

        return $artist->artist_id;
    }

    public static function AssociateWithTrack($trackId, $artistId)
    {
        $trackInArtists = new TracksInArtists();
        
        $trackInArtists->track_id = $trackId;
        $trackInArtists->artist_id = $artistId;

        $trackInArtists->save();

        return $trackInArtists->track_in_artist_id;
    }
}
