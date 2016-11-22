<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Tracks as TracksModel;


class Tracks extends Controller
{
    public function Create()
    {
        //$result = array();

        $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/resources/tracks/';
        $i = 0;
        foreach ($_FILES as $file)
        {
            $i++;
            $uploadFile = $uploadDir . $file['name'];
            if (move_uploaded_file($file['tmp_name'], $uploadFile)){
                $result['track'][$i] = $this->GetTrackInfo($uploadFile);
                echo json_encode($i);
                $result['result'][$i] = "Track is uploaded";
            } else {
                $result['result'][$i] = "Error";
            }
            //break;
        }

        echo json_encode($result);
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

        return $thisFileInfo;
    }
}

