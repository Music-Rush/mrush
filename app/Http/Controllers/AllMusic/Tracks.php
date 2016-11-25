<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Artists;
use App\Models\TracksInArtists;
use App\Models\TracksInUsers;
use App\User;
use Illuminate\Http\Request;
use App\Models\Tracks as TracksModel;
use Illuminate\Routing\Route;


class Tracks extends Controller
{
    public function Create()
    {
        $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/resources/tracks/';
        $i = 0;
        foreach ($_FILES as $file)
        {
            $i++;
            $uploadFile = $uploadDir . $file['name'];
            if (move_uploaded_file($file['tmp_name'], $uploadFile)){
                $result['track'][$i] = $this->GetTrackInfo($uploadFile);
                $result['result'][$i] = "Track is uploaded";

                $track = new TracksModel();
                $track->track_name = $result['track'][$i]['name'];
                $track->artist_name = $result['track'][$i]['artist'];
                $track->track_photo = $result['track'][$i]['image_path'];
                $track->track_download_name = $result['track'][$i]['filename'];
                $track->duration = $result['track'][$i]['duration'];
                $track->is_copy = 0;
                $track->created_at_user = \Auth::user()->user_id;
                $track->save();

                Artists::AssociateWithTrack($track->track_id, Artists::Create($result['track'][$i]['artist']));
                $result['track'][$i]['track_in_user_id'] = Tracks::AssociateWithUser(\Auth::user()->user_id, $track->track_id);
                GenresController::AssociateWithTrack($track->track_id, GenresController::Create($result['track'][$i]['genre']));
            }
            else
            {
                $result['result'][$i] = "Error";
            }
        }

        echo json_encode($result['track']);
    }

    public function GetTrackInfo($fileName)
    {
        $getIDObj = new \getID3();
        $getIDObj->encoding = 'UTF-8';
        $getIDObj->analyze($fileName);

        $thisFileInfo = array();

        if(isset($getIDObj->info['comments'])) {
            $picFileName = preg_replace("/\.mp3$/", "", $getIDObj->info['filename']);
            $file = $picFileName . '.jpg';
            $length = $getIDObj->info['comments']['picture'][0]['datalength'];
            $text = $getIDObj->info['comments']['picture'][0]['data'];
            if ($length > 0) {
                $filePath = $_SERVER['DOCUMENT_ROOT'] . '/resources/assets/images/music_images/' . $file;
                file_put_contents($filePath, $text);
                $thisFileInfo['image_path'] = $file;
            } else {
                $thisFileInfo['image_path'] = 'nophoto.jpg';
            }
        }
        else
        {
            $thisFileInfo['image_path'] = 'nophoto.jpg';
        }

        $thisFileInfo['artist'] = isset($getIDObj->info['tags']['id3v2']['artist'][0]) ? $getIDObj->info['tags']['id3v2']['artist'][0] : "Unknown artist";
        $thisFileInfo['name'] = isset($getIDObj->info['tags']['id3v2']['title'][0]) ? $getIDObj->info['tags']['id3v2']['title'][0] : "Unknown";
        $thisFileInfo['genre'] = isset($getIDObj->info['tags']['id3v2']['genre'][0]) ? $getIDObj->info['tags']['id3v2']['genre'][0] : "Other";
        $thisFileInfo['filename'] = $getIDObj->info['filename'];
        $thisFileInfo['duration'] = isset($getIDObj->info['playtime_string']) ? $getIDObj->info['playtime_string'] : 0;

        return $thisFileInfo;
    }

    public static function GetUserTracks($userId)
    {
        /*$tracks = TracksInUsers::leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks_in_users.track_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')
            ->leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_users.track_id')
            ->where('tracks_in_users.user_id', '=', $userId)->orderBy('tracks_in_users.track_in_user_id', 'desc')->get();*/

        $tracks = TracksInUsers::leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_users.track_id')
            ->where('tracks_in_users.user_id', '=', $userId)
            ->orderBy('tracks_in_users.track_in_user_id', 'desc')
            ->get();

        return $tracks;
    }

    public static function AssociateWithUser($userId, $trackId)
    {
        $trackInUsers = new TracksInUsers();

        $trackInUsers->track_id = $trackId;
        $trackInUsers->user_id = $userId;

        $trackInUsers->save();

        return $trackInUsers->track_in_user_id;
    }

