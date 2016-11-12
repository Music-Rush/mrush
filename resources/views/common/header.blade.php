<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/assets/js/jquery-3.0.0.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/assets/stylesheets/header.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/home.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/assets/font-awesome/css/font-awesome.min.css">
    <title>{{ $title }}</title>
    @if (!empty($styles) && is_array($styles))
        @foreach ($styles as $style)
            <link rel="stylesheet" href="/resources/assets/stylesheets/{{ $style }}">
        @endforeach
    @endif
    <link rel="stylesheet" href="/resources/assets/stylesheets/allmusic.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/tracks.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/profile.css">
</head>
<body>
    <div class="container-fluid main-header">
        <div class="header-container">
            <div class="row">
                <ul class="list-inline main-menu">
                    <a id="to-page" onclick="toPage('/home', true)">
                        <li class="float-lg-left list-inline-item main-logo">
                            <img src="/resources/assets/images/logo.png" alt="">
                        </li>
                    </a>
                    @if (Auth::check())
                    <li class="float-lg-right list-inline-item">
                        <a href="/logout" id="to-page"><b class="fa fa-sign-out"></b></a>
                    </li>
                    @endif
                    <li class="float-lg-right list-inline-item my-profile">
                        @if (Auth::check())
                            <a id="to-page" onclick="toPage('/profile', true)">My Profile</a>
                        @else
                            <a id="to-page" onclick="toPage('/signin', true)">Sign In / Sign Up</a>
                        @endif
                    </li>
                    <li class="float-lg-right list-inline-item">
                        <a href="" id="to-page">Concerts</a>
                    </li>
                    <li class="float-lg-right list-inline-item">
                        <a href="" id="to-page">Communities</a>
                    </li>
                    @if (Auth::check())
                    <li class="float-lg-right list-inline-item">
                        <a href="" id="to-page">My Playlists</a>
                    </li>
                    @endif
                    <li class="float-lg-right list-inline-item">
                        <a   id="to-page" onclick="toPage('/allmusic', true)">All Music</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div id="main-content">
        @yield('content')
    </div>

    <footer>
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
                    <div class="controller-play"><b class="fa fa-play-circle-o"></b></div>
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
    </footer>
    <script src="/resources/assets/js/all-m.js"></script>

</body>
</html>