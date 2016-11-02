<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/assets/stylesheets/header.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/home.css">
    <title>{{ $title }}</title>
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
                    <li class="float-lg-right list-inline-item my-profile">
                        <a href="">My Profile</a>
                    </li>
                    <li class="float-lg-right list-inline-item">
                        <a href="">Concerts</a>
                    </li>
                    <li class="float-lg-right list-inline-item">
                        <a href="">Communities</a>
                    </li>
                    <li class="float-lg-right list-inline-item">
                        <a href="">My Playlists</a>
                    </li>
                    <li class="float-lg-right list-inline-item">
                        <a href="">All Music</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    @yield('content')
</body>
</html>