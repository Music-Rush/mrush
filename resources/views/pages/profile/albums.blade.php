<div class="music-filters-block">
    <button class="btn btn-secondary btn-upload-track">Add new album</button>
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
                <input type="text" name="search_song" class="form-control" placeholder="Album name" maxlength="50" pattern="[A-Za-zА-Яа-я\d]{1,50}" value="">
            </div>
            <button class="btn btn-search">Search</button>
            <a href=" /allmusic "><button type="button" class="btn btn-danger">Reset filter</button></a>
        </form>
    </div>
</div>
<div class="container-fluid albums-container">
    <div class="profile-album-items">
        <div class="profile-album-item">
            <img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">
            <div class="profile-album-info">
                <div class="in-profile-album-info">
                    <p class="profile-album-artist">MR. ROBOT</p>
                    <p class="profile-album-name">OST</p>
                    <p class="profile-album-year">2016</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="music-right-sidebar">
    <div class="close-sidebar">
        Close
    </div>
    <div class="album-title">
        <p class="album-name">MR. ROBOT</p>
        <b class="fa fa-times-circle" data-toggle="modal" data-target="#deleteAlbum"></b>
        <b class="fa fa-edit" data-toggle="modal" data-target="#editAlbumModal"></b>
    </div>
    <div class="album-track-items">
        @for($i = 0; $i < 15; $i++)
            <div class="profile-track-item">
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
            </div>
        @endfor
    </div>
</div>
<div class="modal fade bd-example-modal-sm" id="uploadNewTrack" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="upload-progress-block center-block">
                    <div class="upload">
                        <div class="progress"></div>
                        <span class="upload-procent">50%</span>
                    </div>
                    <span class="upload-ok">OK</span>
                </div>
                <form action="" class="form-upload-track" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="form-group">
                        <label for="upload_track" class="center-block">
                            <div class="upload-track-block center-block">
                                <p class="title">+</p>
                            </div>
                        </label>
                        <input type="file" class="form-control" name="upload-track" id="upload_track">
                    </div>
                </form>
                <button type="button" class="btn btn-primary upload-btn">Upload</button>
            </div>
        </div>
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
<div class="modal fade bd-example-modal-sm" id="deleteAlbum" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <p class="title">You really want to delete this album?</p>
            <button type="button" class="btn btn-primary" data-dismiss="modal">Yes</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        </div>
    </div>
</div>
<div class="modal fade" id="editTrackModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="color: white">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Edit track</h4>
            </div>
            <div class="modal-body">
                <form action="" class="">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="form-group">
                        <input type="text" class="form-control" name="track-name" placeholder="Track name">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="track-artist" placeholder="Track artist">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bd-example-modal-lg" id="editAlbumModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="color: white">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Edit album</h4>
            </div>
            <div class="modal-body">
                <form action="" class="album-info-form" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="form-group form-group-album-img">
                        <label for="upload_album_img" class="album_img_label">
                            <img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">
                            <div class="over-album-img">
                                <b class="fa fa-download"></b>
                            </div>
                        </label>
                        <input type="file" class="form-control" name="upload-track" id="upload_album_img">
                    </div>
                    <div class="form-group-album-info">
                        <div class="form-group">
                            <input type="text" class="form-control" name="album-name" placeholder="Album name">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="album-artist" placeholder="Album artist">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="album-year" placeholder="Album year">
                        </div>
                    </div>
                </form>
                <div class="track-items">
                    @for($i = 0; $i < 15; $i++)
                        <div class="track-item-check-btn">
                            <input type="checkbox" name="salary" id="track_{{$i}}" class="hidden">
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