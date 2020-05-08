<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Favorite extends Model {
    protected $fillable = [
        'user_id',
        'character_id',
        'character_name',
        'image_url'
    ];
}
