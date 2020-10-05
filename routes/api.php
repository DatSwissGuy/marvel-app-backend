<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/v1/user', 'API\UserController@currentUser');
Route::middleware('auth:api')->post('/v1/logout', 'API\UserController@logout');

Route::middleware('auth:api')->post('v1/ratings', 'API\RatingController@store');
Route::middleware('auth:api')->delete('v1/ratings/{id}', 'API\RatingController@destroy');
Route::middleware('auth:api')->get('v1/ratings/character/{character_id}', 'API\RatingController@showUserRatings');
Route::get('v1/ratings/character/{character_id}/average', 'API\RatingController@showAverageCharacterRating');
Route::middleware('auth:api')->put('v1/ratings/{id}', 'API\RatingController@update');

Route::get('v1/visits/character/{character_id}', 'API\VisitorCounterController@showCounterByCharacterId');

Route::middleware('auth:api')->get('v1/favorites', 'API\FavoriteController@showUserFavorites');
Route::middleware('auth:api')->post('v1/favorites', 'API\FavoriteController@store');
Route::middleware('auth:api')->delete('v1/favorites/{id}', 'API\FavoriteController@destroy');

Route::fallback(function () {
    return response()->json([
        'message' => 'Resource Not Found.'
    ], 404);
});

