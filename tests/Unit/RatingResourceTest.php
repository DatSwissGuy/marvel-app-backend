<?php

namespace Tests\Unit;

use App\Http\Resources\RatingResource;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Rating;

class RatingResourceTest extends TestCase
{
    use RefreshDatabase;
    /**
     * Test correct keys of ratings.
     *
     * @return void
     */
    public function testRatingResource()
    {
        $rating = factory(Rating::class)->make();

        $ratingResource = new RatingResource($rating);

        $ratingResourceOutput = $ratingResource->toArray(null);

        $this->assertTrue(is_array($ratingResourceOutput));
        $this->assertTrue(array_key_exists('id', $ratingResourceOutput));
        $this->assertTrue(array_key_exists('character_id', $ratingResourceOutput));
        $this->assertTrue(array_key_exists('rating', $ratingResourceOutput));

        $this->assertFalse(array_key_exists('user_id', $ratingResourceOutput));
        $this->assertFalse(array_key_exists('created_at', $ratingResourceOutput));
        $this->assertFalse(array_key_exists('updated_at', $ratingResourceOutput));
    }
}
