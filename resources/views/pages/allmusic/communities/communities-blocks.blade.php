{{--<div class="album-item" onclick="toPage('/communities/1', true)">--}}
    {{--<img src="/resources/assets/images/communities_images/community_nophoto.jpg" alt="">--}}
    {{--<div class="album-info">--}}
        {{--<div class="in-album-info">--}}
            {{--<p class="album-artist community-name">MR. ROBOT</p>--}}
            {{--<p class="community-members-count"><b class="fa fa-user"></b><span class="members-count">5</span></p>--}}
        {{--</div>--}}
    {{--</div>--}}
{{--</div>--}}
@foreach (\App\Http\Controllers\AllMusic\Communities::GetAll() as $key => $item)
    <div class="album-item" onclick="toPage('/communities/{{ $item->community_id }}', true)">
        <img src="/resources/assets/images/communities_images/{{ $item->community_photo }}" alt="">
        <div class="album-info">
            <div class="in-album-info">
                <p class="album-artist community-name">{{ $item->community_name }}</p>
                <p class="community-members-count"><b class="fa fa-user"></b><span class="members-count">{{ $item->members_count }}</span></p>
            </div>
        </div>
    </div>
@endforeach