<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\VisitorCounterResource;
use App\VisitorCounter;

class VisitorCounterController extends Controller
{
    /**
     * Display the visits by Character ID and creates one if none exist.
     *
     * @param int $characterId
     * @return VisitorCounterResource|JsonResponse
     */
    public function showCounterByCharacterId($characterId) {
        $showCounterByCharacterId = $this->getVisitors($characterId);
        if ($showCounterByCharacterId === null) {
            VisitorCounter::create(
                ['character_id' => $characterId],
                ['visits' => 1]
            );
            $showCounterByCharacterId = $this->getVisitors($characterId);
        }
        $this->setupSession();
        if (!$this->isCharacterViewed($characterId)) {
            $showCounterByCharacterId->increment('visits');
            $this->storeCharacterViewed($characterId);
            return new VisitorCounterResource($showCounterByCharacterId);
        }
        $showCounterByCharacterId->setAlreadyVisitedAttribute(true);
        return new VisitorCounterResource($showCounterByCharacterId);
    }

    private function getVisitors($characterId) {
        return VisitorCounter::where('character_id', $characterId)
            ->first();
    }

    private function setupSession() {
        session_start([
            'name' => 'MarvelApp',
            'cookie_httponly' => true,
            'cookie_lifetime' => 3600
        ]);
        if (empty($_SESSION['viewed_characters'])) {
            $_SESSION['viewed_characters'] = [];
        }
    }

    private function isCharacterViewed($character_id) {
        return in_array($character_id, $_SESSION['viewed_characters']);
    }

    private function storeCharacterViewed($character_id) {
        $_SESSION['viewed_characters'][] = $character_id;
    }
}
