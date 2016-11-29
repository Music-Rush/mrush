<div class="music-player">
    <div class="player-progress">
        <div class="music-player-progress-bg"></div>
        <div class="music-player-progress-muted">
            <div class="progress-line"></div>
        </div>
        <div class="music-player-time-gone">
            <div class="progress-line"></div>
        </div>
        <div class="music-player-time">
            <p class="time-curr">1:42</p>
            <p class="time-all">3:15</p>
        </div>
    </div>
    <div class="player-controls">
        <div class="music-player-controller">
            <div class="controller-prev"><b class="fa fa-backward"></b></div>
            <div class="controller-play"><b class="el el-play-circle el-6"></b></div>
            <div class="controller-next"><b class="fa fa-forward "></b></div>
            <div class="controller-list"><b class="fa fa-list-ul"></b></div>
        </div>
        <div class="player-image">
            <img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">
        </div>
        <div class="player-music-info">
            <p class="music-title">OST Soundtrack #1</p>
            <p class="music-artist">MR. ROBOT</p>
        </div>
    </div>
</div>

<div class="music-list">
    <div class="music-list-close-sidebar">
        Close
    </div>
    <div class="track-items">
        @for($i = 0; $i < 10; $i++)
            <div class="track-item">
                <div class="track-img">
                    <img src="https://upload.wikimedia.org/wikipedia/en/7/7d/Blurryface_by_Twenty_One_Pilots.png" alt="">
                </div>
                <div class="track-info-block">
                    <p class="artist-name">Twenty One Pilots</p>
                    <p class="track-name">Ride</p>
                </div>
                <div class="add-track-info">
                    <p class="track-time">2:28</p>
                    <b class="fa fa-heart-o"></b>
                    <b class="fa fa-plus"></b>
                    <b class="fa fa-download"></b>
                </div>
            </div>
        @endfor
    </div>
</div>