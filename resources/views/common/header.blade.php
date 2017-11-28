<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/assets/js/jquery-3.0.0.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/assets/stylesheets/header.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/home.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/login.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="/resources/assets/js/all-m.js"></script>
    <script src="/resources/assets/js/community.js"></script>
    <script src="/resources/assets/js/ajax.js"></script>
    <script src="/resources/assets/js/playlist.js"></script>
    <script src="/resources/assets/js/music.js"></script>
    <title>{{ $title }}</title>
    @if (!empty($styles) && is_array($styles))
        @foreach ($styles as $style)
            <link rel="stylesheet" href="/resources/assets/stylesheets/{{ $style }}">
        @endforeach
    @endif
    <link rel="stylesheet" href="/resources/assets/stylesheets/allmusic.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/tracks.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/profile.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/concerts.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/login.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/community.css">
</head>
<body>
    <input type="hidden" name="token" value="{{ csrf_token() }}"/>
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
                    <li class="float-lg-right list-inline-item user-logout">
                        <a id="to-page"><b class="fa fa-sign-out"></b></a>
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
                        <a id="to-page" onclick="toPage('/concerts', true)">Concerts</a>
                    </li>
                    @if (Auth::check())
                    <li class="float-lg-right list-inline-item">
                        <a id="to-page" onclick="toPage('/communities', true)">Communities</a>
                    </li>
                    <li class="float-lg-right list-inline-item">
                        <a id="to-page" onclick="toPage('/profile/playlists', true)">My Playlists</a>
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
                    <div class="controller-volume">
                        <b class="fa fa-volume-up"></b>
                        <div class="pop-volume">
                            <div class="music-player-volume" tabindex="0">
                                <div class="music-player-volume-progress"></div>
                                <div class="music-player-volume-gone"></div>
                            </div>
                        </div>
                    </div>
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

            </div>
        </div>
    </footer>

    <div class="loading-back">
        <i class="fa fa-spinner fa-spin fa-3x fa-fw"></i>
    </div>
</body>
</html>