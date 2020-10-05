<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class GetAverageRatingTest extends TestCase {
    use RefreshDatabase;

    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function testStatusCode() {

        $response = $this->getJson('api/v1/ratings/character/123456/average');

        $this->assertEquals('200', $response->getStatusCode());

    }
}
