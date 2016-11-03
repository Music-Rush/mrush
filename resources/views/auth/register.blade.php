@extends('login.signin')

@section('content')
	<form action="{{ url('/signup') }}" class="form-horizontal" method="POST">
		<input type="hidden" name="_token" value="{{ csrf_token() }}">
		<div class="form-group">
			<input type="text" class="form-control" name="name" value="{{ old('name') }}" placeholder="Username">
		</div>
		<div class="form-group">
			<input type="email" class="form-control" name="email" value="{{ old('email') }}" placeholder="Email">
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="password" placeholder="Password">
		</div>

		<div class="form-group">
			<input type="password" class="form-control" name="password_confirmation" placeholder="Password confirm">
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-signin">Sign up</button>
		</div>
	</form>
	<div class="text-xs-center additional-info">
		<ul class="list-unstyled">
			<li><a href="{{ url('/signin') }}">I already have an account</a></li>
		</ul>
	</div>
@endsection
