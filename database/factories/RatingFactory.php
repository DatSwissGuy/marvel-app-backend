<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Rating;
use Faker\Generator as Faker;

$factory->define(Rating::class, function (Faker $faker) {
    return [
        'user_id' => $faker->randomDigitNotNull,
        'character_id' => random_int(1, 2),
        'rating' => random_int(1, 5),
        'created_at' => $faker->dateTimeThisMonth,
        'updated_at' => $faker->dateTimeThisMonth
    ];
});
