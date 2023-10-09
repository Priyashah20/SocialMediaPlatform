<?php

namespace Tests\Feature;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;
use App\Models\Post;

class LikeControllerTest extends TestCase
{
    use RefreshDatabase;

    public function testUserCanLikePost()
    {
        // Create a user and a post
        $user = User::factory()->create();
        $post = Post::factory()->create(['user_id' => $user->id]);

        // Send a request to like the post
        $response = $this->postJson("/api/posts/{$post->id}/like", ['user_id' => $user->id]);

        // Assert the response
        $response->assertStatus(200)->assertJson(['message' => 'Post liked successfully']);

    }

    public function testUserCannotLikeOwnPost()
    {
        // Create a user and a post
        $user = User::factory()->create();
        $post = Post::factory()->create(['user_id' => $user->id]);

        // Send a request to like the post with the same user
        $response = $this->postJson("/api/posts/{$post->id}/like", ['user_id' => $user->id]);

        // Assert the response
        $response->assertStatus(422)->assertJson(['error' => 'Users cannot like their own posts']);
    }

    public function testUserCannotLikePostTwice()
    {
        // Create a user and a post
        $user = User::factory()->create();
        $post = Post::factory()->create();

        // Send a request to like the post twice with the same user
        $this->postJson("/api/posts/{$post->id}/like", ['user_id' => $user->id]);
        $response = $this->postJson("/api/posts/{$post->id}/like", ['user_id' => $user->id]);

        // Assert the response
        $response->assertStatus(422)->assertJson(['error' => 'User has already liked this post']);
    }
}
