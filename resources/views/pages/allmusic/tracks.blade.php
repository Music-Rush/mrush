{{--@for($i = 0; $i < 5; $i++)--}}

    {{----}}
    {{--<div class="track-item">--}}
        {{--<div class="track-img">--}}
            {{--<img src="https://i1.sndcdn.com/artworks-000084314548-w6ysb3-t500x500.jpg" alt="">--}}
        {{--</div>--}}
        {{--<div class="track-info-block">--}}
            {{--<p class="artist-name">Ed Sheeran</p>--}}
            {{--<p class="track-name">Photograph</p>--}}
        {{--</div>--}}
        {{--<div class="add-track-info">--}}
            {{--<p class="track-time">3:15</p>--}}
            {{--<b class="fa fa-heart-o"></b>--}}
            {{--<b class="fa fa-plus"></b>--}}
            {{--<b class="fa fa-download"></b>--}}
        {{--</div>--}}
    {{--</div>--}}
    {{--<div class="track-item">--}}
        {{--<div class="track-img">--}}
            {{--<img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">--}}
        {{--</div>--}}
        {{--<div class="track-info-block">--}}
            {{--<p class="artist-name">MR. ROBOT</p>--}}
            {{--<p class="track-name">OST Soundtrack #1</p>--}}
        {{--</div>--}}
        {{--<div class="add-track-info">--}}
            {{--<p class="track-time">3:15</p>--}}
            {{--<b class="fa fa-heart-o"></b>--}}
            {{--<b class="fa fa-plus"></b>--}}
            {{--<b class="fa fa-download"></b>--}}
        {{--</div>--}}
    {{--</div>--}}
{{--@endfor--}}
@foreach(\App\Http\Controllers\AllMusic\AllMusic::GetTracks(true) as $key => $item)
    <div class="track-item">
        <div class="track-img">
            <img src="{{ '/resources/assets/images/music_images/' . $item->track_photo }}" alt="">
        </div>
        <div class="track-info-block">
            <p class="artist-name">{{ $item->artist_name }}</p>
            <p class="track-name">{{ $item->track_name }}</p>
        </div>
        <div class="add-track-info">
            <p class="track-time">{{ $item->duration }}</p>
            <b class="fa fa-heart-o"></b>
            <b class="fa fa-plus"></b>
            <b class="fa fa-download"></b>
        </div>
    </div>
@endforeach