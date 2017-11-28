var Playlist = function(){
    var _list = [];
    var _currentTrack = null;
    var _currentDiv = null;
    var _isPaused = false;
    var _pausedAt = 0;
    var _context = new AudioContext();
    var _audio = new Audio();

    var LoadInfo = function(tracks, columns){
        var sendRequest = new SendRequest;
        var track = null;
        $.each(tracks, function(key, item){
            if ($.inArray(parseInt(item.id), columns) != -1)
            {
                tracks.splice(key, 1);
            }
        });

        if (tracks.length == 0)
            return;

        var data = {"_token" : $('input[name="token"]').val(), "tracks" : JSON.stringify(tracks)};
        var trackInfo = sendRequest.post('/track/info', data);

        if (trackInfo !== null)
        {
            if($.isArray(trackInfo))
            {
                track = new Array(trackInfo.length);
                $.each(trackInfo, function (index, item) {
                    if ($.inArray(item.track_id, columns) != -1)
                        return;
                    track[index] = new Track;
                    track[index].id = item.track_id;
                    track[index].name = item.track_name;
                    track[index].artist = item.artist_name;
                    track[index].photo = item.track_photo;
                    track[index].url = item.track_download_name;
                    track[index].duration = item.duration;
                });
            }
        }

        return track;
    };

    var LoadInfoToPlayer = function(track)
    {
        var playerImage = $('.player-image img');
        var playerMusicTitle = $('p.music-title');
        var playerMusicArtist = $('p.music-artist');
        var playerMusicAll = $('p.time-all');

        playerImage.attr('src', '/resources/assets/images/music_images/' + track.photo);
        playerMusicTitle.html(track.name);
        playerMusicArtist.html(track.artist);
        playerMusicAll.html(track.duration);
    };

    var PlayerEvents = function()
    {
        var currTrack = document.getElementById('audio-music');
        var prevVolume = null;
        currTrack.onprogress = function(){
            if (currTrack.readyState === 4)
            {
                if ((typeof(this.buffered) != "undefined") && (this.buffered !== null)) {
                    var loadedPercent = this.buffered.end(0) / this.duration * 100 + '%';
                    $('.music-player-progress-muted .progress-line').css({width : loadedPercent});
                }
            }
        };
        currTrack.ontimeupdate = function(e){
            minutes = Math.floor(this.currentTime / 60);
            seconds = Math.floor(this.currentTime % 60);
            seconds = (seconds >= 10) ? seconds: "0" + seconds;

            timesGonePercent = this.currentTime / this.duration * 100;

            if (this.currentTime == this.duration)
            {
                if (_list.length > 1)
                    NextTrack();
                else
                    StopForce();
            }

            if ((prevVolume == null) || (prevVolume != this.volume))
            {
                prevVolume = this.volume;
                newVolume = prevVolume * 100;
                $('.music-player-volume-progress').css({
                    height : newVolume
                });
            }

            $('.music-player-time-gone .progress-line').css({width : timesGonePercent + "%"});
            $('p.time-curr').html(minutes + ':' + seconds);
        };
    };

    var StopTrack = function()
    {
        var currTrack = document.getElementById('audio-music');
        if (!_isPaused)
        {
            _pausedAt = currTrack.currentTime;
            _isPaused = true;
            currTrack.pause();

            $('.controller-play b').removeClass('fa-pause-circle-o');
            $('.controller-play b').addClass('fa-play-circle-o');
        }
        else
        {
            if (_pausedAt > 0){
                currTrack.currentTime = _pausedAt;
                _isPaused = false;
                currTrack.play();

                $('.controller-play b').removeClass('fa-play-circle-o');
                $('.controller-play b').addClass('fa-pause-circle-o');
            }
        }
    };

    var StopForce = function()
    {
        var currTrack = document.getElementById('audio-music');
        if (currTrack != null)
        {
            _pausedAt = currTrack.currentTime;
            _isPaused = true;
            currTrack.pause();

            $('.controller-play b').removeClass('fa-pause-circle-o');
            $('.controller-play b').addClass('fa-play-circle-o');
        }

    };

    var InitAudio = function(track)
    {
        _audio.src = '/resources/tracks/' + track.url;
        _audio.controls = true;
        _audio.autoplay = true;
        $(_audio).attr('id', 'audio-music');
        if (!$('#audio-music').length)
            document.body.appendChild(_audio);
        PlayerEvents();
    };

    var PlayTrack = function(track)
    {
        if (_currentTrack != track)
        {
            if ((track == undefined) || (track === null))
                track = _currentTrack;

            if ((_currentDiv == null))
            {
                _currentDiv = $('.track-item[track-id="' + track.id + '"], .profile-track-item[track-id="' + track.id + '"],' +
                    '.profile-track-item[two-track-id="' + track.id + '"]');
                _currentDiv.css({'background-color': 'rgba(255,255,255, .3)'});
            }
            else
            {
                if (_currentDiv.attr('track-id') != track.id)
                {
                    _currentDiv.css({'background-color': 'transparent'});
                    _currentDiv = $('.track-item[track-id="' + track.id + '"], .profile-track-item[track-id="' + track.id + '"],' +
                        '.profile-track-item[two-track-id="' + track.id + '"]');
                    _currentDiv.css({'background-color': 'rgba(255,255,255, .3)'});
                }
            }

            LoadInfoToPlayer(track);
            InitAudio(track);
            _currentTrack = track;


            _isPaused = false;
            _pausedAt = 0;
        }
        else
        {
            if (_isPaused)
            {
                _audio.currentTime = _pausedAt;
                _audio.play();
                _isPaused = false;
            }
            else
            {
                StopTrack();
                return;
            }
        }

        $('.controller-play b').removeClass('fa-play-circle-o');
        $('.controller-play b').addClass('fa-pause-circle-o');
    };

    var PlayIndex = function(index)
    {
        var track = _list[index];
        PlayTrack(track);
    };

    var NextTrack = function()
    {
        if (_list.length > 1)
        {
            $.each(_list, function(key, item){
                if (item.id == _currentTrack.id)
                {
                    var nextTrack = _list[key + 1];
                    if (nextTrack == undefined)
                        nextTrack = _list[0];

                    PlayTrack(nextTrack);
                    return false;
                }
            });
        }
    };

    var PrevTrack = function()
    {
        if (_list.length > 1)
        {
            $.each(_list, function(key, item){
                if (item.id == _currentTrack.id)
                {
                    var nextTrack = _list[key - 1];
                    if (nextTrack == undefined)
                        nextTrack = _list[_list.length -1];

                    PlayTrack(nextTrack);
                    return false;
                }
            });
        }
    };

    var Rewind = function(offset)
    {
        var currTrack = document.getElementById('audio-music');
        var newTime = currTrack.duration * offset;
        currTrack.currentTime = newTime;
    };

    var Volume = function(volume)
    {
        var currTrack = document.getElementById('audio-music');
        currTrack.volume = volume;
    };

    var Clear = function()
    {
        StopForce();
        _list = [];
        $('.music-list .track-items').empty();
    };

    var GetColumn = function(array, col)
    {
        var column = [];
        for (var i = 0; i < array.length; i++)
        {
            column.push(array[i][col]);
        }
        return column;
    };

    var obj = {
        list : _list,
        currentTrack : _currentTrack,
        isPaused : _isPaused,
        pausedAt : _pausedAt,
        context : _context,
        audio : _audio,

        add: function(tracks){
            var arrTracks = [];

            if ($.isArray(tracks))
            {
                $.each(tracks, function(key, item){
                    arrTracks.push({"id" : item});
                });
            }
            else
                arrTracks.push({"id":tracks});

            var columnsWithTracksId = GetColumn(_list, 'id');
            var responseTracks = LoadInfo(arrTracks, columnsWithTracksId);
            if(responseTracks != null)
            {
                $.each(responseTracks, function (index, responseTrack) {
                    if (responseTrack != undefined)
                    {
                        $('.music-list .track-items').append(generatePlaylistTrack(responseTrack));
                        _list.push(responseTrack);
                    }
                });
            }
        },
        play: function(track_id)
        {
            var track = null;
            $.each(_list, function(key, item){
                if (item.id == track_id)
                    track = item;
            });
            if (track != null)
            {
                if ((_currentTrack != null) && (_currentTrack.id == track_id))
                    StopTrack();
                else
                    PlayTrack(track);
            }
            else
                console.log('Track with id ' + track_id + ' not found in playlist');
        },
        playIndex: function(index)
        {
            PlayIndex(index);
        },
        pause: function(){
            StopTrack();
        },
        print: function(){
            console.log(_list);
        },
        next: function()
        {
            NextTrack();
        },
        prev: function()
        {
            PrevTrack();
        },
        rewind: function(offset)
        {
            Rewind(offset);
        },
        volume: function(volume)
        {
            Volume(volume);
        },
        clear: function()
        {
            Clear();
        }
    };

    return obj;
};

