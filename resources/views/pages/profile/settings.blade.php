<div class="container-fluid settings-container">
    @if (count($errors) > 0)
        <div class="alert alert-danger pass-change-alert">
            <strong>Whoops!</strong> There were some problems with your input.<br><br>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    <div class="login-form center-block">
        <form action="{{ url('/signin') }}" class="form-horizontal" method="POST">
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
            <div class="form-group">
                <input type="password" class="form-control" name="old-password" placeholder="Old password">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="new-password" placeholder="New password">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-signin">Change password</button>
            </div>
        </form>
    </div>

    <script type="text/javascript">
        $(function(){
            setTimeout(function(){
                $('.signin-alert').slideUp();
            }, 3000);
        });
    </script>
</div>
