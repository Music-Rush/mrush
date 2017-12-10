<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Playlists as PlaylistsModel;
use App\Models\PlaylistsInUsers;
use App\Models\TracksInPlaylists;
use Illuminate\Http\Request;

class Playlists extends Controller
{
    public function Create()
    {
        $result = false;
        $userId = \Auth::user()->user_id;
        $playlistName = $_POST['playlist_name'];
        $tracksList = array();
        $tracksList = $_POST['tracks_list'];
        $trackCount = $_POST['count_track'];

        $tracksId = preg_split("/,/", $tracksList);

        //return json_encode($_FILES['file']);

        $addedPlaylist = new PlaylistsModel();

        if(isset($_POST['file']))
        {
            //noph
            $addedPlaylist->playlist_name = $playlistName;
            $addedPlaylist->playlist_photo = $_POST['file'];
            $addedPlaylist->created_at_user = $userId;
        }
        else
        {
            //yesph
            $file = $_FILES['file'];
            $addedPlaylist->playlist_name = $playlistName;
            $addedPlaylist->playlist_photo = $file['name'];
            $addedPlaylist->created_at_user = $userId;

            $filePath = $_SERVER['DOCUMENT_ROOT'] . '/resources/assets/images/album_images/' . $file['name'];
            if (move_uploaded_file($file['tmp_name'], $filePath))
            {
                $result = true;
            }
            else
            {
                $result = false;
            }
        }

        $addedPlaylist->save();

        if($trackCount != 0)
        {
            for($i = 0; $i < $trackCount; $i++)
            {
                Playlists::AssociateWithPlaylists($tracksId[$i], $addedPlaylist->playlist_id);
            }
        }

        Playlists::AssociateWithUsers(\Auth::user()->user_id, $addedPlaylist->playlist_id);

        return json_encode($addedPlaylist);
    }

    public static function AssociateWithPlaylists($trackId, $playlistId)
    {
        $trackInPlaylists = TracksInPlaylists::where('track_id', '=', $trackId)
            ->where('playlist_id', '=', $playlistId)
            ->first();

        if(!is_null($trackInPlaylists)) {
            return;
        }

        $trackInPlaylists = new TracksInPlaylists();

        $trackInPlaylists->track_id = $trackId;
        $trackInPlaylists->playlist_id = $playlistId;

        $trackInPlaylists->save();

        //return $trackInAlbums->track_in_album_id;
    }

    public static function AssociateWithUsers($userId, $playlistId)
    {
        $playlistInUsers = PlaylistsInUsers::where('user_id', '=', $userId)
            ->where('playlist_id', '=', $playlistId)
            ->first();

        if(!is_null($playlistInUsers)) {
            return;
        }

        $playlistInUsers = new PlaylistsInUsers();

        $playlistInUsers->user_id = $userId;
        $playlistInUsers->playlist_id = $playlistId;

        $playlistInUsers->save();

        //return $trackInAlbums->track_in_album_id;
    }

    public static function GetUserPlaylists()
    {
        /*$tracks = TracksInUsers::leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks_in_users.track_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')
            ->leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_users.track_id')
            ->where('tracks_in_users.user_id', '=', $userId)->orderBy('tracks_in_users.track_in_user_id', 'desc')->get();*/
        $userId = \Auth::user()->user_id;
        $playlists = PlaylistsInUsers::leftJoin('playlists', 'playlists.playlist_id', '=', 'playlists_in_users.playlist_id')
            ->where('playlists_in_users.user_id', '=', $userId)
            ->orderBy('playlists_in_users.playlist_in_user_id', 'desc')
            ->get();

        return $playlists;
    }

    public static function GetPlaylistTracks()
    {
        $userId = \Auth::user()->user_id;
        $playlistId = \Route::input("playlist_id");

        $tracks = TracksInPlaylists::leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_playlists.track_id')
            ->leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks.track_id')
            ->leftJoin('artists', 'tracks_in_artists.artist_id', '=', 'artists.artist_id')
            ->where('tracks_in_playlists.playlist_id', '=', $playlistId)
            ->get();

        return json_encode($tracks);
    }

