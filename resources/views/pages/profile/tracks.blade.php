<div class="music-filters-block">
    <button class="btn btn-secondary btn-upload-track" data-toggle="modal" data-target="#uploadNewTrack">Upload new track</button>
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
                <input type="text" name="search_song" class="form-control" placeholder="Song name" maxlength="50" pattern="[A-Za-zА-Яа-я\d]{1,50}" value="">
            </div>
            <button class="btn btn-search">Search</button>
            <a href=" /allmusic "><button type="button" class="btn btn-danger">Reset filter</button></a>
        </form>
    </div>
</div>
<div class="container-fluid tracks-container" onselectstart="return false" onmousedown="return false">
    <!--<div class="profile-track-item default-track-item">
        <p class="track-number">#</p>
        <p class="control-btn"></p>
        <p class="track-name">Title</p>
        <p class="track-performer">Artist</p>
        <p class="track-options">Options</p>
        <p class="track-time">Time</p>
    </div>-->
    <div class="profile-track-items">
        @for($i = 0; $i < 20; $i++)
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
                        <span class="upload-procent">0%</span>
                    </div>
                    <span class="upload-ok"><i class="fa fa-check"></i></span>
                </div>
                <form action="" class="form-upload-track" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="form-group">
                        <label for="upload_track" class="center-block">
                            <div class="upload-track-block center-block">
                                <p class="title">+</p>
                            </div>
                        </label>
                        <input type="file" class="form-control" name="upload-track" id="upload_track" multiple>
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