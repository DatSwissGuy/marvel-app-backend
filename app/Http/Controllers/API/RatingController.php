<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\AverageRatingResource;
use App\Http\Resources\RatingResource;
use App\Rating;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RatingController extends Controller
{
    /**
     * Store a rating in storage.
     *
     * @param Request $request
     * @return RatingResource
     */
    public function store(Request $request) {
        return new RatingResource(
            Rating::create([
                'user_id' => $request->user()->id,
                'character_id' => $request->input('character_id'),
                'rating' => $request->input('rating')
            ])
        );
    }

    /**
     * Display the average rating.
     *
     * @param int $character_id
     * @return AverageRatingResource
     */
    public function showAverageCharacterRating($character_id) {
        $showAverageRatingByCharacterId = DB::table('ratings')
            ->where('character_id', $character_id)
            ->pluck('rating')
            ->average();
        return new AverageRatingResource((object)['average' => $showAverageRatingByCharacterId]);
    }

    /**
     * Display the users rating for a character.
     *
     * @param Request $request
     * @param $character_id
     * @return RatingResource|JsonResponse
     */
    public function showUserRatings(Request $request, $character_id) {
        $showUserRating = Rating::where('user_id', $request->user()->id)
            ->where('character_id', $character_id)
            ->first();
        if ($showUserRating === null) {
            return response()->json([
                'message' => 'No user rating found!'
            ], 204);
        }
        return new RatingResource($showUserRating);
    }

    /**
     * Update the rating.
     *
     * @param Request $request
     * @param int $id
     * @return RatingResource|JsonResponse
     *
     */
    public function update(Request $request, $id) {
        $updateRatingById = Rating::findOrFail($id);
        if ($updateRatingById->user_id === $request->user()->id) {
            $updateRatingById
                ->update([
                    'rating' => $request->input('rating')
                ]);
            return new RatingResource($updateRatingById);
        }
        return response()->json(['message' => 'You are not allowed to change ratings from other users'], 403);
    }

    /**
     * Remove the rating from storage.
     *
     * @param int $id
     * @return JsonResponse
     */
    public function destroy(Request $request, $id) {
        $deleteRatingById = Rating::find($id);
        if ($deleteRatingById->user_id === $request->user()->id) {
            $deleteRatingById->delete();
            return response()->json(['message' => 'Rating deleted'], 200);
        }
        return response()->json(['message' => 'You are not allowed to delete ratings from other users'], 403);
    }

}
