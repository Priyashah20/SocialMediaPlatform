<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\api\AuthenticatedSessionController;
use App\Http\Controllers\api\CommentController;
use App\Http\Controllers\api\PostController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('login', [AuthenticatedSessionController::class, 'loginUser'])->name('login');
Route::post('logout', [AuthenticatedSessionController::class, 'logoutUser'])
                ->name('logout');




// Create a new post

Route::post('/posts/store',[PostController::class,'store'])->name('store');

// Fetch all posts along with likes

Route::get('/posts',[PostController::class,'index'])->name('index');

// Create a new comment on a post

Route::post('/posts/{post}/comments/store',[CommentController::class,'store'])->name('posts.store');


// Fetch all comments for a post along with likes
Route::post('/posts/{post}/comments',[CommentController::class,'index'])->name('posts.index');


// Like or unlike a post

Route::post('/posts/{post}/like',[PostController::class,'like'])->name('posts.like');
Route::post('/posts/{post}/unlike',[PostController::class,'unlike'])->name('posts.unlike');


// Like or unlike a comment

Route::post('/comments/{comment}/like',[CommentController::class,'like'])->name('comments.like');
Route::post('/comments/{comment}/unlike',[CommentController::class,'unlike'])->name('comments.unlike');


Route::post('/like',[LikeController::class,'likepost'])->name('likepost');
