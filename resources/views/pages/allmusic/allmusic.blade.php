    <input type="hidden" name="csrf-token" value="{{ csrf_token() }}">

    <div class="container-fluid all-music-container">
        <div class="music-filters-block">
            <div class="container-fluid music-filters">
                <p class="title">Filters</p>
                <form action="" method="get" class="search_filter">
                    <p class="title">Genres</p>
                    @foreach (\App\Models\Genres::all() as $key => $item)
                        <div class="form-group check-btn">
                            <input type="checkbox" name="genre" id="genre_{{ $item->genre_id }}" value="{{ $item->genre_id }}" class="hidden" {{$item->genre_id == Input::get('genre_id') ? 'checked' : ''}}>
                            <label for="genre_{{ $item->genre_id }}">{{ $item->genre_name }}</label>
                        </div>
                    @endforeach
                    <div class="form-group">
                        <input type="text" name="search_singer" class="form-control" placeholder="Singer" maxlength="50" pattern="[A-Za-zА-Яа-я\d\s]{1,50}" value="{{ (Input::has('search_singer')) ? Input::get('search_singer') : '' }}">
                    </div>
                    <div class="form-group">
                        <input type="text" name="search_song" class="form-control" placeholder="Song name" maxlength="50" pattern="[A-Za-zА-Яа-я\d\s]{1,50}" value="{{ (Input::has('search_song')) ? Input::get('search_song') : ''}}">
                    </div>
                    <button type="button" class="btn btn-search" onclick="searchFilter(this)">Search</button>
                    <button type="button" class="btn btn-danger" onclick="resetFilter(this)">Reset filter</button>
                </form>
            </div>
        </div>
        <div class="right-music-block">
            <div class="music-settings">
                <p class="title">All music</p>
                <ul class="list-inline music-choice">
                    <li class="list-inline-item active" id="get-albums">
                        <input type="radio" id="album-type" name="music-type" value="0" {{ (!isset($_COOKIE['music_type']) || $_COOKIE['music_type'] == 'albums') ? 'checked' : '' }}>
                        <label for="album-type">Albums</label>
                    </li>
                    <li class="list-inline-item" id="get-tracks">
                        <input type="radio" id="track-type" name="music-type" value="1" {{ (isset($_COOKIE['music_type']) && $_COOKIE['music_type'] == 'tracks') ? 'checked' : '' }}>
                        <label for="track-type">Tracks</label>
                    </li>
                </ul>
            </div>
            <div class="container-fluid in-music-container">
                <div class="items">
                    @if (isset($_COOKIE['music_type']) && ($_COOKIE['music_type'] == 'tracks'))
                        @include('pages.allmusic.tracks')
                    @else
                        @include('pages.allmusic.albums')
                    @endif
                </div>
                <div class="loading-overlap">
                    <i class="fa fa-spinner fa-spin fa-3x fa-fw"></i>
                </div>
            </div>
        </div>
    </div>
    <div class="music-right-sidebar">
        <div class="close-sidebar">
            Close
        </div>
        <div class="album-title">
            <p class="album-name"></p>
            @if (Auth::check())
            <b class="fa fa-plus"></b>
            <b class="fa fa-outdent fa-rotate-180 fa-1x"></b>
            @endif
            <b class="fa fa-play"></b>

            <!--<b class="fa fa-times-circle" data-toggle="modal" data-target="#deleteAlbum"></b>
            <b class="fa fa-edit" data-toggle="modal" data-target="#editAlbumModal" id="album-edit-btn"></b>-->
        </div>
        <div class="album-track-items">
            <!--<div class="profile-track-item">
                <div class="track-img">
                    <img src="https://upload.wikimedia.org/wikipedia/en/7/7d/Blurryface_by_Twenty_One_Pilots.png" alt="">
                </div>
                <div class="track-info-block">
                    <p class="artist-name">Twenty One Pilots</p>
                    <p class="track-name">Ride</p>
                </div>
                <div class="add-track-info">
                    <p class="track-time">2:28</p>
                    <b class="fa fa-edit" data-toggle="modal" data-target="#editTrackModal"></b>
                    <b class="fa fa-times-circle" data-toggle="modal" data-target="#deleteTrack"></b>
                    <b class="fa fa-download"></b>
                </div>
            </div>-->
        </div>
    </div>

    {{--<div class="modal fade" id="user-playlist-list" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">--}}
        {{--<div class="modal-dialog">--}}
            {{--<div class="modal-content">--}}
                {{--<div class="modal-body">--}}
                    {{--<p class="title">Select playlist</p>--}}
                    {{--<div class="playlist-items">--}}
                        {{--@foreach(\App\Http\Controllers\AllMusic\Playlists::GetUserPlaylists(Auth::user()->user_id) as $key => $item)--}}
                            {{--<div class="profile-playlist-item" playlist_id="{{$item->playlist_id}}">--}}
                                {{--<img src="{{ '/resources/assets/images/album_images/' . $item->playlist_photo }}" alt="">--}}
                                {{--<div class="profile-playlist-info">--}}
                                    {{--<div class="in-profile-playlist-info">--}}
                                        {{--<p class="profile-playlist-name">{{$item->playlist_name}}</p>--}}
                                    {{--</div>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                        {{--@endforeach--}}
                    {{--</div>--}}
                {{--</div>--}}
                {{--<!--<div class="modal-footer">--}}
                    {{--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--}}
                    {{--<button type="button" class="btn btn-primary add-track-btn">Add</button>--}}
                {{--</div>-->--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</div>--}}
