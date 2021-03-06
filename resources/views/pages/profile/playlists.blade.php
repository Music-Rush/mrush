<div class="music-filters-block">
    <button class="btn btn-secondary btn-upload-track" data-toggle="modal" data-target="#addPlaylistModal">Add new playlist</button>
    <div class="container-fluid music-filters">
        <form action="" method="get" class="search_filter">
            <p class="title">Genres</p>
            <div class="form-group check-btn">
                <input type="checkbox" name="salary" id="genre_0" value="10" class="hidden">
                <label for="genre_0">Rock</label>
            </div>
            <div class="form-group check-btn">
                <input type="checkbox" name="salary" id="genre_1" value="10" class="hidden">
                <label for="genre_1">Jazz</label>
            </div>
            <div class="form-group check-btn">
                <input type="checkbox" name="salary" id="genre_2" value="10" class="hidden">
                <label for="genre_2">Blues</label>
            </div>
            <div class="form-group check-btn">
                <input type="checkbox" name="salary" id="genre_3" value="10" class="hidden">
                <label for="genre_3">Pop</label>
            </div>
            <div class="form-group check-btn">
                <input type="checkbox" name="salary" id="genre_4" value="10" class="hidden">
                <label for="genre_4">Rap</label>
            </div>
            <div class="form-group check-btn">
                <input type="checkbox" name="salary" id="genre_5" value="10" class="hidden">
                <label for="genre_5">Hip-Hop</label>
            </div>
            <div class="form-group check-btn">
                <input type="checkbox" name="salary" id="genre_6" value="10" class="hidden">
                <label for="genre_6">Other</label>
            </div>
            <div class="form-group">
                <input type="text" name="search_singer" class="form-control" placeholder="Singer" maxlength="50" pattern="[A-Za-zА-Яа-я\d]{1,50}" value="">
            </div>
            <div class="form-group">
                <input type="text" name="search_song" class="form-control" placeholder="Playlist name" maxlength="50" pattern="[A-Za-zА-Яа-я\d]{1,50}" value="">
            </div>
            <button class="btn btn-search">Search</button>
            <a href=" /allmusic "><button type="button" class="btn btn-danger">Reset filter</button></a>
        </form>
    </div>
</div>
<div class="container-fluid playlist-container" onselectstart="return false" onmousedown="return false">
    <div class="profile-playlist-items">
        @foreach(\App\Http\Controllers\AllMusic\Playlists::GetUserPlaylists(Auth::user()->user_id) as $key => $item)
            <div class="profile-playlist-item" playlist_id="{{$item->playlist_id}}">
                <img src="{{ '/resources/assets/images/album_images/' . $item->playlist_photo }}" alt="">
                <div class="profile-playlist-info">
                    <div class="in-profile-playlist-info">
                        <p class="profile-playlist-name">{{$item->playlist_name}}</p>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>
<div class="music-right-sidebar">
    <div class="close-sidebar">
        Close
    </div>
    <div class="playlist-title">
        <p class="playlist-name"></p>
        <b class="fa fa-times-circle" data-toggle="modal" data-target="#deletePlaylist" id="playlist-delete-btn"></b>
        <b class="fa fa-edit" data-toggle="modal" data-target="#editPlaylistModal" id="playlist-edit-btn"></b>
    </div>
    <div class="playlist-track-items">
    </div>
</div>
<div class="modal fade bd-example-modal-sm" id="deleteTrack" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <p class="title">You really want to delete this track?</p>
            <button type="button" class="btn btn-primary" data-dismiss="modal">Yes</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        </div>
    </div>
</div>
<div class="modal fade bd-example-modal-sm" id="deletePlaylist" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <p class="title">You really want to delete this playlist?</p>
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="delete-playlist">Yes</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        </div>
    </div>
