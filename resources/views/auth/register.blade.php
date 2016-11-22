<div class="container-fluid login-contain">
	{{--@if (count($errors) > 0)
		<div class="alert alert-danger signin-alert">
			<strong>Whoops!</strong> There were some problems with your input.<br><br>
			<ul>
				@foreach ($errors->all() as $error)
					<li>{{ $error }}</li>
				@endforeach
			</ul>
		</div>
	@endif --}}

	<div class="alert alert-danger signin-alert">
		<strong>Whoops!</strong> There were some problems with your input.<br><br>
		<ul></ul>
	</div>

	<div class="login-form center-block">
		<div class="image-logo text-xs-center">
			<a href="{{ url('/') }}"><img src="/resources/assets/images/logo.png" alt=""></a>
		</div>
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
				<button type="button" class="btn btn-signin ajax-signup-btn">Sign up</button>
			</div>
		</form>
		<div class="text-xs-center additional-info">
			<ul class="list-unstyled">
				<li><a id="to-page" onclick="toPage('/signin', true)">I already have an account</a></li>
			</ul>
		</div>

	</div>
</div>
<script type="text/javascript">
	$(function(){
		setTimeout(function(){
			$('.signin-alert').slideUp();
		}, 3000);
	});
</script>