<input type="hidden" name="_token" value="{{ csrf_token() }}">
@foreach(\App\Http\Controllers\AllMusic\AllMusic::GetTracks(true) as $key => $item)
    <div class="track-item" track-id="{{ $item->track_id }}" track-in-user="{{ $item->exist_id }}">
        <div class="track-img">
            <img src="{{ '/resources/assets/images/music_images/' . $item->track_photo }}" alt="">
        </div>
        <div class="track-info-block">
            <p class="artist-name">{{ $item->artist_name }}</p>
            <p class="track-name">{{ $item->track_name }}</p>
        </div>
        <div class="add-track-info">
            <p class="track-time">{{ $item->duration }}</p>
            @if (\App\Http\Controllers\AllMusic\AllMusic::AuthCheck())
            <b class="fa fa-heart-o"></b>
            <b class="add-track-to-user fa fa-plus"></b>
            @endif
            <a class="fa fa-download" href="/resources/tracks/{{ $item->track_download_name }}" download target="_blank"></a>
        </div>
    </div>
@endforeach
