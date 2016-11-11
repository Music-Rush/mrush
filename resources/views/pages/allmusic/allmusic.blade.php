@extends('common.header')

@section('content')
    <input type="hidden" name="csrf-token" value="{{ csrf_token() }}">

    <div class="container-fluid all-music-container">
        <div class="music-filters-block">
            <div class="container-fluid music-filters">
                <p class="title">Filters</p>
                <form action="" method="get" class="search_filter">
                    <p class="title">Genres</p>
                    <div class="form-group check-btn">
                        <input type="checkbox" name="salary" id="genre_0" value="10" class="hidden">
                        <label for="genre_0">Rock</label>
                    </div>
                    <div class="form-group check-btn">
                        <input type="checkbox" name="salary" id="genre_1" value="10" class="hidden">
                        <label for="genre_1">Jazz</label>
                    </div>
                    <div class="form-group check-btn">
                        <input type="checkbox" name="salary" id="genre_2" value="10" class="hidden">
                        <label for="genre_2">Blues</label>
                    </div>
                    <div class="form-group check-btn">
                        <input type="checkbox" name="salary" id="genre_3" value="10" class="hidden">
                        <label for="genre_3">Pop</label>
                    </div>
                    <div class="form-group check-btn">
                        <input type="checkbox" name="salary" id="genre_4" value="10" class="hidden">
                        <label for="genre_4">Rap</label>
                    </div>
                    <div class="form-group check-btn">
                        <input type="checkbox" name="salary" id="genre_5" value="10" class="hidden">
                        <label for="genre_5">Hip-Hop</label>
                    </div>
                    <div class="form-group check-btn">
                        <input type="checkbox" name="salary" id="genre_6" value="10" class="hidden">
                        <label for="genre_6">Other</label>
                    </div>
                    <div class="form-group">
                        <input type="text" name="search_singer" class="form-control" placeholder="Singer" maxlength="50" pattern="[A-Za-zА-Яа-я\d]{1,50}" value="">
                    </div>
                    <div class="form-group">
                        <input type="text" name="search_song" class="form-control" placeholder="Song name" maxlength="50" pattern="[A-Za-zА-Яа-я\d]{1,50}" value="">
                    </div>
                    <button class="btn btn-search">Search</button>
                    <a href=" /allmusic "><button type="button" class="btn btn-danger">Reset filter</button></a>
                </form>
            </div>
        </div>
        <div class="right-music-block">
            <div class="music-settings">
                <p class="title">All music</p>
                <ul class="list-inline music-choice">
                    <li class="list-inline-item active" id="get-albums">
                        <input type="radio" id="album-type" name="music-type" value="0" {{ (!isset($_COOKIE['music_type']) || $_COOKIE['music_type'] == 'albums') ? 'checked' : '' }}>
                        <label for="album-type">Albums</label>
                    </li>
                    <li class="list-inline-item" id="get-tracks">
                        <input type="radio" id="track-type" name="music-type" value="1" {{ (isset($_COOKIE['music_type']) && $_COOKIE['music_type'] == 'tracks') ? 'checked' : '' }}>
                        <label for="track-type">Tracks</label>
                    </li>
                </ul>
            </div>
            <div class="container-fluid in-music-container">
                <div class="items">
                    @if (isset($_COOKIE['music_type']) && ($_COOKIE['music_type'] == 'tracks'))
                        @include('pages.allmusic.tracks')
                    @else
                        @include('pages.allmusic.albums')
                    @endif
                </div>
                <div class="loading-overlap">
                    <i class="fa fa-spinner fa-spin fa-3x fa-fw"></i>
                </div>
            </div>
        </div>
    </div>
    <div class="music-right-sidebar">
        <div class="close-sidebar">
            Close
        </div>
    </div>
    <script src="/resources/assets/js/all-m.js"></script>
@stop