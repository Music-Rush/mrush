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
});