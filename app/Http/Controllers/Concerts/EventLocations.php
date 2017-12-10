<?php namespace App\Http\Controllers\Concerts;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\EventLocations as EventLocationsModel;

use Illuminate\Http\Request;

class EventLocations extends Controller
{
    public static function Create($locationName)
    {
        $location = EventLocationsModel::where('location_name', '=', $locationName)->first();

        if (is_null($location))
        {
            $location = new EventLocationsModel();
            $location->location_name = $locationName;
            $location->save();
        }

        return $location->location_id;
    }
}
