<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Post;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        // Define the number of posts you want to create
        $numberOfPosts = 10;

        // Create dummy posts
        \App\Models\User::factory($numberOfPosts)->create()->each(function ($user) {
            Post::factory()->create(['user_id' => $user->id]);
        });
    }
    
}