    public static function DeleteTrackFromUserTracks()
    {
        $result = false;
        $userId = \Auth::user()->user_id;
        $trackId = \Route::input('track_id');

        $deletedTrackInUsers = TracksInUsers::where('tracks_in_users.user_id', '=', $userId)
            ->where('tracks_in_users.track_in_user_id', '=', $trackId)
            ->first();

        $deletedTrack = TracksModel::where('tracks.track_id', '=', $deletedTrackInUsers->track_id)
            ->first();

        if($userId != $deletedTrack->created_at_user)
        {
            if($deletedTrack->delete() && $deletedTrackInUsers->delete())
                $result = true;
        }
        else
        {
            if($deletedTrackInUsers->delete())
                $result = true;
        }
        /*if(TracksInUsers::where('tracks_in_users.user_id', '=', $userId)
                ->where('tracks_in_users.track_in_user_id', '=', $trackId)
                ->delete())
            $result = true;*/

        return json_encode($result, JSON_UNESCAPED_UNICODE | JSON_NUMERIC_CHECK);
    }
    
    /* Delete before push */
    
    public static function AddTrackToUserList()
    {
        $result = false;

        $userId = \Auth::getUser()->user_id;
        $trackId = \Route::input('track_id');


        $track = TracksModel::where('tracks.track_id', '=', $trackId)
            ->first();

        if($track->created_at_user != $userId)
        {
            $addedTrack = new TracksModel();
            $addedTrack->track_name = $track->track_name;
            $addedTrack->artist_name = $track->artist_name;
            $addedTrack->track_photo = $track->track_photo;
            $addedTrack->track_download_name = $track->track_download_name;
            $addedTrack->duration = $track->duration;
            $addedTrack->created_at_user = $track->created_at_user;
            $addedTrack->is_copy = 1;
            $addedTrack->save();

            $track_in_user_id = Tracks::AssociateWithUser(\Auth::user()->user_id, $addedTrack->track_id);
        }
        else
        {
            $track_in_user_id = Tracks::AssociateWithUser(\Auth::user()->user_id, $track->track_id);
        }

        if (!is_null($track_in_user_id))
        {
            $result['status'] = true;
            $result['new_id'] = $track_in_user_id;
        }

        /*$addedTrack = new TracksInUsers();
        $addedTrack->track_id = $trackId;
        $addedTrack->user_id = $userId;
        $addedTrack->save();

        if (!is_null($addedTrack->track_in_user_id))
        {
            $result['status'] = true;
            $result['new_id'] = $addedTrack->track_in_user_id;
        }*/

        echo json_encode($result);
    }

    public static function GetTrackById()
    {
        $userId = \Auth::user()->user_id;
        $trackId = \Route::input('track_id');

       /* $track = TracksInUsers::leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks_in_users.track_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')
            ->leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_users.track_id')
            ->where('tracks_in_users.user_id', '=', $userId)
            ->where('tracks_in_users.track_id', '=', $trackId)
            ->first();*/

        $track = TracksInUsers::leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_users.track_id')
            ->where('tracks_in_users.user_id', '=', $userId)
            ->where('tracks_in_users.track_id', '=', $trackId)
            ->first();

        return json_encode($track);
    }

    public static function SaveTrackChanges()
    {
        $result = false;
        $userId = \Auth::user()->user_id;
        $trackId = \Route::input('track_id');

        $artistName = $_POST['artist'];
        $trackName = $_POST['track_name'];

        /*$trackInUsers = TracksInUsers::leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks_in_users.track_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')
            ->leftJoin('tracks', 'tracks.track_id', '=', 'tracks_in_users.track_id')
            ->where('tracks_in_users.user_id', '=', $userId)
            ->where('tracks_in_users.track_id', '=', $trackId)
            ->first();*/

        $trackInUsers = TracksInUsers::where('tracks_in_users.user_id', '=', $userId)
            ->where('tracks_in_users.track_id', '=', $trackId)
            ->first();

        if(!is_null($trackInUsers))
        {
            /*$trackInArtist = TracksInArtists::where('tracks_in_artists.track_id', '=', $trackInUsers->track_id)
                ->first();
            $artist = Artists::where('artists.artist_id', '=', $trackInArtist->artist_id)
                ->first();
            $artist->artist_name = $artistName;
            $artist->save();*/

            $track = TracksModel::where('tracks.track_id', '=',  $trackInUsers->track_id)
                ->first();
            $track->track_name = $trackName;
            $track->artist_name = $artistName;
            $track->save();

            $result = true;
            return json_encode($result);
        }
        return json_encode($result);
    }
}

