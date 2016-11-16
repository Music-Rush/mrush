<div class="container-fluid playlists-container" onselectstart="return false" onmousedown="return false">
    <div class="profile-playlist-items">
        @for($i = 0; $i < 20; $i++)
            <div class="profile-playlist-item">
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
                        <!--<div class="edit">
                            <b class="fa fa-edit"></b>
                            <span>Edit</span>
                        </div>-->
                        <div class="view">
                            <b class="fa fa-list"></b>
                            <span>View list</span>
                        </div>
                    </div>
                </div>
            </div>
        @endfor
    </div>
</div>