var Track = function(id, name, artist, url, photo){
    this.id = id;
    this.name = (name === null) || (name == '') ? '' : name;
    this.artist = (artist === null) || (artist == '') ? '' : artist;
    this.url = (url === null) || (url == '') ? '' : '/resources/tracks/' + url;
    this.photo = (photo === null) || (photo == '') ? '' : photo;
};

var playlist = new Playlist;

$(function(){
    $('body').on('click', '.track-item, .profile-track-item', function(e){
        var target = $(e.target);
        if (!target.is('b') && !target.is('a'))
        {
            var trackId = $(this).attr('track-id') || $(this).attr('two-track-id');
            playlist.add(trackId);
            playlist.play(trackId);
            playlist.print();
        }
    });

    $('body').on('click', '.controller-next', function(){
        playlist.next();
    });

    $('body').on('click', '.controller-prev', function(){
        playlist.prev();
    });

    $('body').on('click', '.controller-play', function(){
        playlist.pause();
    });

    $('body').on('click', '.player-progress', function(e){
        var offset = e.pageX / $(document).width();
        playlist.rewind(offset);
    });

    $('body').on('click', '.music-player-volume-gone', function(e){
        var volumeHeight = $(this).height();
        var volume = (volumeHeight - e.offsetY) / volumeHeight;
        console.log(volume);
        playlist.volume(volume);
    });
});