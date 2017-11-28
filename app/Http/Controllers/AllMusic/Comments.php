<?php namespace App\Http\Controllers\AllMusic;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Models\Comment;
use App\Models\CommentsInCommunity;
use Illuminate\Http\Request;

class Comments extends Controller 
{
    public function Create()
    {
        $commentText = \Input::get('comment_text');
        $communityId = \Input::get('community_id');

        if (!\Auth::check())
        {
            echo json_encode(['status' => false]);
            die();
        }

        $userId = \Auth::getUser()->user_id;

        $comment = new Comment();
        $comment->comment_text = $commentText;
        $comment->created_at_user = $userId;
        $comment->save();

        if ($comment->comment_id > 0)
        {
            $commentInCommunity = new CommentsInCommunity();
            $commentInCommunity->comment_id = $comment->comment_id;
            $commentInCommunity->community_id = $communityId;
            $commentInCommunity->save();

            echo json_encode(['status' => true]);
        }
        else
        {
            echo json_encode(['status' => false]);
        }
    }
}
