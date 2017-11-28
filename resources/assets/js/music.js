var generatePlaylistTrack = function(track)
{
    var html = '<div class="track-item" track-id="' + track.id + '">' +
                    '<div class="track-img">' +
                        '<img src="/resources/assets/images/music_images/' + track.photo + '" alt="">' +
                    '</div>' +
                    '<div class="track-info-block">' +
                        '<p class="artist-name">' + track.name + '</p>' +
                    '   <p class="track-name">' + track.artist + '</p>' +
                    '</div>' +
                    '<div class="add-track-info">' +
                        '<p class="track-time">' + track.duration + '</p>' +
                        '<b class="fa fa-heart-o"></b>' +
                        '<b class="fa fa-plus add-track-to-user"></b>' +
                        '<a class="fa fa-download" href="/resources/tracks/' + track.url + '" download target="_blank"></a>' +
                    '</div>' +
                '</div>';

    return html;
};

var searchFilter = function(e)
{
    var form = $(e).parents('form');
    var getData = form.serialize();

    var page = window.location.href.split('?')[0];
    toPage(page + '?' + getData, true);
};

$(function(){
    var volumeIsOpen = false;

    $('body').on('click', '.controller-volume', function(e){
        var target = $(e.target);
        if (!target.is('.music-player-volume') && !target.is('.music-player-volume-gone') && !target.is('.music-player-volume-progress'))
        {
            if (volumeIsOpen)
            {
                $('.music-player-volume').fadeOut(300)
                volumeIsOpen = false;
            }
            else
            {
                $('.music-player-volume').fadeIn(300);
                volumeIsOpen = true;
            }
        }
    });

    $('#main-content').on('click', '.album-title .fa-outdent, .playlist-title .fa-outdent', function () {
        console.log("add in playlist album-" + $(this).attr("album_id"));
        var trackBlocks = $('.music-right-sidebar .album-track-items .profile-track-item');
        if(trackBlocks.length == 0)
            trackBlocks = $('.music-right-sidebar .playlist-track-items .profile-track-item');
        var tracksId = new Array();
        $.each(trackBlocks, function (index, value) {
            tracksId.push($(value).attr('track_id'));
            // console.log($(value).attr('track_id'));
        });
        console.log(tracksId);
        playlist.add(tracksId);
        playlist.play(tracksId[0]);
    });

    $('#main-content').on('click', '.album-title .fa-play, .playlist-title .fa-play', function () {
        console.log("play album-" + $(this).attr("album_id"));
        var trackBlocks = $('.music-right-sidebar .album-track-items .profile-track-item');
        if(trackBlocks.length == 0)
            trackBlocks = $('.music-right-sidebar .playlist-track-items .profile-track-item');
        var tracksId = new Array();
        $.each(trackBlocks, function (index, value) {
            tracksId.push($(value).attr('track_id'));
            // console.log($(value).attr('track_id'));
        });
        console.log(tracksId);
        playlist.clear();
        playlist.add(tracksId);
        playlist.play(tracksId[0]);
    });
});