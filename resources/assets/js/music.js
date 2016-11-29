$(function(){
    var playlist = function()
    {
        var my_list = [];
        var curr;
        var _context = new AudioContext();
        var _audio = new Audio();
        var isPlaying = false;
        var currentPlaying = null;
        var source = null;
        var pausedAt = 0, startedAt = 0;

        var loadTrackInfo = function(track)
        {
            var info = null;
            if ((track.id > 0) && ((track.artist == '') || (track.track_name == '') || (track.duration == '')))
            {
                var token = $('input[name="token"]').val();
                $.ajax({
                    url: '/track/' + track.id + '/info',
                    type: 'POST',
                    async: false,
                    data: ({
                        _token: token,
                        track_id: track.id
                    }),
                    success: function(data){
                        result = JSON.parse(data);
                        if (result.success)
                        {
                            info = result.info;
                        }
                    },
                    error: function(e)
                    {
                        console.log(e.responseText);
                    }
                });
            }
            else
            {
                return track;
            }
            return info;
        };

        var loadTrack = function(object, track, _context)
        {
            if ((currentPlaying == track.id))
                return null;
            else
            {
                pausedAt = 0;
                startedAt = 0;
                if (isPlaying)
                    stopTrack();
                currentPlaying = track.id;
                _audio.src = '/resources/tracks/' + track.url;
                _audio.controls = true;
                _audio.autoplay = true;
                isPlaying = true;
                $(_audio).attr('id', 'audio-music');
                document.body.appendChild(_audio);
            }

            loadInfoToPlayer(track);
            var currTrack = document.getElementById('audio-music');
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

                $('.music-player-time-gone .progress-line').css({width : timesGonePercent + "%"});
                $('p.time-curr').html(minutes + ':' + seconds);
            };

            window.addEventListener('load', function(e){
                console.log(e);
                source = _context.createMediaElementSource(_audio);
                source.connect(_context.destination);
            });


            /*var request = new XMLHttpRequest();
            request.open('GET', '/resources/tracks/' + track.url, true);
            request.responseType = "arraybuffer";

            var i = 0;

            request.onprogress = function(e){
                // console.log(e.loaded / e.total * 100);
            };

            request.onload = function(){
                console.log(request.response);
                _context.decodeAudioData(request.response, function(buff){
                    object = buff;
                    playTrack(object, _context.currentTime > 0 ? _context.currentTime : null);
                }, function(error){
                    console.error('decodeAudioDataError', error);
                });
                //processConcatenatedFile(request.response);
            };
            request.send();*/

            return currentPlaying;
        };

        var loadInfoToPlayer = function(track)
        {
            var playerImage = $('.player-image img');
            var playerMusicTitle = $('p.music-title');
            var playerMusicArtist = $('p.music-artist');
            var playerMusicAll = $('p.time-all');

            playerImage.attr('src', '/resources/assets/images/music_images/' + track.photo);
            playerMusicTitle.html(track.track_name);
            playerMusicArtist.html(track.artist);
            playerMusicAll.html(track.duration);
        };

        var playTrack = function(buff)
        {
            var offset = pausedAt;

            source = _context.createBufferSource();
            source.buffer = buff;
            source.connect(_context.destination);
            source.start(0, offset);

            startedAt = _context.currentTime - offset;
            pausedAt = 0;
            isPlaying = true;
        };

        var stopTrack = function()
        {
            /*var elapsed = _context.currentTime - startedAt;
            source.stop(0);
            pausedAt = elapsed;
            startedAt = 0;
            isPlaying = false;
            currentPlaying = null;*/
            var currTrack = document.getElementById('audio-music');
            if (isPlaying)
            {
                pausedAt = currTrack.currentTime;
                console.log(pausedAt);
                isPlaying = false;
                currTrack.pause();
            }
            else
            {
                console.log(pausedAt);
                if (pausedAt > 0){
                    currTrack.currentTime = pausedAt;
                    isPlaying = true;
                    currTrack.play();
                }
            }
        };

        var obj =
        {
            list: my_list,
            current: curr,
            context: _context,

            add: function(track)
            {
                console.log('Added track with id ' + track.id);
                info = loadTrackInfo(track);
                if (info != null)
                {
                    track.artist = info.artist_name;
                    track.track_name = info.track_name;
                    track.duration = info.duration;
                    track.url = info.track_download_name;
                    track.photo = info.track_photo;
                }
                obj.list.push(track);

                if (obj.list.length == 1)
                    obj.current = obj.list[0];
            },
            remove: function(index)
            {
                console.log('Removed track with index ' + index);
                obj.list.splice(index, 1);
            },
            clear: function()
            {
                console.log('Playlist was cleared');
                obj.list = [];
            },
            get: function(track_id)
            {
                obj.list.indexOf(obj.list.track.id, 1)
            },
            play: function()
            {
                console.log('Playlist started');
                var myBuffer = null;
                if (loadTrack(myBuffer, obj.current, obj.context) == null)
                    obj.pause();
            },
            pause: function()
            {
                console.log('Playlist paused');
                stopTrack();
            },
            next: function()
            {
                console.log('Playlist next track');
            },
            prev: function()
            {
                console.log('Playlist prev track');
            }
        };

        return obj;
    };

    var myPlaylist = new playlist;

    $('body').on('click', '.track-item', function(e){
        var target = $(e.target);
        if (!target.is('b'))
        {
            var trackId = $(this).attr('track-id');
            myPlaylist.clear();
            myPlaylist.add({id : trackId, artist: "", track_name: "", duration: "", url: "", photo: ""});
            myPlaylist.play();
        }
    });
});