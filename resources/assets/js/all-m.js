$(function(){
    var isOpen = false;
    $('.album-item').click(function(){
        if (!isOpen)
        {
            $('.music-right-sidebar').css({
                'right' : 0
            });
            $('.in-music-container').css({
                'width': $(document).width() - $('.music-right-sidebar').width()
            });
            isOpen = true;
        }
    });
    $('.close-sidebar').click(function(){
        if (isOpen)
        {
            $('.music-right-sidebar').css({
                'right' : -9999
            });
            $('.in-music-container').css({
                'width': 100 + '%'
            });
            isOpen = false;
        }
    });
});