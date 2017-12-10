<?php namespace App\Http\Controllers\Concerts;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Events as EventsModel;

use Illuminate\Http\Request;

class Events extends Controller
{
    public static function Create($eventName, $eventTime, $eventLocation, $eventPhoto, $eventUrl, $eventDate = null)
    {
        $event = EventsModel::where('event_name', '=', $eventName)
            ->where('event_location', '=', $eventLocation)
            ->where('event_time', '=', $eventTime)
            ->where('event_url', '=', $eventUrl)
            ->first();

        if (is_null($event))
        {
            $event = new EventsModel();
            $event->event_time = $eventTime;
            $event->event_location = $eventLocation;
            $event->event_name = $eventName;
            if(!is_null($eventDate)) {
                $event->event_date = $eventDate;
            }
            $event->event_photo = $eventPhoto;
            $event->event_url = $eventUrl;
            $event->save();
        }

        return $event->event_id;
    }
}
