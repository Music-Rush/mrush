<div class="container-fluid playlists-container" onselectstart="return false" onmousedown="return false">
    <div class="profile-playlist-items">
        @for($i = 0; $i < 20; $i++)
            <div class="profile-playlist-item">
                <img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">
                <div class="profile-playlist-info">
                    <div class="in-profile-playlist-info">
                        <p class="profile-playlist-artist">MR. ROBOT</p>
                        <p class="profile-playlist-name">OST</p>
                        <p class="profile-playlist-year">2016</p>
                    </div>
                </div>
            </div>
            <!--<div class="profile-playlist-item">
                <div class="playlist-info">
                    <p class="playlist-name">Bring Me The Horizon</p>
                    <p class="playlist-genre">Deathcore</p>
                </div>
                <div class="playlist-img">
                    <img src="http://is2.mzstatic.com/image/thumb/Music69/v4/7d/8f/6c/7d8f6c72-97c2-5e52-ce37-11a1f48e636a/source/1200x630bf.jpg" alt="">
                    <div class="playlist-control-block">
                        <div class="play">
                            <b class="fa fa-play"></b>
                            <span>Play</span>
                        </div>
                        <div class="view">
                            <b class="fa fa-list"></b>
                            <span>View list</span>
                        </div>
                    </div>
                </div>
            </div>-->
        @endfor
    </div>
</div>