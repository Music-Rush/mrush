<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Albums as AlbumsModel;
use App\Models\AlbumsInArtists;
use App\Models\AlbumsInUsers;
use App\Models\TracksInAlbums;
use Illuminate\Http\Request;

class Albums extends Controller {

	public function Create()
    {
        $result = false;
        $userId = \Auth::user()->user_id;
        $artistName = $_POST['artist_name'];
        $albumName = $_POST['album_name'];
        $albumYear = $_POST['album_year'];
        $tracksList = array();
        $tracksList = $_POST['tracks_list'];
        $trackCount = $_POST['count_track'];

        $artistId = Artists::Create($artistName);

        $tracksId = preg_split("/,/", $tracksList);

        //return json_encode($_FILES['file']);

        $addedAlbum = new AlbumsModel();

        if(isset($_POST['file']))
        {
            //noph
            $addedAlbum->album_name = $albumName;
            $addedAlbum->album_year = $albumYear;
            $addedAlbum->album_photo = $_POST['file'];
        }
        else
        {
            //yesph
            $file = $_FILES['file'];
            $addedAlbum->album_name = $albumName;
            $addedAlbum->album_year = $albumYear;
            $addedAlbum->album_photo = $file['name'];

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

        $addedAlbum->save();

        if($trackCount != 0)
        {
            for($i = 0; $i < $trackCount; $i++)
            {
                Albums::AssociateWithAlbums($tracksId[$i], $addedAlbum->album_id);
            }
        }

        Albums::AssociateWithUsers(\Auth::user()->user_id, $addedAlbum->album_id);
        Albums::AssociateWithArtist($artistId, $addedAlbum->album_id);

        return json_encode($addedAlbum);
    }

    public static function  AssociateWithArtist($artistId, $albumId)
    {
        $albumInArtist = AlbumsInArtists::where('album_id', '=', $albumId)
            ->where('artist_id', '=', $artistId)
            ->first();

        if(!is_null($albumInArtist)) {
            return;
        }

        $albumInArtist = new AlbumsInArtists();

        $albumInArtist->artist_id = $artistId;
        $albumInArtist->album_id = $albumId;

        $albumInArtist->save();

    }

    public static function AssociateWithAlbums($trackId, $albumId)
    {
        $trackInAlbums = TracksInAlbums::where('album_id', '=', $albumId)
            ->where('track_id', '=', $trackId)
            ->first();

        if(!is_null($trackInAlbums)) {
            return;
        }

        $trackInAlbums = new TracksInAlbums();

        $trackInAlbums->track_id = $trackId;
        $trackInAlbums->album_id = $albumId;

        $trackInAlbums->save();
        //return $trackInAlbums->track_in_album_id;
    }

    public static function AssociateWithUsers($userId, $albumId)
    {
        $albumsInUsers = AlbumsInUsers::where('album_id', '=', $albumId)
            ->where('user_id', '=', $userId)
            ->first();

        if(!is_null($albumsInUsers)) {
            return $albumsInUsers->album_in_user_id;
        }

        $albumsInUsers = new AlbumsInUsers();

        $albumsInUsers->user_id = $userId;
        $albumsInUsers->album_id = $albumId;

        $albumsInUsers->save();

        return $albumsInUsers->album_in_user_id;
    }

    public static function GetUserAlbums($userId)
    {
        /*$tracks = TracksInUsers::leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks_in_users.track_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')
            ->leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_users.track_id')
            ->where('tracks_in_users.user_id', '=', $userId)->orderBy('tracks_in_users.track_in_user_id', 'desc')->get();*/

        $albums = AlbumsInUsers::leftJoin('albums', 'albums.album_id', '=', 'albums_in_users.album_id')
            ->leftJoin('albums_in_artists', 'albums_in_artists.album_id', '=', 'albums.album_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'albums_in_artists.artist_id')
            ->where('albums_in_users.user_id', '=', $userId)
            ->orderBy('albums_in_users.album_in_user_id', 'desc')
            ->get();

        return $albums;
    }

    public static function GetAlbumTracks()
    {
        $albumId = \Route::input("album_id");

        $tracks = TracksInAlbums::leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_albums.track_id')
            ->where('tracks_in_albums.album_id', '=', $albumId)
            ->leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks.track_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')
            ->leftJoin('tracks_in_genres', 'tracks_in_genres.track_id', '=', 'tracks.track_id')
            ->leftJoin('genres', 'genres.genre_id', '=', 'tracks_in_genres.genre_id')
            ->get();

        return json_encode($tracks);
    }

    public static function GetAlbumById()
    {
        $userId = \Auth::user()->user_id;
        $albumId = \Route::input("album_id");

        $album = AlbumsModel::leftJoin('albums_in_users', 'albums_in_users.album_id', '=', 'albums.album_id')
            ->where('albums_in_users.user_id', '=', $userId)
            ->where('albums.album_id', '=', $albumId)
            ->leftJoin('albums_in_artists', 'albums_in_artists.album_id', '=', 'albums.album_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'albums_in_artists.artist_id')
            ->first();

        $tracks = TracksInAlbums::leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_albums.track_id')
            ->leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks.track_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')
            ->where('tracks_in_albums.album_id', '=', $albumId)
            ->get();

        $result['album'] = $album;
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

    public static function AlbumEdit()
    {
        $result = false;
        $userId = \Auth::user()->user_id;
        $albumId = \Route::input('album_id');
        $artistName = $_POST['artist_name'];
        $albumName = $_POST['album_name'];
        $albumYear = $_POST['album_year'];
        $tracksList = array();
        $tracksList = $_POST['tracks_list'];
        $trackCount = $_POST['count_track'];

        $artistId = Artists::Create($artistName);
        $tracksId = preg_split("/,/", $tracksList);

        $addedAlbum = AlbumsModel::where('albums.album_id', '=', $albumId)
            ->first();

        //return json_encode($_FILES['file']);

        if(isset($_POST['file']))
        {
            //noph
            $addedAlbum->album_name = $albumName;
            $addedAlbum->album_year = $albumYear;
            $addedAlbum->album_photo = $_POST['file'];
        }
        else
        {
            //yesph
            $file = $_FILES['file'];
            $addedAlbum->album_name = $albumName;
            $addedAlbum->album_year = $albumYear;
            $addedAlbum->album_photo = $file['name'];

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

        $addedAlbum->save();

//        dd($tracksList);
        TracksInAlbums::where('tracks_in_albums.album_id', '=', $albumId)
            ->delete();

        if($trackCount != 0)
        {
            for($i = 0; $i < $trackCount; $i++)
            {
                Albums::AssociateWithAlbums($tracksId[$i], $albumId);
            }
        }

        Albums::AssociateWithArtist($artistId, $albumId);
        $album = \App\Models\Albums::where('albums.album_id', '=', $albumId)
            ->leftJoin('albums_in_artists', 'albums_in_artists.album_id', '=', 'albums.album_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'albums_in_artists.artist_id')
            ->first();
        return json_encode($album);
    }

    public static function AlbumAddToUser()
    {
        $albumInUser = Albums::AssociateWithUsers(\Auth::user()->user_id, \Route::input('album_id'));

        $result['status'] = false;
        if (!is_null($albumInUser))
        {
            $result['status'] = true;
        }

        echo json_encode($result);
    }

    public static function AlbumDeleteFromUser()
    {
        $userId = \Auth::user()->user_id;
        $albumId = \Route::input('album_id');
        $albumInUser = AlbumsInUsers::where('user_id', '=', $userId)
            ->where('album_id', '=', $albumId)
            ->orderBy('album_in_user_id', 'desc')
            ->first();

        $result['status'] = false;
        if($albumInUser->delete())
            $result['status'] = true;


        echo json_encode($result);
    }
}
