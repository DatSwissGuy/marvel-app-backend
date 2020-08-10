<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VisitorCounter extends Model
{

    protected bool $alreadyVisited = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'character_id',
        'visits'
    ];

    public function getAlreadyVisitedAttribute() {
        return $this->alreadyVisited;
    }

    public function setAlreadyVisitedAttribute($alreadyVisited) {
        return $this->alreadyVisited = $alreadyVisited;
    }

}
