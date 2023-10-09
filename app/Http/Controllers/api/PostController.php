<?php
namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Like;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


class PostController extends Controller
{
    public function store(Request $request)
    {
        $this->validate($request, [
            'content' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
        $post = new Post();
        $post->content = $request->input('content');
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('post_images', 'public');
            $post->image = $imagePath;
        }
        $post->user_id = $request->input('user_id');
        $post->save();
        return response()->json(['message' => 'Post created successfully'], 201);
    }

    public function index()
    {
        $posts = Post::with('user', 'likes')->get();
        $posts->each(function ($post) {
            $post->total_likes = $post->likes->count();
        });

        return response()->json($posts);
    }

    public function like(Post $post,Request $request)
    {

        $user = $request->user_id;
        $likeableId = $request->likeable_id;
        $likeableType = $request->likeable_type;
        if ($post->likes()->where('user_id', $user)->exists()) {
            return response()->json(['message' => 'You have already liked this post'], 400);
        }

        $like = new Like();
        $like->user_id = $user;
        $like->likeable_id = $likeableId;
        $like->likeable_type = $likeableType;
        $post->likes()->save($like);

        return response()->json(['message' => 'Post liked'], 200);
    }

    public function unlike(Request $request, Post $post)
    {
        $user = $request->user_id;
        $likeableId = $request->likeable_id;
        $likeableType = $request->likeable_type;

        $like = Like::where([
            ['user_id', $user],
            ['likeable_id', $likeableId],
            ['likeable_type', $likeableType],
        ])->first();

        if (!$like) {
            return response()->json(['message' => 'You have not liked this post'], 400);
        }
        $like->delete();
        return response()->json(['message' => 'Post unliked'], 200);
    }
}
