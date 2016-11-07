@extends('common.header')

@section('content')
    <div class="container-fluid all-music-container">
        <div class="container-fluid music-settings">
            <p class="title">All music</p>
            <ul class="list-inline music-choice">
                <li class="list-inline-item active"><a href="">Albums</a></li>
                <li class="list-inline-item"><a href="">Tracks</a></li>
            </ul>
        </div>
        <div class="container-fluid music-filters">
            <p class="title">Filters</p>
            <form action="" method="get" class="search_filter">
                <p class="title">Genres</p>
                <div class="form-group radio-btn">
                    <input type="radio" name="salary" id="genre_0" value="10" class="hidden">
                    <label for="genre_0">Rock</label>
                </div>
                <div class="form-group radio-btn">
                    <input type="radio" name="salary" id="genre_1" value="10" class="hidden">
                    <label for="genre_1">Jazz</label>
                </div>
                <div class="form-group radio-btn">
                    <input type="radio" name="salary" id="genre_2" value="10" class="hidden">
                    <label for="genre_2">Blues</label>
                </div>
                <div class="form-group radio-btn">
                    <input type="radio" name="salary" id="genre_3" value="10" class="hidden">
                    <label for="genre_3">Pop</label>
                </div>
                <div class="form-group radio-btn">
                    <input type="radio" name="salary" id="genre_4" value="10" class="hidden">
                    <label for="genre_4">Rap</label>
                </div>
                <div class="form-group radio-btn">
                    <input type="radio" name="salary" id="genre_5" value="10" class="hidden">
                    <label for="genre_5">Hip-Hop</label>
                </div>
                <div class="form-group">
                    <input type="text" name="search_singer" class="form-control" placeholder="Singer" maxlength="50" pattern="[A-Za-zА-Яа-я\d]{1,50}" value="">
                </div>
                <div class="form-group">
                    <input type="text" name="search_song" class="form-control" placeholder="Song name" maxlength="50" pattern="[A-Za-zА-Яа-я\d]{1,50}" value="">
                </div>
                <button class="btn btn-search">Search</button>
            </form>
        </div>
        @include('pages.allmusic.albums')
    </div>
    <div class="music-right-sidebar">
        <div class="close-sidebar">
            Close
        </div>
    </div>
@stop