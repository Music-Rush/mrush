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
        @include('pages.allmusic.tracks')
    </div>
    <div class="music-right-sidebar">
        <div class="close-sidebar">
            Close
        </div>
    </div>
@stop