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
    <div class="container-fluid login-contain">
        @if (count($errors) > 0)
            <div class="alert alert-danger signin-alert">
                <strong>Whoops!</strong> There were some problems with your input.<br><br>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <div class="login-form center-block">
            <div class="image-logo text-xs-center">
                <a href="{{ url('/') }}"><img src="/resources/assets/images/logo.png" alt=""></a>
            </div>
            @yield('content')
        </div>
    </div>
    <script type="text/javascript">
        $(function(){
            setTimeout(function(){
                $('.signin-alert').slideUp();
            }, 3000);
        });
    </script>
</body>
</html>