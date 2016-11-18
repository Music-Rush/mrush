$(function(){
    var isOpen = false;
    $('#main-content').on('click', '.album-item', function(){
        console.log('click on album item');
        if (!isOpen)
        {
            animateBlock(['.music-right-sidebar'], "fadeIn", 200);
            isOpen = true;
        }
    });
    $('#main-content').on('click', '.close-sidebar', function(){
        if (isOpen)
        {
            animateBlock(['.music-right-sidebar'], "fadeOut", 200);
            isOpen = false;
        }
    });

    var isOpenMusicList = false;
    $('footer').on('click', '.controller-list', function(){
        console.log('click on album item');
        if (!isOpenMusicList)
        {
            animateBlock(['.music-list'], "fadeIn", 200);
            isOpenMusicList = true;
        }
        else
        {
            animateBlock(['.music-list'], "fadeOut", 200);
            isOpenMusicList = false;
        }
    });
    $('footer').on('click', '.music-list-close-sidebar', function(){
        if (isOpenMusicList)
        {
            animateBlock(['.music-list'], "fadeOut", 200);
            isOpenMusicList = false;
        }
    });

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
        animateBlock(loadOverlap, "fadeIn", 200);

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
                    animateBlock(loadOverlap, "fadeOut", 200);
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
                    animateBlock(loadOverlap, "fadeOut", 200);
                    $(container).html(generatedHtml);
                }
            });
        }
    });


    var isSliderNullPosition = true;
    var clickCount = 0;
    $("#main-content").on('click', '.slider-next', function () {
        if(clickCount != 15) {
            clickCount += 1;
            if (isSliderNullPosition) {
                //$(".slider-prev").attr("disabled", "false");
                $(".slider-prev").css("cursor", "pointer");
                isSliderNullPosition = false;
            }
            var firstBlock = $(".first");
            console.log(firstBlock.next());
            if (firstBlock.next().attr("class") == "today-month") {
                var activeBlock = $(".active");
                var todayMonth = firstBlock.next();
                todayMonth.addClass("active");
                activeBlock.removeClass("active");

                todayMonth.next().addClass("first");
                firstBlock.removeClass("first");

                var mLeftString = activeBlock.css("left");
                var mLeft = parseFloat(mLeftString);
                $(".active").css("left", mLeft + 180);
                mLeftString = $(".slider-items").css("left");
                mLeft = parseFloat(mLeftString);
                $(".slider-items").css("left", mLeft - 180);
                /*mLeftString = $(".active").css("left");
                mLeft = parseFloat(mLeftString);*/
            }
            else {

                firstBlock.next().addClass("first");
                firstBlock.removeClass("first");

                var mLeftString = $(".slider-items").css("left");
                var mLeft = parseFloat(mLeftString);
                //$(".slider-items").css("left", mLeft - 62);
                $(".slider-items").animate({ "left" : mLeft - 62 }, 300);

                mLeftString = $(".active").css("left");
                mLeft = parseFloat(mLeftString);
                $(".active").animate({ "left" : mLeft + 62 }, 300);

                //$(".active").css("left", mLeft + 62);
            }
        }
    });
    $("#main-content").on('click', '.slider-prev', function () {
        if($(".slider-items").css("left") != "0px")
        {
            clickCount -= 1;
            var firstBlock = $(".first");
            if(firstBlock.prev().attr("class") == "today-month active")
            {
                var activeBlock = $(".active");
                var todayMonth = firstBlock.prev();
                todayMonth.prev().addClass("first");
                firstBlock.removeClass("first");

                while(todayMonth.attr("class") != "today-month")
                    todayMonth = todayMonth.prev();
                todayMonth.addClass("active");
                activeBlock.removeClass("active");

                var mLeftString = activeBlock.css("left");
                var mLeft = parseFloat(mLeftString);
                $(".active").css("left", mLeft - 180);
                mLeftString = $(".slider-items").css("left");
                mLeft = parseFloat(mLeftString);
                $(".slider-items").css("left", mLeft + 180);
                /*mLeftString = $(".active").css("left");
                mLeft = parseFloat(mLeftString);*/
            }
            else
            {
                firstBlock.prev().addClass("first");
                firstBlock.removeClass("first");


                var mLeftString = $(".slider-items").css("left");
                var mLeft = parseFloat(mLeftString);
                //$(".slider-items").css("left", mLeft + 62);
                $(".slider-items").animate({ "left" : mLeft + 62 }, 300);

                mLeftString = $(".active").css("left");
                mLeft = parseFloat(mLeftString);
                $(".active").animate({ "left" : mLeft - 62 }, 300);

                //$(".active").css("left", mLeft - 62);
            }
            if($(".slider-items").css("left") == "0px")
            {
                //$(this).attr("disabled", "true");
                //$(this).css("cursor", "default");
                isSliderNullPosition = true;
            }
        }
        else
        {
            //$(this).attr("disabled", "true");
            //$(this).css("cursor", "default");
            isSliderNullPosition = true;
        }
    });

    $("#main-content").on('click', '.city', function () {
        $(".selected-city").removeClass("selected-city");
        $(this).addClass("selected-city");
    });

    $("#main-content").on('click', '.today-block', function () {
        $(".selected-date").removeClass("selected-date");
        $(this).addClass("selected-date");
        var container = $('.concerts-container .concert-items');
        var generatedHtml = '';
        var tempItem = '';
        var token = $('input[name="csrf-token"]').val();
        var loadOverlap = $('.loading-overlap');
        var city = $(".selected-city").attr("info");
        var url = "http://afisha.tut.by/concert-" + city + "/";


        $(container).empty();
        animateBlock(loadOverlap, "fadeIn", 200);
        $.ajax({
            type: 'POST',
            url: '/concerts/getConcerts',
            data: ({_token : token, pageUrl : url}),
            success: function(data)
            {
                var items = JSON.parse(data);
                console.log(items);
                $.each(items, function(index, value){
                    tempItem = '<a href="' + value.url + '" target="_blank">'+
                    '<div class="concert-item">'+
                        '<div class="concert-img">'+
                        '<img src="' + value.img + '" alt="">' +
                        '</div>'+
                        '<div class="concert-info">'+
                        '<p class="concert-date">' + value.where + '</p>'+
                    '<p class="concert-name">' + value.name + '</p>'+
                    '</div>'+
                    '</div>'+
                    '</a>';
                    generatedHtml += tempItem;
                });
                animateBlock(loadOverlap, "fadeOut", 200);
                $(container).html(generatedHtml);
            }
        });
    });

    $("#main-content").on('click', '.date', function () {
        $(".selected-date").removeClass("selected-date");
        $(this).addClass("selected-date");
        var container = $('.concerts-container .concert-items');
        var generatedHtml = '';
        var tempItem = '';
        var token = $('input[name="csrf-token"]').val();
        var loadOverlap = $('.loading-overlap');
        var date = $(".selected-date").attr("url");
        var url = "http://afisha.tut.by/day/concert/" + date;

        $(container).empty();
        animateBlock(loadOverlap, "fadeIn", 200);
        $.ajax({
            type: 'POST',
            url: '/concerts/getConcerts',
            data: ({_token : token, pageUrl : url}),
            success: function(data)
            {
                var items = JSON.parse(data);
                console.log(items);
                $.each(items, function(index, value){
                    tempItem = '<a href="' + value.url + '" target="_blank">'+
                        '<div class="concert-item">'+
                        '<div class="concert-img">'+
                        '<img src="' + value.img + '" alt="">' +
                        '</div>'+
                        '<div class="concert-info">'+
                        '<p class="concert-date">' + value.where + '</p>'+
                        '<p class="concert-name">' + value.name + '</p>'+
                        '</div>'+
                        '</div>'+
                        '</a>';
                    generatedHtml += tempItem;
                });
                animateBlock(loadOverlap, "fadeOut", 200);
                $(container).html(generatedHtml);
            }
        });
    });
    /* Load page with ajax */

    toPage = function(pageName, flag)
    {
        console.log(pageName);
        $('.loading-back').fadeIn(400);
        $('#main-content').load(pageName, function(){
            $('.loading-back').fadeOut(400);
        });
        if(flag && pageName != window.location)
            window.history.pushState(null, null, pageName);
        /*window.history.pushState(null, null, "/" + pageName);
        window.history.replaceState(null, null, "/" + pageName);
        return false;*/
    }

    animateBlock = function(blocks, fade, speed, merge)
    {
        merge = (merge == undefined) ? false : true;

        if ($.isArray(blocks))
        {
            $.each(blocks, function(index, value){
                if (fade == "fadeIn")
                {
                    if ($(value).is(":visible") && merge)
                        $(value).fadeOut(speed);
                    else
                        $(value).fadeIn(speed);
                }
                else if (fade == "fadeOut")
                {
                    if ($(value).is(":hidden") && merge)
                        $(value).fadeIn(speed);
                    else
                        $(value).fadeOut(speed);
                }
            });
        }
        else
        {
            if (fade == "fadeIn")
            {
                if (blocks.is(":visible") && merge)
                    blocks.fadeOut(speed);
                else
                    blocks.fadeIn(speed);
            }
            else
            {
                if (blocks.is(":hidden") && merge)
                    blocks.fadeIn(speed);
                else
                    blocks.fadeOut(speed);
            }
        }
    };

    signin = function(email, password, token)
    {
        $.ajax({
            type: 'POST',
            url: '/signin/ajax',
            data: ({
                _token: token,
                _email: email,
                _password: password
            }),
            success: function(data)
            {
                answer = JSON.parse(data);
                console.log(answer);
                if (answer.status)
                {
                    toPage('/home', true);
                }
                else
                {
                    alert('Authentication error, try again!');
                }
            }
        });
    };

    $('body').on('click', '.ajax-signin-btn', function(){
        console.log('kek');
        token = $('input[name="_token"]').val();
        email = $('input[name="email"]').val();
        password = $('input[name="password"]').val();

        signin(email, password, token);
    });
});