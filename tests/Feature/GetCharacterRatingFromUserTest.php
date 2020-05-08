<?php

namespace Tests\Feature;

use Tests\TestCase;

class GetCharacterRatingFromUserTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function testForUnauthorized()
    {
        $response = $this->getJson('api/v1/ratings/character/123456');

        $this->assertEquals('401', $response->getStatusCode());
    }
}
