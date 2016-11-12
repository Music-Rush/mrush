<div class="container-fluid profile-container">
    <div class="container-fluid profile-menu-container">
        <ul class="profile-menu">
            <a href="/profile/tracks"><li class={{ $content == 'tracks' ? 'checked-btn' : ''}}>Tracks</li></a>
            <a href="/profile/playlists"><li class={{ $content == 'playlists' ? 'checked-btn' : ''}}>Playlists</li></a>
            <a href="/profile/albums"><li class={{ $content == 'albums' ? 'checked-btn' : ''}}>Albums</li></a>
            <a href="/profile/mycommunities"><li class={{ $content == 'mycommunities' ? 'checked-btn' : ''}}>My Communities</li></a>
            <a href="/profile/settings"><li class={{ $content == 'settings' ? 'checked-btn' : ''}}>Settings</li></a>
        </ul>
    </div>
    @if(!empty($content))
        @include("pages.profile." . $content)
    @endif
</div>