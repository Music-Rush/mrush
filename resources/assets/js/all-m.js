$(function(){
    var isOpen = false;
    $('#main-content').on('click', '.album-item', function(){
        console.log('click on album item');
        if (!isOpen)
        {
            $('.music-right-sidebar').css({
                'left' : 0
            });
            isOpen = true;
        }
    });
    $('#main-content').on('click', '.close-sidebar', function(){
        if (isOpen)
        {
            $('.music-right-sidebar').css({
                'left' : -9999
            });
            isOpen = false;
        }
    });

    var isOpenMusicList = false;
    $('footer').on('click', '.controller-list', function(){
        console.log('click on album item');
        if (!isOpenMusicList)
        {
            $('.music-list').css({
                'bottom' : 76
            });
            isOpenMusicList = true;
        }
        else
        {
            $('.music-list').css({
                'bottom' : -9999
            });
            isOpenMusicList = false;
        }
    });
    $('footer').on('click', '.music-list-close-sidebar', function(){
        if (isOpenMusicList)
        {
            $('.music-list').css({
                'bottom' : -9999
            });
            isOpenMusicList = false;
        }
    });

    /*jQuery("#to-page").click(function(){
        var href = jQuery(this).attr("href");
        //if( href.indexOf('/') != 0 ) return;

        if ( window.history && history.pushState ) {
            history.pushState   ("", "", href);
            history.replaceState("", "", href);
            toPage(href);
        } else {
            location.hash = href;
        }
        return false;
    });*/


    $(window).bind('popstate', function() {
        toPage(location.pathname, false);
    });

    $('#main-content').on('change', 'input[name="music-type"]', function(){
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

    /* Load page with ajax */

    toPage = function(pageName, flag)
    {
        console.log(pageName);
        $('#main-content').load(pageName);
        if(flag && pageName != window.location)
            window.history.pushState(null, null, pageName);
        /*window.history.pushState(null, null, "/" + pageName);
        window.history.replaceState(null, null, "/" + pageName);
        return false;*/
    }

});