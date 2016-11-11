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


    $('input[name="music-type"]').on('change', function(){
        var currentType = $(this).val();
        var container = $('.in-music-container .items');
        var generatedHtml = '';
        var tempItem = '';
        var token = $('input[name="csrf-token"]').val();
        var loadOverlap = $('.loading-overlap');

        $(container).empty();
        $(loadOverlap).fadeIn();

        if (currentType == 1) // track
        {
            $.ajax({
                type: 'POST',
                url: '/allmusic/tracks',
                data: ({_token : token}),
                success: function(data)
                {
                    var items = JSON.parse(data);
                    $.each(items, function(index, value){
                        tempItem = '<div class="track-item">' +
                            '<div class="track-img">' +
                            '<img src="' + value.track_image + '" alt="">' +
                            '</div>' +
                            '<div class="track-info-block">' +
                            '<p class="artist-name">' + value.artist_name + '</p>' +
                            '<p class="track-name">' + value.track_name + '</p>' +
                            '</div>' +
                            '<div class="add-track-info">' +
                            '<p class="track-time">' + value.duration + '</p>' +
                            '<b class="fa fa-heart-o"></b>' +
                            '<b class="fa fa-plus"></b>' +
                            '<b class="fa fa-download"></b>' +
                            '</div>' +
                            '</div>';
                        generatedHtml += tempItem;
                    });
                    $(loadOverlap).fadeOut();
                    $(container).html(generatedHtml);
                }
            });
        }
        else if (currentType == 0) // album
        {
            $.ajax({
                type: 'POST',
                url: '/allmusic/albums',
                data: ({_token : token}),
                success: function(data)
                {
                    var items = JSON.parse(data);
                    $.each(items, function(index, value){
                        tempItem = '<div class="album-item">' +
                            '<img src="' + value.album_image + '" alt="">' +
                            '<div class="album-info">' +
                            '<div class="in-album-info">' +
                            '<p class="album-artist">' + value.artist_name + '</p>' +
                            '<p class="album-name">' + value.album_name + '</p>' +
                            '<p class="album-year">' + value.year + '</p>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                        generatedHtml += tempItem;
                    });
                    $(loadOverlap).fadeOut();
                    $(container).html(generatedHtml);
                }
            });
        }
    });
});