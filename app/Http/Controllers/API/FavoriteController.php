<?php

namespace App\Http\Controllers\API;

use App\Favorite;
use App\Character;
use App\Http\Controllers\Controller;
use App\Http\Resources\FavoriteResource;
use App\Http\Resources\FavoriteCollection;
use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function showUserFavorites(Request $request) {
        $showAllFavorites = Favorite::where('user_id', $request->user()->id)->get();
        return new FavoriteCollection($showAllFavorites);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return FavoriteResource
     */
    public function store(Request $request) {
        return new FavoriteResource(
            Favorite::create([
                'user_id' => $request->user()->id,
                'marvel_character_id' => $request->input('character_id'),
                'character_name' => $request->input('character_name'),
                'image_url' => $request->input('image_url')
            ])
        );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Favorite $favorite
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id) {
        $deleteFavoriteById = Favorite::find($id);
        if ($deleteFavoriteById === null) {
            return response()->json(['message' => 'No Favorite found'], 404);
        }
        if ($deleteFavoriteById->user_id === $request->user()->id) {
            $deleteFavoriteById->delete();
            return response()->json(['message' => 'Favorite deleted'], 200);
        }
        return response()->json(['message' => 'You are not allowed to delete favorites from other users'], 403);
    }
}
