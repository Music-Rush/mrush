$(function(){
    $('body').on('change', 'input[name="community-image"]', function(){
        var input = $(this)[0];
        if (input.file || input.files[0])
        {
            if (input.files[0].type.match('image.*'))
            {
                var reader = new FileReader();
                reader.onload = function(e)
                {
                    $('.community-image-upload-js').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
            else
            {
                alert('Image upload error: it is not image');
            }
        }
    });

    $('body').on('click', '.confirm-community-create', function(){
        var token = $('input[name="token"]').val();
        var communityName = $('input[name="community-name"]').val();
        var communityGenre = $('input[name="community-genre"]').val();
        var communityImage = $('input[name="community-image"]').prop('files')[0];
        var thisBtn = this;

        var formData = new FormData();
        formData.append('community_name', communityName);
        formData.append('community_genre', communityGenre);
        if (communityImage != '')
            formData.append('community_image', communityImage);
        formData.append('_token', token);

        $.ajax({
            url: '/community/create',
            type: 'POST',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function(){
                $(thisBtn).html('<i class="fa fa-spinner fa-spin fa-1x fa-fw"></i>')
            },
            success: function(data){
                result = JSON.parse(data);
                console.log(result);
                if (result.status)
                {
                    $(thisBtn).html('<i class="fa fa-check"></i>');
                    $('#createCommunityModal').modal('hide');
                    setTimeout(function(){
                        toPage('/communities', true);
                    }, 500);
                }
                else
                {
                    $(thisBtn).html('Create');
                }
            },
            error: function(e)
            {
                console.log(e);
                $(thisBtn).html('Create');
            }
        });
    });

    var commentInSending = false;

    $('body').on('click', '.btn-comment-send', function(){

        if (commentInSending)
            return;

        var thisBtn = this;
        var token = $('input[name="token"]').val();
        var commentText = $('textarea[name="comment-text"]').val();
        if (commentText.length <= 0)
            commentText = "Я тормоз, отправляю пустые комменты";
        var communityId = $('input[name="community-id"]').val();
        var formData = new FormData();
        formData.append('_token', token);
        formData.append('comment_text', commentText);
        formData.append('community_id', communityId);

        $.ajax({
            url: '/comments/create',
            type: 'POST',
            data: formData,
            cache: false,
            processData: false,
            contentType: false,
            beforeSend: function(){
                $(thisBtn).html('<i class="fa fa-spinner fa-spin fa-1x fa-fw"></i>');
                commentInSending = true;
                $(thisBtn).prop('disabled', true);
            },
            success: function(data){
                result = JSON.parse(data);
                if (result.status)
                {
                    $(thisBtn).html('<i class="fa fa-check"></i>');
                    commentInSending = false;
                    $(thisBtn).prop('disabled', false);
                    $(thisBtn).removeClass('btn-comment-send');
                    setTimeout(function(){
                        toPage('/communities/' + communityId);
                    }, 500);
                }
                else
                {
                    commentInSending = false;
                    $(thisBtn).prop('disabled', false);
                    $(thisBtn).addClass('btn-comment-send');
                    $(thisBtn).html('SEND');
                }
            },
            error: function(e)
            {
                commentInSending = false;
                $(thisBtn).prop('disabled', false);
                $(thisBtn).addClass('btn-comment-send');
                $(thisBtn).html('SEND');
            }
        });
    });

    $('body').on('click', '.btn-community-join', function(){
        var token = $('input[name="token"]').val();
        var communityId = $('input[name="community-id"]').val();
        var thisBtn = this;
        var prevText = $(thisBtn).text();

        $.ajax({
            url: '/communities/' + communityId + '/join',
            type: 'POST',
            data: ({
                _token: token,
                community_id : communityId
            }),
            beforeSend: function(){
                $(thisBtn).html('<i class="fa fa-spinner fa-spin fa-1x fa-fw"></i>');
                $(thisBtn).removeClass('.btn-community-join');
            },
            success: function(data){
                result = JSON.parse(data);
                if (result.status)
                {
                    $(thisBtn).addClass('.btn-community-join');
                    $(thisBtn).html('<i class="fa fa-check"></i>');
                    setTimeout(function(){
                        toPage('/communities/' + communityId);
                    }, 500);
                }
                else
                {
                    $(thisBtn).addClass('.btn-community-join');
                    $(thisBtn).html(prevText);
                }
            },
            error: function(){
                $(thisBtn).addClass('.btn-community-join');
                $(thisBtn).html(prevText);
            }
        })
    });

    $('body').on('click', '.btn-community-leave', function(){
        var token = $('input[name="token"]').val();
        var communityId = $('input[name="community-id"]').val();
        var thisBtn = this;
        var prevText = $(thisBtn).text();

        $.ajax({
            url: '/communities/' + communityId + '/leave',
            type: 'POST',
            data: ({
                _token: token,
                community_id : communityId
            }),
            beforeSend: function(){
                $(thisBtn).html('<i class="fa fa-spinner fa-spin fa-1x fa-fw"></i>');
                $(thisBtn).removeClass('.btn-community-leave');
            },
            success: function(data){
                result = JSON.parse(data);
                if (result.status)
                {
                    $(thisBtn).addClass('.btn-community-leave');
                    $(thisBtn).html('<i class="fa fa-check"></i>');
                    setTimeout(function(){
                        toPage('/communities/' + communityId);
                    }, 500);
                }
                else
                {
                    $(thisBtn).addClass('.btn-community-leave');
                    $(thisBtn).html(prevText);
                }
            },
            error: function(){
                $(thisBtn).addClass('.btn-community-leave');
                $(thisBtn).html(prevText);
            }
        })
    });
});