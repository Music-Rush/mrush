$(function(){
    var isOpen = false;
    $('#main-content').on('click', '.album-item', function(){
        console.log('click on album item');
        var albumId = $(this).attr("album_id");
        if (!isOpen)
        {
            animateBlock(['.music-right-sidebar'], "fadeIn", 200);
            isOpen = true;
        }
    });
    $('#main-content').on('click', '.profile-album-item', function(){
        console.log('click on album item');
        helpName = $(this).find('.profile-album-name').text()
        var token = $('input[name="_token"]').val();
        var albumId = $(this).attr("album_id");
        var albumName = $(this).find('.profile-album-name').text();
        var generatedHtml = '';
        var tempItem = '';
        var contentBlock = $('.music-right-sidebar .album-track-items');
        $('.music-right-sidebar #album-edit-btn').attr('album_id', albumId);
        if (!isOpen)
        {
            $.ajax({
                url: '/profile/albums/' + albumId + '/getAlbumTracks',
                type: 'POST',
                data: ({
                    _token: token
                }),
                success: function(data)
                {
                    $('.music-right-sidebar .album-title .album-name').text(albumName);
                    console.log(data);
                    var tracks = JSON.parse(data);
                    contentBlock.empty();
                    $.each(tracks, function (index, value) {
                        tempItem = "<div class='profile-track-item' track_id='" + value.track_id + "'>" +
                            "<div class='track-img'>" +
                            "<img src='/resources/assets/images/music_images/" + value.track_photo + "' alt=''>" +
                            "</div>" +
                            "<div class='track-info-block'>" +
                            "<p class='artist-name'>" + value.artist_name + "</p>" +
                            "<p class='track-name'>" + value.track_name + "</p>" +
                            "</div>" +
                            "<div class='add-track-info'>" +
                            "<p class='track-time'>" + value.duration + "</p>" +
                            "<b class='fa fa-edit' data-toggle='modal' data-target='#editTrackModal'></b>" +
                            "<b class='fa fa-times-circle' data-toggle='modal' data-target='#deleteTrack'></b>" +
                            "<a class='fa fa-download' href='/resources/tracks/" + value.track_download_name + "' download></a>" +
                            "</div>" +
                            "</div>";
                        generatedHtml += tempItem;
                    });
                    $(contentBlock).html(generatedHtml);
                },
                error: function(data)
                {
                    console.log(data.responseText);
                }
            });
            animateBlock(['.music-right-sidebar'], "fadeIn", 200);
            isOpen = true;
        }
    });
    $('#main-content').on('click', '.profile-playlist-item', function(){
        console.log('click on playlist item');
        helpName = $(this).find('.profile-playlist-name').text();
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
            $('.music-right-sidebar .album-track-items').empty();
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
                        tempItem = '<div class="track-item" track_id="' +  value.track_id + '">' +
                            '<div class="track-img">' +
                            '<img src="/resources/assets/images/music_images/' + value.track_photo + '" alt="">' +
                            '</div>' +
                            '<div class="track-info-block">' +
                            '<p class="artist-name">' + value.artist_name + '</p>' +
                            '<p class="track-name">' + value.track_name + '</p>' +
                            '</div>' +
                            '<div class="add-track-info">' +
                            '<p class="track-time">' + value.duration + '</p>' +
                            '<b class="fa fa-heart-o"></b>' +
                            '<b class="fa fa-plus"></b>' +
                            '<a class="fa fa-download" href="/resources/tracks/' + value.track_download_name + '" download></a>' +
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
                        tempItem = '<div class="album-item" album_id="' + value.album_id + '">' +
                            '<img src="/resources/assets/images/album_images/' + value.album_photo + '" alt="">' +
                            '<div class="album-info">' +
                            '<div class="in-album-info">' +
                            '<p class="album-artist">' + value.artist_name + '</p>' +
                            '<p class="album-name">' + value.album_name + '</p>' +
                            '<p class="album-year">' + value.album_year + '</p>' +
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
                        "<a id='to-page' onclick='toPage(\"communities\", true)'>Communities</a>" +
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
        var files = getValidatedFiles('input[name="upload-track"]');
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
        container.html('Selected ' + getValidatedFiles('input[name="upload-track"]').length + ' tracks');
        container.css({
            'font-size' : 16 + 'px',
            'font-weight' : 'normal',
            'margin-top' : 87 + 'px'
        });
    });

    getValidatedFiles = function(input)
    {
        var files = $(input).prop('files');
        var newFiles = [];
        $.each(files, function(key, value){
            if (value.type == "audio/mp3")
                newFiles.push(value);
        });

        return newFiles;
    };

    uploadClear = function()
    {
        animateBlock(['.form-upload-track', '.upload-ok', '.upload'], 'fadeIn', 100, true);
        $('.progress').css({
            'height' : 0
        });
        $('.upload-procent').html('0%');
        $('.input[name="music-type"]').val("");
        var container = $('.upload-track-block .title');
        container.html('+');
        container.css({
            'font-size' : 50 + 'px',
            'font-weight' : 'bold',
            'margin-top' : 63 + 'px'
        });
    };

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
                insertTrackBlock(data);
                animateBlock(['.upload', '.upload-ok'], 'fadeOut', 100, true);
                setTimeout(function() {
                    uploadClear();
                }, 1000);
            },
            error: function(data)
            {
                console.log(data.responseText);
            }
        });
    };

    insertTrackBlock = function(data)
    {
        var tracks = JSON.parse(data);
        var container = $(".profile-container .tracks-container .profile-track-items");
        var trackHTML = "";
        $.each(tracks, function(key, value){
            trackHTML = "<div class='profile-track-item' track_id=" + value['track_in_user_id'] + " two-track-id='" + value['track_id'] + "'>"+
                "<div class='track-img'>" +
                "<img src=" + "/resources/assets/images/music_images/" +  value['image_path'] + " alt=''>" +
                "</div>" +
                "<div class='track-info-block'>" +
                "<p class='artist-name'>" + value['artist'] + "</p>" +
                "<p class='track-name'>" + value['name'] + "</p>" +
                "</div>" +
                "<div class='add-track-info'>" +
                "<p class='track-time'>" + value['duration'] + "</p>" +
                "<b class='fa fa-edit' data-toggle='modal' data-target='#editTrackModal'></b>" +
                "<b class='fa fa-times-circle' data-toggle='modal' data-target='#deleteTrack'></b>" +
                "<b class='fa fa-download'></b>" +
                "</div>" +
                "</div>";
            container.prepend(trackHTML);
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

    $('#main-content').on('click', '#delete-track-from-profile', function () {
        var addInfo = $(this).parent();
        var trackBlock = addInfo.parent();
        var trackInUserId = trackBlock.attr("track_id");

        $('#deleteTrack #delete-track-profile-btn').attr('track_id', trackInUserId);
    });

    $('#main-content').on('click', '#delete-track-profile-btn', function () {
        var trackInUserId = $(this).attr("track_id");
        console.log(trackInUserId);
        var trackBlock = $('.profile-track-item[track_id=' + trackInUserId + ']');
        console.log(trackBlock);
        var token = $('input[name="_token"]').val();

        $.ajax({
            url: '/profile/tracks/' + trackInUserId + '/delete',
            type: 'POST',
            data: ({
                _token: token
            }),
            success: function(data)
            {
                console.log(data);
                status = JSON.parse(data);

                if(status == "true")
                {
                    trackBlock.fadeOut(200, function () {
                        trackBlock.remove();
                    });
                }
            },
            error: function(data)
            {
                console.log(data.responseText);
            }
        });
    });

    $('#main-content').on('click', '.add-track-to-user', function(e){
        var trackItem = $(this).parents('.track-item');
        var trackId = $(trackItem).attr('track-id');
        var token = $('input[name="_token"]').val();
        var thisBtn = this;

        $.ajax({
            url: '/profile/tracks/' + trackId + '/add',
            type: 'POST',
            data: {_token: token},
            beforeSend: function()
            {
                $(thisBtn).removeClass();
                $(thisBtn).addClass('fa fa-spinner fa-spin fa-3x fa-fw');
            },
            success: function(data)
            {
                console.log(data);
                var result = JSON.parse(data);
                if (result.status)
                {
                    console.log('okay');
                    $(thisBtn).removeClass();
                    $(thisBtn).addClass('fa fa-check');
                    setTimeout(function(){
                        $(thisBtn).removeClass();
                        $(thisBtn).addClass('fa fa-times-circle');
                        $(thisBtn).addClass('delete-track-from-user');
                    }, 500);
                    $(trackItem).attr('track-in-user', result.new_id);
                }
                else
                {
                    console.log('error');
                }
            },
            error: function(data)
            {
                console.log(data.responseText);
            }
        });
    });

    $('#main-content').on('click', '.delete-track-from-user', function(e){
        var trackItem = $(this).parents('.track-item');
        var trackId = $(trackItem).attr('track-in-user');
        var token = $('input[name="_token"]').val();
        var thisBtn = this;

        $.ajax({
            url: '/profile/tracks/' + trackId + '/delete',
            type: 'POST',
            data: {_token: token},
            beforeSend: function()
            {
                $(thisBtn).removeClass();
                $(thisBtn).addClass('fa fa-spinner fa-spin fa-3x fa-fw');
            },
            success: function(data)
            {
                console.log(data);
                var result = JSON.parse(data);
                if (result)
                {
                    console.log('okay');
                    $(thisBtn).removeClass();
                    $(thisBtn).addClass('fa fa-check');
                    setTimeout(function(){
                        $(thisBtn).removeClass();
                        $(thisBtn).addClass('fa fa-plus');
                        $(thisBtn).addClass('add-track-to-user');
                    }, 500);
                }
                else
                {
                    console.log('error');
                }
            },
            error: function(data)
            {
                console.log(data.responseText);
            }
        });
    });

    $('#main-content').on('click', '.track-edit-btn', function () {
        var trackItem = $(this).parents('.profile-track-item');
        var trackId = trackItem.attr('two-track-id');
        var token = $('input[name="_token"]').val();

        $.ajax({
            url: '/profile/tracks/' + trackId + '/get',
            type: 'POST',
            data: {_token: token},
            success: function(data)
            {
                var track = JSON.parse(data);

                $('#editTrackModal').attr('track_id', trackId);
                $('#editTrackModal input[name="track-name"]').val(track.track_name);
                $('#editTrackModal input[name="track-artist"]').val(track.artist_name);
            },
            error: function(data)
            {
                console.log(data.responseText);
            }
        });
    });

    $('#main-content').on('click', '.save-track-edit-btn', function () {
        var editModal = $(this).parents('#editTrackModal');
        var trackId = editModal.attr('track_id');
        var token = $('input[name="_token"]').val();
        var trackName = $('#editTrackModal input[name="track-name"]').val();
        var artistName = $('#editTrackModal input[name="track-artist"]').val();

        $.ajax({
            url: '/profile/tracks/' + trackId + '/edit',
            type: 'POST',
            data: ({
                _token: token,
                artist: artistName,
                track_name: trackName
            }),
            success: function(data)
            {
                var status = JSON.parse(data);
                console.log(status);

                if(status)
                {
                    console.log("okay");
                    $('.profile-track-item[two-track-id=' + trackId + '] .track-info-block .artist-name').text(artistName);
                    $('.profile-track-item[two-track-id=' + trackId + '] .track-info-block .track-name').text(trackName);
                }
                else
                {
                    console.log("error");
                }
            },
            error: function(data)
            {
                console.log(data.responseText);
            }
        });
    });

    $('#main-content').on('click', '.all-music-container .track-item, .profile-track-item', function(e){
        playMaterialAnimate(this, e);
    });

    playMaterialAnimate = function(button, e)
    {
        var parent, ink, d, x, y;
        parent = $(button);
        console.log(parent);
        if(parent.find(".ink").length == 0)
            parent.prepend("<span class='ink'></span>");

        ink = parent.find(".ink");
        ink.removeClass("animate");

        if(!ink.height() && !ink.width())
        {
            d = Math.max(parent.outerWidth(), parent.outerHeight());
            ink.css({height: d, width: d});
        }

        x = e.pageX - parent.offset().left - ink.width()/2;
        y = e.pageY - parent.offset().top - ink.height()/2;

        ink.css({top: y+'px', left: x+'px'}).addClass("animate");
    };

    $('#main-content').on('click', '#editAlbumModal input[name=track-check]', function () {
        showRemoveButton('editAlbumModal');
    });
    $('#main-content').on('click', '#editPlaylistModal input[name=track-check]', function () {
        showRemoveButton('editPlaylistModal');
    });
    $('#main-content').on('click', '#addAlbumModal input[name=track-check]', function () {
        showRemoveButton('addAlbumModal');
    });

    showRemoveButton = function (parentBlock) {
        var countCheckedTrack = $('#' + parentBlock + ' input[name=track-check]:checked').length;
        if(countCheckedTrack > 0 )
        {
            $('#' + parentBlock + ' .remove-selected-track-btn').remove();
            var removeBtn = "<button type='button' class='remove-selected-track-btn'>Remove selected</button>";
            $('#' + parentBlock + ' .modal-footer').prepend(removeBtn);
        }
        else
        {
            $('#' + parentBlock + ' .remove-selected-track-btn').fadeOut(200, function () {
                $('#' + parentBlock + ' .remove-selected-track-btn').remove();
            });
        }
    };

    $('#main-content').on('hidden.bs.modal', '#user-track-list', function () {
        cancelChecked('user-track-list');
    });
    $('#main-content').on('hidden.bs.modal', '#editAlbumModal', function () {
        cancelChecked('editAlbumModal');
    });
    $('#main-content').on('hidden.bs.modal', '#editPlaylistModal', function () {
        cancelChecked('editPlaylistModal');
    });
    $('#main-content').on('hidden.bs.modal', '#addAlbumModal', function () {
        cancelChecked('addAlbumModal');
    });

    cancelChecked = function (parentElement) {
        $.each($('#' + parentElement + ' input[name=track-check]'), function (index, value) {
            value.checked = false;
        });
        $('#' + parentElement + ' .modal-footer .remove-selected-track-btn').remove();
        if(parentElement == "addAlbumModal")
        {
            $('#' + parentElement + ' .track-items').empty();
            $('#' + parentElement + ' input[class=form-control]').val("");
            $('#' + parentElement + ' .album_img_label img').attr('src', "/resources/assets/images/album_images/album-nophoto.png");
        }
    };

    var blockForAddTrack;
    var helpName;
    $('#main-content').on('show.bs.modal', '#addAlbumModal', function () {
        blockForAddTrack = "#addAlbumModal";
        helpName = "";
    });
    $('#main-content').on('show.bs.modal', '#editAlbumModal', function () {
        blockForAddTrack = "#editAlbumModal";
    });
    $('#main-content').on('show.bs.modal', '#editPlaylistModal', function () {
        blockForAddTrack = "#editPlaylistModal";
    });

    $('#main-content').on('click', '#user-track-list .add-track-btn', function () {
        $.each($('#user-track-list input[name=track-check]'), function (index, value) {
            if(value.checked == true)
            {
                var nameInputBlock = $(value).attr('id');
                var newNameInputBLock = blockForAddTrack + helpName + '_' + nameInputBlock;
                $(value).attr('id', newNameInputBLock);
                $(value).parent().children('.track-item').attr('for', newNameInputBLock);
                var addedTrackBlock = "<div class='track-item-check-btn'>"+ $(value).parent().html() + "</div>"
                $(blockForAddTrack + ' .track-items').prepend(addedTrackBlock);
                $(value).attr('id', nameInputBlock);
                $(value).parent().children('.track-item').attr('for', nameInputBlock);
            }
        });
        $('#user-track-list').modal('hide');
    });

    $('#main-content').on('click', '#addAlbumModal .remove-selected-track-btn', function () {
        removeSelectedTrack("#addAlbumModal");
    });
    $('#main-content').on('click', '#editAlbumModal .remove-selected-track-btn', function () {
        removeSelectedTrack('#editAlbumModal');
    });
    $('#main-content').on('click', '#editPlaylistModal .remove-selected-track-btn', function () {
        removeSelectedTrack('#editPlaylistModal');
    });

    removeSelectedTrack = function (parentElement) {
        $.each($(parentElement + ' input[name=track-check]'), function (index, value) {
            if(value.checked == true)
            {
                $(value).parent().fadeOut(200, function () {
                    $(value).parent().remove();
                });
            }
        });
        $(parentElement + ' .remove-selected-track-btn').fadeOut(200, function () {
            $(parentElement + ' .remove-selected-track-btn').remove();
        });
    };

    var albumPhoto = null;
    $('#main-content').on('change', '#upload_album_img', function () {
        var input = $(this)[0];
        if (input.file || input.files[0])
        {
            if (input.files[0].type.match('image.*'))
            {
                albumPhoto = input.files[0];
                var reader = new FileReader();
                reader.onload = function(e)
                {
                    $('.album_img_label img').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
            else
            {
                console.log('error, it isn\'t image');
            }
        }
        else
        {
            console.log('error');
        }
    });

    $('#main-content').on('click', '#addAlbumModal .btn-primary', function () {
        var albumPhotoFile = (albumPhoto != null) ? albumPhoto : "album-nophoto.png";
        var albumName = ($('#addAlbumModal input[name=album-name]').val() != "") ? $('#addAlbumModal input[name=album-name]').val() : "Unknown album";
        var artistName = ($('#addAlbumModal input[name=album-artist]').val() != "") ? $('#addAlbumModal input[name=album-artist]').val() : "Unknown artist";
        var albumYear = ($('#addAlbumModal input[name=album-year]').val() != "") ? $('#addAlbumModal input[name=album-year]').val() : "2016";
        var token = $('#addAlbumModal input[name="_token"]').val();
        var tracks = $('#addAlbumModal input[name=track-check]');
        var regExp = /\s/;
        var tracksList = new Array();
        $.each(tracks, function (index, value) {
            var tagList = $(value).attr('id').split(regExp);
            tracksList.push(tagList[tagList.length - 1]);
            console.log(tagList[tagList.length - 1]);
        });

        var formData = new FormData();
        formData.append('_token', token);
        formData.append('album_name', albumName);
        formData.append('file', albumPhotoFile);
        formData.append('artist_name', artistName);
        formData.append('album_year', albumYear);
        formData.append('tracks_list', tracksList);
        formData.append('count_track', tracksList.length);

        $.ajax({
            dataType: 'text',
            cache: false,
            contentType: false,
            processData: false,
            url: '/profile/albums/add',
            type: 'POST',
            data: formData/*({
             _token: token,
             artist_name: artistName,
             album_name: albumName,
             album_year: albumYear,
             tracks_list: tracksList
             })*/,
            beforeSend: function()
            {
                console.log("Add is started");
                //$(thisBtn).removeClass();
                //$(thisBtn).addClass('fa fa-spinner fa-spin fa-3x fa-fw');
            },
            success: function(data)
            {
                /*console.log(data);
                 var status = JSON.parse(data)
                 console.log(status);*/

                console.log("album added");
                $('#addAlbumModal').modal('hide');
                albumPhoto= null;
            },
            error: function(data)
            {
                console.log(data.responseText);
            }
        });
    });

    $('#main-content').on('click', '.music-right-sidebar #album-edit-btn', function () {
        var albumId = $(this).attr('album_id');
        var token = $('input[name="_token"]').val();

        $.ajax({
            url: '/profile/albums/' + albumId + '/getAlbumById',
            type: 'POST',
            data: ({
                 _token: token
             }),
            beforeSend: function()
            {
                console.log("Load info is started");
                //$(thisBtn).removeClass();
                //$(thisBtn).addClass('fa fa-spinner fa-spin fa-3x fa-fw');
            },
            success: function(data)
            {
                //console.log(data);
                var albumInfo = JSON.parse(data)
                console.log(albumInfo);
                var album = albumInfo.album;
                var tracks = albumInfo.tracks;
                $('#editAlbumModal .album_img_label img').attr("src", "/resources/assets/images/album_images/" + album.album_photo);
                $('#editAlbumModal input[name=album-name]').val(album.album_name);
                $('#editAlbumModal input[name=album-artist]').val(album.artist_name);
                $('#editAlbumModal input[name=album-year]').val(album.album_year);
//#editAlbumModalTwo_modal_track 6
                var trackBlock = "";
                var items = "";
                $.each(tracks, function (index, value) {
                    trackBlock = "<div class='track-item-check-btn'>" +
                        "<input type='checkbox' name='track-check' id='#editAlbumModal" + album.album_name + "_modal_track " + value.track_id + "' class='hidden'>" +
                        "<label for='#editAlbumModal" + album.album_name + "_modal_track " + value.track_id + "' class='track-item'>" +
                        "<div class='track-img'>" +
                        "<img src='/resources/assets/images/music_images/" + value.track_photo + "' alt=''>" +
                        "</div>" +
                        "<div class='track-info-block'>" +
                        "<p class='artist-name'>" + value.artist_name + "</p>" +
                        "<p class='track-name'>" + value.track_name + "</p>" +
                        "</div>" +
                        "<div class='add-track-info'>" +
                        "<p class='track-time'>" + value.duration + "</p>" +
                        "</div>" +
                        "</label>" +
                        "</div>";
                    items += trackBlock;
                });
                $('#editAlbumModal .track-items').html(items);
                console.log("album added");
                //$('#addAlbumModal').modal('hide');

            },
            error: function(data)
            {
                console.log(data.responseText);
            }
        });
    });

    $('#main-content').on('click', '#editAlbumModal .btn-primary', function () {
        var albumId = $('.music-right-sidebar #album-edit-btn').attr('album_id');
        var regExp = /\//;
        var tokens = $('#editAlbumModal .album_img_label img').attr("src").split(regExp);
        var albumPhotoFile = (albumPhoto != null) ? albumPhoto : tokens[tokens.length - 1];
        var albumName = ($('#editAlbumModal input[name=album-name]').val() != "") ? $('#editAlbumModal input[name=album-name]').val() : "Unknown album";
        var artistName = ($('#editAlbumModal input[name=album-artist]').val() != "") ? $('#editAlbumModal input[name=album-artist]').val() : "Unknown artist";
        var albumYear = ($('#editAlbumModal input[name=album-year]').val() != "") ? $('#editAlbumModal input[name=album-year]').val() : "2016";
        var token = $('input[name="_token"]').val();
        var tracks = $('#editAlbumModal input[name=track-check]');
        regExp = /\s/;
        var tracksList = new Array();
        $.each(tracks, function (index, value) {
            var tagList = $(value).attr('id').split(regExp);
            tracksList.push(tagList[tagList.length - 1]);
            //console.log(tagList[tagList.length - 1]);
        });
        console.log(tracksList);
        var formData = new FormData();
        formData.append('_token', token);
        formData.append('album_name', albumName);
        formData.append('file', albumPhotoFile);
        formData.append('artist_name', artistName);
        formData.append('album_year', albumYear);
        formData.append('tracks_list', tracksList);
        formData.append('count_track', tracksList.length);

        $.ajax({
            dataType: 'text',
            cache: false,
            contentType: false,
            processData: false,
            url: '/profile/albums/' + albumId + '/edit',
            type: 'POST',
            data: formData,
            beforeSend: function()
            {
                console.log("Edit is started");
                //$(thisBtn).removeClass();
                //$(thisBtn).addClass('fa fa-spinner fa-spin fa-3x fa-fw');
            },
            success: function(data)
            {
                 console.log("album edit");
                 albumPhoto= null;
                 var album = JSON.parse(data);
                 $('.profile-album-items .profile-album-item[album_id=' + albumId + ']').empty();
                 var tempItem = '<img src="/resources/assets/images/album_images/' + album.album_photo + '" alt="">' +
                    '<div class="profile-album-info">' +
                    '<div class="in-profile-album-info">' +
                    '<p class="profile-album-artist">' + album.artist_name + '</p>' +
                    '<p class="profile-album-name">' + album.album_name + '</p>' +
                    '<p class="profile-album-year">' + album.album_year + '</p>' +
                    '</div>' +
                    '</div>';
                $('.profile-album-items .profile-album-item[album_id=' + albumId + ']').html(tempItem);
                $('#editAlbumModal').modal('hide');
                $('.music-right-sidebar').css({
                    'display' : 'none'
                });
            },
            error: function(data)
            {
                console.log(data.responseText);
            }
        });
    });
});