var SendRequest = function()
{
    var request = function(request_type, request_url, formData)
    {
        var responseData = null;
        $.ajax({
            type: request_type,
            url: request_url,
            data: formData,
            async: false,
            success: function(data){
                result = JSON.parse(data);
                if (result.success)
                {
                    responseData = result.info;
                }
                else
                {
                    //console.log('error');
                }
            },
            error: function(e){
                console.log(e.responseText);
            }
        });

        return responseData;
    };

    var obj =
    {
        post: function(url, formData)
        {
            return request('POST', url, formData);
        },
        get: function(url, formData)
        {
            return request('GET', url, formData);
        }
    };

    return obj;
};