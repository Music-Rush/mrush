<div class="container-fluid in-music-container">
    <div class="items">
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
            <div class="track-item">
                <div class="track-img">
                    <img src="https://i1.sndcdn.com/artworks-000084314548-w6ysb3-t500x500.jpg" alt="">
                </div>
                <div class="track-info-block">
                    <p class="artist-name">Ed Sheeran</p>
                    <p class="track-name">Photograph</p>
                </div>
                <div class="add-track-info">
                    <p class="track-time">3:15</p>
                    <b class="fa fa-heart-o"></b>
                    <b class="fa fa-plus"></b>
                    <b class="fa fa-download"></b>
                </div>
            </div>
            <div class="track-item">
                <div class="track-img">
                    <img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">
                </div>
                <div class="track-info-block">
                    <p class="artist-name">MR. ROBOT</p>
                    <p class="track-name">OST Soundtrack #1</p>
                </div>
                <div class="add-track-info">
                    <p class="track-time">3:15</p>
                    <b class="fa fa-heart-o"></b>
                    <b class="fa fa-plus"></b>
                    <b class="fa fa-download"></b>
                </div>
            </div>
        @endfor
    </div>
</div>