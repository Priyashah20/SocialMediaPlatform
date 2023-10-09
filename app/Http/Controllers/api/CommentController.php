<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Comment;
use App\Models\Like;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class CommentController extends Controller
{

    public function store(Post $post, Request $request)
    {
        $this->validate($request, [
            'content' => 'required|string|max:255',
        ]);
        $comment = new Comment();

        $comment->content = $request->input('content');
        $comment->post_id = $post->id;
        $comment->user_id = $request->input('user_id');
        $comment->save();

        return response()->json(['message' => 'Comment created successfully'], 201);
    }

    public function index(Post $post)
    {
        $comments = Comment::with('user', 'likes')->where('post_id', $post->id)->get();
        $comments->each(function ($comment) {
            $comment->total_likes = $comment->likes->count();
        });
        return response()->json($comments);
    }

    public function like(Comment $comment,Request $request)
    {
        // dd('asdasdasdsa');

        $user         = $request->user_id;
        $likeableId   = $request->likeable_id;
        $likeableType = $request->likeable_type;


        if ($comment->likes()->where('user_id', $user)->exists()) {
            return response()->json(['message' => 'You have already liked this comment'], 400);
        }

        $like                = new Like();
        $like->user_id       = $user;
        $like->likeable_id   = $likeableId;
        $like->likeable_type = $likeableType;

        $comment->likes()->save($like);

        return response()->json(['message' => 'Comment liked'], 200);
    }
    public function unlike(Request $request, Comment $comment)
    {
        $user         = $request->user_id;
        $likeableId   = $request->likeable_id;
        $likeableType = $request->likeable_type;

        $like = Like::where([
            ['user_id', $user],
            ['likeable_id', $likeableId],
            ['likeable_type', $likeableType],
        ])->first();

        if (!$like) {
            return response()->json(['message' => 'You have not liked this comment'], 400);
        }
        $like->delete();
        return response()->json(['message' => 'Post unliked'], 200);
    }
}