    public static function GetPlaylistById()
    {
        $userId = \Auth::user()->user_id;
        $playlistId = \Route::input("playlist_id");

        $playlist = PlaylistsModel::leftJoin('playlists_in_users', 'playlists_in_users.playlist_id', '=', 'playlists.playlist_id')
            ->where('playlists_in_users.user_id', '=', $userId)
            ->where('playlists.playlist_id', '=', $playlistId)
            ->first();

        $tracks = TracksInPlaylists::leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_playlists.track_id')
            ->leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks.track_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')
            ->where('tracks_in_playlists.playlist_id', '=', $playlistId)
            ->get();

        $result['playlist'] = $playlist;
        $result['tracks'] = $tracks;

        /*$album = AlbumsInUsers::select(\DB::raw("*", "albums.artist_name as album_artist_name"))
            ->leftJoin('albums', 'albums.album_id', '=', 'albums_in_users.album_id')
            ->leftJoin('tracks_in_albums', 'tracks_in_albums.album_id', '=', 'albums.album_id')
            ->leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_albums.track_id')
            ->where('albums_in_users.user_id', '=', $userId)
            ->where('albums.album_id', '=', $albumId)
            ->first();*/

        return json_encode($result);
    }

    public static function PlaylistEdit()
    {
        $result = false;
        $userId = \Auth::user()->user_id;
        $playlistId = \Route::input('playlist_id');
        $playlistName = $_POST['playlist_name'];
        $tracksList = array();
        $tracksList = $_POST['tracks_list'];
        $trackCount = $_POST['count_track'];

        $tracksId = preg_split("/,/", $tracksList);

        //return json_encode($_FILES['file']);

        $addedPlaylist = PlaylistsModel::where('playlists.playlist_id', '=', $playlistId)
            ->first();

        if(isset($_POST['file']))
        {
            //noph
            $addedPlaylist->playlist_name = $playlistName;
            $addedPlaylist->playlist_photo = $_POST['file'];
            $addedPlaylist->created_at_user = $userId;
        }
        else
        {
            //yesph
            $file = $_FILES['file'];
            $addedPlaylist->playlist_name = $playlistName;
            $addedPlaylist->playlist_photo = $file['name'];
            $addedPlaylist->created_at_user = $userId;

            $filePath = $_SERVER['DOCUMENT_ROOT'] . '/resources/assets/images/album_images/' . $file['name'];
            if (move_uploaded_file($file['tmp_name'], $filePath))
            {
                $result = true;
            }
            else
            {
                $result = false;
            }
        }

        /*$addedPlaylist->save();

        if($trackCount != 0)
        {
            for($i = 0; $i < $trackCount; $i++)
            {
                Playlists::AssociateWithPlaylists($tracksId[$i], $addedPlaylist->playlist_id);
            }
        }

        Playlists::AssociateWithUsers(\Auth::user()->user_id, $addedPlaylist->playlist_id);*/

        $addedPlaylist->save();

        TracksInPlaylists::where('tracks_in_playlists.playlist_id', '=', $playlistId)
            ->delete();

        if($trackCount != 0)
        {
            for($i = 0; $i < $trackCount; $i++)
            {
                Playlists::AssociateWithPlaylists($tracksId[$i], $playlistId);
            }
        }

        $playlist = PlaylistsModel::where('playlist_id', '=', $playlistId)
            ->first();
        return json_encode($playlist);
    }

    public static function PlaylistDelete()
    {
        $userId = \Auth::user()->user_id;
        $playlistId = \Route::input('playlist_id');
        $playlistInUser = PlaylistsInUsers::where('user_id', '=', $userId)
            ->where('playlist_id', '=', $playlistId)
            ->orderBy('playlist_in_user_id', 'desc')
            ->first();

        $result['status'] = false;
        if($playlistInUser->delete())
            $result['status'] = true;


        echo json_encode($result);
    }
}
