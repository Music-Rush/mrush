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
    $('#main-content').on('click', '.profile-album-item', function(){
        console.log('click on album item');
        if (!isOpen)
        {
            animateBlock(['.music-right-sidebar'], "fadeIn", 200);
            isOpen = true;
        }
    });
    $('#main-content').on('click', '.profile-playlist-item', function(){
        console.log('click on playlist item');
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
        animateBlock($('.music-right-sidebar'), "fadeOut", 200);
        isOpen = false;
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

    signup = function(username, userEmail, userPassword, userConfirmPassword, token)
    {
        $.ajax({
            type: 'POST',
            url: '/signup',
            data: ({
                _token: token,
                email: userEmail,
                password: userPassword,
                name: username,
                password_confirmation: userConfirmPassword
            }),
            beforeSend: function()
            {
                $('.ajax-signup-btn').html('<i class="fa fa-spinner fa-spin fa-3x fa-fw" style="font-size: 13px"></i>');
            },
            error: function()
            {
                $('.ajax-signup-btn').html('Sign up');
            },
            success: function(data)
            {
                answer = JSON.parse(data);
                console.log(answer);
                if (answer.status)
                {
                    $('.ajax-signup-btn').html('<i class="fa fa-check" style="font-size: 13px"></i>');
                    toPage('/signin', true);
                }
                else
                {
                    var errors = '';
                    $.each(answer.messages, function(key, value){
                        errors += '<li>' + value + '</li>';
                    });
                    $('.signin-alert ul').html(errors);
                    $('.signin-alert').fadeIn(300, function(){
                        setTimeout(function(){
                            $('.signin-alert').fadeOut(300);
                        }, 3000);
                    });
                    $('.ajax-signup-btn').html('Sign up');
                }
            }
        });
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
            beforeSend: function()
            {
                $('.ajax-signin-btn').html('<i class="fa fa-spinner fa-spin fa-3x fa-fw" style="font-size: 13px"></i>');
            },
            error: function()
            {
                $('.ajax-signin-btn').html('Sign in');
            },
            success: function(data)
            {
                answer = JSON.parse(data);
                console.log(answer);
                if (answer.status)
                {
                    $('.ajax-signin-btn').html('<i class="fa fa-check" style="font-size: 13px; color: #089680"></i>');
                    $('ul.main-menu').empty();
                    var htmlMenu = "<a id='to-page' onclick='toPage(\"/home\", true)'>" +
                        "<li class='float-lg-left list-inline-item main-logo'>" +
                        "<img src='/resources/assets/images/logo.png' alt=''>" +
                        "</li>" +
                        "</a>" +
                        "<li class='float-lg-right list-inline-item user-logout'>" +
                        "<a id='to-page'><b class='fa fa-sign-out'></b></a>" +
                        "</li>" +
                        "<li class='float-lg-right list-inline-item my-profile'>" +
                        "<a id='to-page' onclick='toPage(\"/profile\", true)'>My Profile</a>" +
                        "</li>" +
                        "<li class='float-lg-right list-inline-item'>" +
                        "<a id='to-page' onclick='toPage(\"/concerts\", true)'>Concerts</a>" +
                        "</li>" +
                        "<li class='float-lg-right list-inline-item'>" +
                        "<a href='' id='to-page'>Communities</a>" +
                        "</li>" +
                        "<li class='float-lg-right list-inline-item'>" +
                        "<a id='to-page' onclick='toPage(\"/profile/playlists\", true)'>My Playlists</a>" +
                        "</li>" +
                        "<li class='float-lg-right list-inline-item'>" +
                        "<a id='to-page' onclick='toPage(\"/allmusic\", true)'>All Music</a>" +
                        "</li>";
                    $('ul.main-menu').html(htmlMenu);
                    toPage('/home', true);
                }
                else
                {
                    $('.signin-alert ul').html('<li>Incorrect email or password. Check entered data and try again!</li>');
                    $('.signin-alert').fadeIn(300, function(){
                        setTimeout(function(){
                            $('.signin-alert').fadeOut(300);
                        }, 3000);
                    });
                    $('.ajax-signin-btn').html('Sign in');
                }
            }
        });
    };

    $('body').on('click', '.ajax-signin-btn', function(){
        token = $('input[name="_token"]').val();
        email = $('input[name="email"]').val();
        password = $('input[name="password"]').val();

        signin(email, password, token);
    });

    $('body').on('click', '.ajax-signup-btn', function(){
        name = $('input[name="name"]').val();
        token = $('input[name="_token"]').val();
        email = $('input[name="email"]').val();
        password = $('input[name="password"]').val();
        confirmPassword = $('input[name="password_confirmation"]').val();

        signup(name, email, password, confirmPassword, token);
    });

    $('body').on('click', '.upload-btn', function(){
        var files = $('input[name="upload-track"]').prop('files');
        var token = $('input[name="_token"]').val();
        console.log(files);
        if (files.length > 0)
        {
            uploadTrack(files, token);
        }
        else
        {
            console.log('error, file is empty');
        }
    });

    $('body').on('change', '#upload_track', function(){
        var container = $('.upload-track-block .title');
        container.html('Selected ' + $('input[name="upload-track"]').prop('files').length + ' tracks');
        container.css({
            'font-size' : 16 + 'px',
            'font-weight' : 'normal',
            'margin-top' : 87 + 'px'
        });
    });

    uploadTrack = function(files, token)
    {
        var formData = new FormData();
        formData.append('_token', token);

        animateBlock(['.form-upload-track'], 'fadeOut', 100);

        $.each(files, function(key, value){
            formData.append('file_' + key, value);
        });

        $.ajax({
            dataType: 'text',
            cache: false,
            contentType: false,
            processData: false,
            type: 'POST',
            url: '/tracks/upload',
            data: formData,
            beforeSend: function(){
                console.log('Upload is started');
            },
            xhr: function()
            {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function(evt){
                    if (evt.lengthComputable)
                    {
                        var percentComplete = evt.loaded / evt.total * 100;
                        $('.upload-procent').html(Math.round(percentComplete) + '%');
                        $('.progress').css({
                            'height' : percentComplete + '%'
                        });
                    }
                }, false);

                return xhr;
            },
            success: function(data)
            {
                console.log(data);
                animateBlock(['.upload', '.upload-ok'], 'fadeOut', 100, true);
                setTimeout(function() {
                    animateBlock(['.form-upload-track', '.upload-ok', '.upload'], 'fadeIn', 100, true);
                    $('.progress').css({
                        'height' : 0
                    });
                    $('.upload-procent').html('0%');
                    var container = $('.upload-track-block .title');
                    container.html('+');
                    container.css({
                        'font-size' : 50 + 'px',
                        'font-weight' : 'bold',
                        'margin-top' : 63 + 'px'
                    });
                }, 3000);
            }
        });
    };

    $('body').on('click', '.user-logout', function(){
        $.ajax({
            url: '/logout',
            type: 'GET',
            beforeSend: function(){
                $('.loading-back').fadeIn(400);
            },
            success: function(data)
            {
                $('ul.main-menu').empty();
                var htmlMenu = "<a id='to-page' onclick='toPage(\"/home\", true)'>" +
                    "<li class='float-lg-left list-inline-item main-logo'>" +
                    "<img src='/resources/assets/images/logo.png' alt=''>" +
                    "</li>" +
                    "</a>" +
                    "<li class='float-lg-right list-inline-item my-profile'>" +
                    "<a id='to-page' onclick='toPage(\"/signin\", true)'>Sign In / Sign Up</a>" +
                    "</li>" +
                    "<li class='float-lg-right list-inline-item'>" +
                    "<a id='to-page' onclick='toPage(\"/concerts\", true)'>Concerts</a>" +
                    "</li>" +
                    "<li class='float-lg-right list-inline-item'>" +
                    "<a href='' id='to-page'>Communities</a>" +
                    "</li>" +
                    "<li class='float-lg-right list-inline-item'>" +
                    "<a id='to-page' onclick='toPage(\"/allmusic\", true)'>All Music</a>" +
                    "</li>";
                $('ul.main-menu').html(htmlMenu);
                toPage('/home', true);
            }
        });
    });

});