<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\CommentsInCommunity;
use App\Models\Community;
use App\Models\Genres;
use App\Models\Playlists;
use App\Models\PlaylistsInCommunities;
use App\Models\UsersInCommunity;
use Illuminate\Http\Request;
use Illuminate\Routing\Route;

class Communities extends Controller 
{
    public function Index(Request $request)
    {
        $data = [
            'title' => 'Communities',
            'styles' => [
                'allmusic.css',
                'tracks.css',
                'community.css'
            ]
        ];

        if ($request->ajax())
            return view('pages.allmusic.communities.communities');
        else
            return view('pages.allmusic.communities.communities-section', $data);
    }

    public function GetCommunity(Request $request)
    {
        $communityId = \Route::input('community_id');
        $userId = \Auth::check() ? \Auth::getUser()->user_id : 0;

        $communityInfo = Community::select(\DB::raw("*, (SELECT EXISTS (SELECT * FROM `users_in_communities` uinc WHERE uinc.community_id = {$communityId} AND uinc.user_id = {$userId})) as userExist"))
            ->where('community_id', '=', $communityId)
            ->first();
        $communityComments = CommentsInCommunity::select(\DB::raw("*, comments.created_at as comment_created_at"))
            ->leftJoin('comments', 'comments.comment_id', '=', 'comments_in_communities.comment_id')
            ->leftJoin('users', 'users.user_id', '=', 'comments.created_at_user')
            ->where('comments_in_communities.community_id', '=', $communityId)
            ->orderBy('comments_in_communities.comment_id', 'DESC')
            ->get();

        $playlist = PlaylistsInCommunities::where('playlists_in_communities.community_id', '=', $communityId)
            ->leftJoin('playlists', 'playlists.playlist_id', '=', 'playlists_in_communities.playlist_id')
            ->first();

        $data = [
            'communityName' => 'Community name',
            'title' => 'In community',
            'styles' => [
                'allmusic.css',
                'tracks.css',
                'community.css',
                'profile.css'
            ],
            'community_info' => $communityInfo,
            'comments' => $communityComments,
            'playlist' => $playlist
        ];

        if ($request->ajax())
            return view('pages.allmusic.communities.in-community', $data);
        else
            return view('pages.allmusic.communities.in-community-section', $data);
    }

    public static function GetUserCommunity()
    {
        $userId = \Auth::getUser()->user_id;
        $communities = Community::select(\DB::raw('*, (SELECT COUNT(*) FROM users_in_communities WHERE users_in_communities.community_id = communities.community_id) as members_count'))
            ->leftJoin('users_in_communities', 'users_in_communities.community_id', '=', 'communities.community_id')
            ->where('users_in_communities.user_id', '=', $userId)
            ->get();
        return $communities;

    }

    public static function GetAll()
    {
        $communities = Community::
            select(\DB::raw('*, (SELECT COUNT(*) FROM users_in_communities WHERE users_in_communities.community_id = communities.community_id) as members_count'))
            ->get();
        
        return $communities;
    }
    
    public function Create()
    {
        $userId = \Auth::getUser()->user_id;
        $communityName = \Input::get('community_name');
        $communityGenre = \Input::get('community_genre');

        $community = new Community();

        if (isset($_FILES['community_image']))
        {
            $uploadDir = $_SERVER["DOCUMENT_ROOT"] . '/resources/assets/images/communities_images/';
            $uploadFile = $uploadDir . basename($_FILES['community_image']['name']);

            if (move_uploaded_file($_FILES['community_image']['tmp_name'], $uploadFile))
                $community->community_photo = $_FILES['community_image']['name'];
            else
                $community->community_photo = 'community_nophoto.jpg';
        }
        else
            $community->community_photo = 'community_nophoto.jpg';

        $community->community_name = $communityName;
        $community->genre_id = GenresController::Create($communityGenre);
        $community->created_at_user = $userId;
        $community->save();

        if ($community->community_id > 0)
        {
            $this->CreateCommunityPlaylist($community);
            $this->AssociateWithUser($community->community_id, $userId);
            echo json_encode(['status' => true]);
        }
        else
            echo json_encode(['status' => false]);
    }

    public function AssociateWithUser($communityId, $userId)
    {
        $usersInCommunity = UsersInCommunity::where('community_id', '=', $communityId)
            ->where('user_id', '=', $userId)
            ->first();

        if(!is_null($usersInCommunity)) {
            return $usersInCommunity->user_in_community_id;
        }

        $usersInCommunity = new UsersInCommunity();
        $usersInCommunity->community_id = $communityId;
        $usersInCommunity->user_id = $userId;
        $usersInCommunity->save();

        return $usersInCommunity->user_in_community_id;
    }

    public function Join()
    {
        $userId = \Auth::getUser()->user_id;
        $communityId = \Input::get('community_id');

        $userInCommunity = new UsersInCommunity();
        $userInCommunity->user_id = $userId;
        $userInCommunity->community_id = $communityId;

        if ($userInCommunity->save())
            echo json_encode(['status' => true]);
        else
            echo json_encode(['status' => false, 'text' => 'User is already in this community']);
    }

    public function Leave()
    {
        $userId = \Auth::getUser()->user_id;
        $communityId = \Input::get('community_id');

        if (UsersInCommunity::where('user_id', '=', $userId)->where('community_id', '=', $communityId)->delete())
            echo json_encode(['status' => true]);
        else
            echo json_encode(['status' => false, 'text' => 'User is already leave from this community']);
    }

    public function CreateCommunityPlaylist($community)
    {
        $playlistInCommunity = null;

        $playlist = new Playlists();
        $playlist->playlist_name = $community->community_name;
        $playlist->created_at_user = \Auth::getUser()->user_id;
        $playlist->playlist_photo = $community->community_photo;
        $playlist->save();

        if ($playlist->playlist_id > 0)
        {
            \App\Http\Controllers\AllMusic\Playlists::AssociateWithUsers(\Auth::getUser()->user_id, $playlist->playlist_id);
            $playlistInCommunity = new PlaylistsInCommunities();
            $playlistInCommunity->playlist_id = $playlist->playlist_id;
            $playlistInCommunity->community_id = $community->community_id;
            $playlistInCommunity->save();
        }

        return $playlistInCommunity;
    }
}
