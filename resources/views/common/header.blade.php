<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/assets/stylesheets/header.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/home.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
                            <a href="">My Profile</a>
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
</body>
</html>