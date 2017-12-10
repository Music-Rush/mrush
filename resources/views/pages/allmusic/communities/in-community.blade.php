<input type="hidden" name="token" value="{{ csrf_token() }}">
<input type="hidden" name="community-id" value="{{ $community_info->community_id }}">

<div class="container-fluid all-music-container">
    <div class="music-filters-block">
        <div class="container-fluid music-filters">
            <p class="title">Community playlist</p>
            <form action="" method="get" class="search_filter">
                <button type="button" class="btn btn-primary show-community-playlist" playlist_id="{{ $playlist->playlist_id }}" playlist_name="{{ $playlist->playlist_name }}">Show playlist</button>
            </form>
            @if ($community_info->userExist)
                <button type="button" class="btn btn-danger btn-community-leave">Unsubscribe from the community</button>
            @else
                <button type="button" class="btn btn-success {{ Auth::guest() ? '' : 'btn-community-join' }}" @if (Auth::guest()) onclick="toPage('/signin', true)" @endif>Subscribe to the community</button>
            @endif
            <div class="leave-comment">
                <div class="leave-comment-text">
                    <textarea name="comment-text" placeholder="Type your comment here..."></textarea>
                </div>
                <div class="leave-comment-send">
                    <button type="button" class="btn btn-default btn-comment {{ Auth::guest() || !$community_info->userExist ? '' : 'btn-comment-send' }}" {{ $community_info->userExist ? '' : 'disabled' }}>Send</button>
                </div>
            </div>
        </div>
    </div>
    <div class="right-music-block">
        <div class="music-settings">
            <p class="title">{{ $community_info->community_name }}, comments ({{ count($comments) }})</p>
        </div>
        <div class="container-fluid in-music-container">
            <div class="community-comments">
                @foreach ($comments as $key => $item)
                    <div class="comment-item">
                        <div class="comment-item-info">
                            <p class="comment-user">{{ $item->name }}</p>
                            <p class="comment-date">{{ DateTime::createFromFormat('Y-m-d H:i:s', $item->comment_created_at)->format('Y, d M H:i') }}</p>
                        </div>
                        <div class="comment-text">
                            {{ $item->comment_text }}
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
<div class="music-right-sidebar">
    <div class="close-sidebar">
        Close
    </div>
    <div class="playlist-title">
        <p class="playlist-name"></p>
    </div>
    <div class="playlist-track-items">
    </div>
</div>