</div>
<div class="modal fade bd-example-modal-lg" id="addPlaylistModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="color: white">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Add playlist</h4>
            </div>
            <div class="modal-body">
                <form action="" class="playlist-info-form" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="form-group form-group-playlist-img">
                        <label for="upload_playlist_img" class="playlist_img_label">
                            <img src="/resources/assets/images/album_images/album-nophoto.png" alt="">
                            <div class="over-playlist-img">
                                <b class="fa fa-download"></b>
                            </div>
                        </label>
                        <input type="file" class="form-control" name="upload-track" id="upload_playlist_img">
                    </div>
                    <div class="form-group-playlist-info">
                        <div class="form-group">
                            <input type="text" class="form-control" name="playlist-name" placeholder="Playlist name">
                        </div>
                    </div>
                    <b class="add-track-in-playlist-btn" data-toggle="modal" data-target="#user-track-list">+</b>
                </form>
                <div class="track-items">
                    <!--<div class="track-item-check-btn">
                        <input type="checkbox" name="salary" id="track_" class="hidden">
                        <label for="track_" class="track-item">
                            <div class="track-img">
                                <img src="https://upload.wikimedia.org/wikipedia/en/7/7d/Blurryface_by_Twenty_One_Pilots.png" alt="">
                            </div>
                            <div class="track-info-block">
                                <p class="artist-name">Twenty One Pilots</p>
                                <p class="track-name">Ride</p>
                            </div>
                            <div class="add-track-info">
                                <p class="track-time">2:28</p>
                                <!--<b class="fa fa-edit" data-toggle="modal" data-target="#editTrackModal"></b>
                                <b class="fa fa-times-circle" data-toggle="modal" data-target="#deleteTrack"></b>
                                <b class="fa fa-download"></b>-
                            </div>
                        </label>
                    </div>-->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bd-example-modal-lg" id="editPlaylistModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="color: white">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Edit playlist</h4>
            </div>
            <div class="modal-body">
                <form action="" class="playlist-info-form" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="form-group form-group-playlist-img">
                        <label for="upload_playlist_img" class="playlist_img_label">
                            <img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">
                            <div class="over-playlist-img">
                                <b class="fa fa-download"></b>
                            </div>
                        </label>
                        <input type="file" class="form-control" name="upload-track" id="upload_playlist_img">
                    </div>
                    <div class="form-group-playlist-info">
                        <div class="form-group">
                            <input type="text" class="form-control" name="playlist-name" placeholder="Playlist name">
                        </div>
                    </div>
                    <b class="add-track-in-playlist-btn" data-toggle="modal" data-target="#user-track-list">+</b>
                </form>
                <div class="track-items">
                    @for($i = 0; $i < 15; $i++)
                        <div class="track-item-check-btn">
                            <input type="checkbox" name="track-check" id="track_{{$i}}" class="hidden">
                            <label for="track_{{$i}}" class="track-item">
                                <div class="track-img">
                                    <img src="https://upload.wikimedia.org/wikipedia/en/7/7d/Blurryface_by_Twenty_One_Pilots.png" alt="">
                                </div>
                                <div class="track-info-block">
                                    <p class="artist-name">Twenty One Pilots</p>
                                    <p class="track-name">Ride</p>
                                </div>
                                <div class="add-track-info">
                                    <p class="track-time">2:28</p>
                                    <!--<b class="fa fa-edit" data-toggle="modal" data-target="#editTrackModal"></b>
                                    <b class="fa fa-times-circle" data-toggle="modal" data-target="#deleteTrack"></b>
                                    <b class="fa fa-download"></b>-->
                                </div>
                            </label>
                        </div>
                    @endfor
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="user-track-list" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <p class="title">Select tracks</p>
                <div class="track-items">
                    @foreach(\App\Http\Controllers\AllMusic\Tracks::GetUserTracks(Auth::user()->user_id) as $key => $item)
                        <div class="track-item-check-btn">
                            <input type="checkbox" name="track-check" id="modal_track {{ $item->track_id }}" class="hidden">
                            <label for="modal_track {{ $item->track_id }}" class="track-item">
                                <div class="track-img">
                                    <img src="{{ '/resources/assets/images/music_images/' . $item->track_photo }}" alt="">
                                </div>
                                <div class="track-info-block">
                                    <p class="artist-name">{{ $item->artist_name }}</p>
                                    <p class="track-name">{{ $item->track_name }}</p>
                                </div>
                                <div class="add-track-info">
                                    <p class="track-time">{{ $item->duration }}</p>
                                    <!--<b class="fa fa-edit" data-toggle="modal" data-target="#editTrackModal"></b>
                                    <b class="fa fa-times-circle" data-toggle="modal" data-target="#deleteTrack"></b>
                                    <b class="fa fa-download"></b>-->
                                </div>
                            </label>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary add-track-btn">Add</button>
            </div>
        </div>
    </div>
</div>