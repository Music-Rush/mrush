<input type="hidden" name="_token" value="{{ csrf_token() }}">
@foreach(\App\Http\Controllers\AllMusic\AllMusic::GetAlbums(true) as $key => $item)
    <div class="album-item" album_id="{{$item->album_id}}">
        <img src="{{ '/resources/assets/images/album_images/' . $item->album_photo }}" alt="">
        <div class="album-info">
            <div class="in-album-info">
                <p class="album-artist">{{$item->artist_name}}</p>
                <p class="album-name">{{$item->album_name}}</p>
                <p class="album-year">{{$item->album_year}}</p>
            </div>
        </div>
    </div>
@endforeach

<!--<div class="album-item">
    <img src="https://upload.wikimedia.org/wikipedia/en/7/7d/Blurryface_by_Twenty_One_Pilots.png" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">Twenty one pilots</p>
            <p class="album-name">Blurryface</p>
            <p class="album-year">2015</p>
        </div>
    </div>
</div>
<div class="album-item">
    <img src="https://i1.sndcdn.com/artworks-000084314548-w6ysb3-t500x500.jpg" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">Ed Sheeran</p>
            <p class="album-name">Photograph</p>
            <p class="album-year">2015</p>
        </div>
    </div>
</div>
<div class="album-item">
    <img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">MR. ROBOT</p>
            <p class="album-name">OST</p>
            <p class="album-year">2016</p>
        </div>
    </div>
</div>
<div class="album-item">
    <img src="https://upload.wikimedia.org/wikipedia/en/7/7d/Blurryface_by_Twenty_One_Pilots.png" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">Twenty one pilots</p>
            <p class="album-name">Blurryface</p>
            <p class="album-year">2015</p>
        </div>
    </div>
</div>
<div class="album-item">
    <img src="https://i1.sndcdn.com/artworks-000084314548-w6ysb3-t500x500.jpg" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">Ed Sheeran</p>
            <p class="album-name">Photograph</p>
            <p class="album-year">2015</p>
        </div>
    </div>
</div>
<div class="album-item">
    <img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">MR. ROBOT</p>
            <p class="album-name">OST</p>
            <p class="album-year">2016</p>
        </div>
    </div>
</div>
<div class="album-item">
    <img src="https://upload.wikimedia.org/wikipedia/en/7/7d/Blurryface_by_Twenty_One_Pilots.png" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">Twenty one pilots</p>
            <p class="album-name">Blurryface</p>
            <p class="album-year">2015</p>
        </div>
    </div>
</div>
<div class="album-item">
    <img src="https://i1.sndcdn.com/artworks-000084314548-w6ysb3-t500x500.jpg" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">Ed Sheeran</p>
            <p class="album-name">Photograph</p>
            <p class="album-year">2015</p>
        </div>
    </div>
</div>
<div class="album-item">
    <img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">MR. ROBOT</p>
            <p class="album-name">OST</p>
            <p class="album-year">2016</p>
        </div>
    </div>
</div>
<div class="album-item">
    <img src="https://upload.wikimedia.org/wikipedia/en/7/7d/Blurryface_by_Twenty_One_Pilots.png" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">Twenty one pilots</p>
            <p class="album-name">Blurryface</p>
            <p class="album-year">2015</p>
        </div>
    </div>
</div>
<div class="album-item">
    <img src="https://i1.sndcdn.com/artworks-000084314548-w6ysb3-t500x500.jpg" alt="">
    <div class="album-info">
        <div class="in-album-info">
            <p class="album-artist">Ed Sheeran</p>
            <p class="album-name">Photograph</p>
            <p class="album-year">2015</p>
        </div>
    </div>
</div>-->
