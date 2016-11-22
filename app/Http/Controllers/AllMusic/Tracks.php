<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\TracksInArtists;
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
                $track->track_photo = $result['track'][$i]['image_path'];
                $track->duration = $result['track'][$i]['duration'];
                $track->created_at_user = \Auth::user()->user_id;
                $track->save();

                Artists::AssociateWithTrack($track->track_id, Artists::Create($result['track'][$i]['artist']));
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

        $thisFileInfo['duration'] = isset($getIDObj->info['playtime_string']) ? $getIDObj->info['playtime_string'] : 0;

        return $thisFileInfo;
    }

    public static function GetUserTracks($userId)
    {
        $tracks = TracksModel::leftJoin('tracks_in_artists', 'tracks_in_artists.track_id', '=', 'tracks.track_id')
            ->leftJoin('artists', 'artists.artist_id', '=', 'tracks_in_artists.artist_id')
            ->where('tracks.created_at_user', '=', $userId)->get();

        return $tracks;
    }
}

