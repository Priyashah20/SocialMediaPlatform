<?php
use App\Models\Like;
use App\Models\Post;
use Illuminate\Http\Request;

class LikeController extends Controller
{
    public function likePost(Request $request, $postId) {


        // Validation rules
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'likeable_id' => 'required|exists:posts,id',
            'likeable_type' => 'required|in:posts!',
        ]);

        $userId = $request->user_id;
        $likeableId = $request->likeable_id;

        // Check if the user has already liked the post
        if (Like::where('user_id', $userId)->where('likeable_id', $likeableId)->exists()) {
            return response()->json(['error' => 'User has already liked this post'], 422);
        }

        // Check if the user is trying to like their own post
        $post = Post::findOrFail($likeableId);

        if ($post->user_id == $userId) {
            return response()->json(['error' => 'Users cannot like their own posts'], 422);
        }

        // If validation passes, create the like
        $like = Like::create([
            'user_id' => $userId,
            'likeable_id' => $likeableId,
            'likeable_type' => $request->likeable_type,
        ]);

        return response()->json(['message' => 'Post liked successfully']);
    }
}


