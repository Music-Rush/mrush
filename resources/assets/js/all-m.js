$(function(){
    var isOpen = false;
    $('.album-item').click(function(){
        if (!isOpen)
        {
            $('.music-right-sidebar').css({
                'left' : 0
            });
            isOpen = true;
        }
    });
    $('.close-sidebar').click(function(){
        if (isOpen)
        {
            $('.music-right-sidebar').css({
                'left' : -9999
            });
            isOpen = false;
        }
    });

    var albumItems = {
        '0' : {
            'album_id' : 1,
            'album_name' : 'OST',
            'artist_name' : 'MR. ROBOT',
            'year' : 2016,
            'album_image' : ''
        },
        '1' : {
            'album_id' : 2,
            'album_name' : 'Blurryface',
            'artist_name' : 'Twenty One Pilots',
            'year' : 2015,
            'album_image' : ''
        }
    };
    var trackItems = {
        '0' : {
            'track_id' : 1,
            'track_name' : 'OST',
            'duration' : '3:28',
            'artist_name' : 'MR. ROBOT',
            'year' : 2016,
            'track_image' : ''
        },
        '1' : {
            'track_id' : 2,
            'track_name' : 'Blurryface',
            'duration' : '2:28',
            'artist_name' : 'Twenty One Pilots',
            'year' : 2015,
            'track_image' : ''
        }
    };

    $('input[name="music-type"]').on('change', function(){
        var currentType = $(this).val();
        var container = $('.in-music-container');
        var generatedHtml = '';
        var tempItem = '';

        if (currentType == 1) // track
        {
            $.each(trackItems, function(index, value){
                tempItem = '<div class="track-item">' +
                    '<div class="track-img">' +
                        '<img src="' + value["track_image"] + '" alt="">' +
                    '</div>' +
                    '<div class="track-info-block">' +
                        '<p class="artist-name">' + value["artist_name"] + '</p>' +
                        '<p class="track-name">' + value["track_name"] + '</p>' +
                    '</div>' +
                    '<div class="add-track-info">' +
                        '<p class="track-time">' + value["duration"] + '</p>' +
                        '<b class="fa fa-heart-o"></b>' +
                        '<b class="fa fa-plus"></b>' +
                        '<b class="fa fa-download"></b>' +
                    '</div>' +
                    '</div>';
                generatedHtml += tempItem;
            });
        }
        else if (currentType == 0) // album
        {
            $.each(albumItems, function(index, value){
                tempItem = '<div class="album-item">' +
                    '<img src="' + value["album_image"] + '" alt="">' +
                    '<div class="album-info">' +
                        '<div class="in-album-info">' +
                        '<p class="album-artist">' + value["artist_name"] + '</p>' +
                        '<p class="album-name">' + value["album_name"] + '</p>' +
                        '<p class="album-year">' + value["year"] + '</p>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
                generatedHtml += tempItem;
            });
        }

        $(container).empty();
        $(container).html(generatedHtml);
    });
});