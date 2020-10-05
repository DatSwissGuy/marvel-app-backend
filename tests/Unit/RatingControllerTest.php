<?php

namespace Tests\Unit;

use App\Rating;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Http\Controllers\API\RatingController;

class RatingControllerTest extends TestCase {
    use RefreshDatabase;

    /**
     * A basic unit test example.
     *
     * @return void
     */
    public function testAverage() {
        $count = 100;
        $sum = 0;

        for ($i = 0; $i < $count; $i++) {
            factory(User::class)->create([
                'id' => $i + 1,
            ]);
            $rating = factory(Rating::class)->create([
                'user_id' => $i + 1,
                'character_id' => 1,
            ]);
            $sum += $rating->rating;
        }

        $ratingController = new RatingController();

        $averageRating = $ratingController->showAverageCharacterRating(1);

        $this->assertEquals($sum / $count, $averageRating->average);
    }
}
