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
</head>
<body>
    <div class="container-fluid main-header">
        <div class="header-container">
            <div class="row">
                <ul class="list-inline main-menu">
                    <a href="/">
                        <li class="float-lg-left list-inline-item main-logo">
                            <img src="/resources/assets/images/logo.png" alt="">
                        </li>
                    </a>
                    @if (Auth::check())
                    <li class="float-lg-right list-inline-item">
                        <a href="/logout"><b class="fa fa-sign-out"></b></a>
                    </li>
                    @endif
                    <li class="float-lg-right list-inline-item my-profile">
                        @if (Auth::check())
                            <a href="/profile">My Profile</a>
                        @else
                            <a href="/signin">Sign In / Sign Up</a>
                        @endif
                    </li>
                    <li class="float-lg-right list-inline-item">
                        <a href="">Concerts</a>
                    </li>
                    <li class="float-lg-right list-inline-item">
                        <a href="">Communities</a>
                    </li>
                    @if (Auth::check())
                    <li class="float-lg-right list-inline-item">
                        <a href="">My Playlists</a>
                    </li>
                    @endif
                    <li class="float-lg-right list-inline-item">
                        <a href="/allmusic">All Music</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    @yield('content')

    <footer>
        <div class="container-fluid music-player">
            <div class="music-player-time">
                <p class="time-curr">1:42</p>
                <p class="time-all">3:15</p>
            </div>
            <div class="music-player-time-gone"></div>
            <div class="music-player-controller">
                <div class="controller-prev"><b class="fa fa-backward"></b></div>
                <div class="controller-play"><b class="fa fa-play-circle-o"></b></div>
                <div class="container-next"><b class="fa fa-forward "></b></div>
            </div>
            <div class="player-image">
                <img src="https://d2ykdu8745rm9t.cloudfront.net/cover/i/009/432/567/mr-robot-5527.jpg?rect=25,0,549,549&q=98&fm=jpg&fit=max" alt="">
            </div>
            <div class="player-music-info">
                <p class="music-title">OST Soundtrack #1</p>
                <p class="music-artist">MR. ROBOT</p>
            </div>
        </div>
    </footer>
</body>
</html>