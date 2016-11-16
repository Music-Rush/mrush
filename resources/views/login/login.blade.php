<!DOCTYPE HTML>
<html>
<head>
    <script type="text/javascript" src="/resources/assets/js/jquery-3.0.0.min.js"></script>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/assets/stylesheets/header.css">
    <link rel="stylesheet" href="/resources/assets/stylesheets/login.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    @if (!empty($title))
        <title>{{ $title }}</title>
    @endif
</head>
<body>
    @yield('content')
</body>
</html>