<input type="hidden" name="token" value="{{ csrf_token() }}">

<div class="container-fluid all-music-container">
    <div class="music-filters-block">
        <div class="container-fluid music-filters">
            <p class="title">Filters</p>
            <form action="" method="get" class="search_filter">
                <p class="title">Genres</p>
                <div class="form-group check-btn">
                    <input type="checkbox" name="salary" id="genre_0" value="10" class="hidden">
                    <label for="genre_0">Rock</label>
                </div>
                <div class="form-group check-btn">
                    <input type="checkbox" name="salary" id="genre_1" value="10" class="hidden">
                    <label for="genre_1">Jazz</label>
                </div>
                <div class="form-group check-btn">
                    <input type="checkbox" name="salary" id="genre_2" value="10" class="hidden">
                    <label for="genre_2">Blues</label>
                </div>
                <div class="form-group check-btn">
                    <input type="checkbox" name="salary" id="genre_3" value="10" class="hidden">
                    <label for="genre_3">Pop</label>
                </div>
                <div class="form-group check-btn">
                    <input type="checkbox" name="salary" id="genre_4" value="10" class="hidden">
                    <label for="genre_4">Rap</label>
                </div>
                <div class="form-group check-btn">
                    <input type="checkbox" name="salary" id="genre_5" value="10" class="hidden">
                    <label for="genre_5">Hip-Hop</label>
                </div>
                <div class="form-group check-btn">
                    <input type="checkbox" name="salary" id="genre_6" value="10" class="hidden">
                    <label for="genre_6">Other</label>
                </div>
                <div class="form-group">
                    <input type="text" name="search_community_name" class="form-control" placeholder="Community name" maxlength="50" pattern="[A-Za-zА-Яа-я\d]{1,50}" value="">
                </div>
                <button class="btn btn-search">Search</button>
                <a onclick="toPage('/communities')"><button type="button" class="btn btn-danger">Reset filter</button></a>
            </form>
        </div>
    </div>
    <div class="right-music-block">
        <div class="music-settings">
            <p class="title">Communities</p>
            <ul class="list-inline music-choice">
                <li class="list-inline-item active">
                    @if (Auth::check())
                        <label class="add-new-community" data-toggle="modal" data-target="#createCommunityModal"><b class="fa fa-plus-square"></b> Create new</label>
                    @else
                        <label class="add-new-community" onclick="toPage('/signin', true)"><b class="fa fa-plus-square"></b> Create new</label>
                    @endif
                </li>
            </ul>
        </div>
        <div class="container-fluid in-music-container">
            <div class="items">
                @include('pages.allmusic.communities.communities-blocks')
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="createCommunityModal" tabindex="-1" role="dialog" aria-labelledby="createCommunityLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <p class="text-xs-center community-modal-title">Create a new community</p>
                <div class="community-image">
                    <label for="community-image-upload">
                        <img src="/resources/assets/images/communities_images/community_nophoto.jpg" class="community-image-upload-js" alt="">
                        <div class="community-image-edit"><b class="fa fa-arrow-circle-down"></b></div>
                    </label>
                    <input type="file" name="community-image" id="community-image-upload" hidden>
                </div>
                <div class="community-info">
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control" name="community-name" placeholder="Community name">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="community-genre" placeholder="Community genre">
                        </div>
                        <div class="form-group">
                            <button class="btn btn-danger col-xs-6" id="cancel-community-create" data-dismiss="modal" type="button">Cancel</button>
                            <button class="btn btn-success col-xs-6 confirm-community-create" id="confirm-community-create" type="button">Create</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>