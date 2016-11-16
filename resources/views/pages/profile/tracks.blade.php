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
                    <b class="fa fa-edit"></b>
                    <b class="fa fa-times-circle"></b>
                    <b class="fa fa-download"></b>
                </div>
            </div>
        @endfor
    </div>
</div>