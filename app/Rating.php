<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rating extends Model {
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'character_id',
        'rating'
    ];

    /**
     * Relationships
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function users() {
        return $this->belongsTo('App\User');
    }
}
