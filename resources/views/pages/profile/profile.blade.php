<div class="container-fluid profile-container">
    <div class="container-fluid profile-menu-container">
        <ul class="profile-menu">
            <a id="to-page" onclick="toPage('/profile/tracks', true)"><li class={{ $content == 'tracks' ? 'checked-btn' : ''}}>Tracks</li></a>
            <a id="to-page" onclick="toPage('/profile/playlists', true)"><li class={{ $content == 'playlists' ? 'checked-btn' : ''}}>Playlists</li></a>
            <a id="to-page" onclick="toPage('/profile/albums', true)"><li class={{ $content == 'albums' ? 'checked-btn' : ''}}>Albums</li></a>
            <a id="to-page" onclick="toPage('/profile/mycommunities', true)"><li class={{ $content == 'mycommunities' ? 'checked-btn' : ''}}>My Communities</li></a>
            <a id="to-page" onclick="toPage('/profile/settings', true)"><li class={{ $content == 'settings' ? 'checked-btn' : ''}}>Settings</li></a>
        </ul>
    </div>
    @if(!empty($content))
        @include("pages.profile." . $content)
    @endif
</div>