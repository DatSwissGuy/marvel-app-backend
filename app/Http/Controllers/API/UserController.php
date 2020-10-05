<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\User;
use Illuminate\Http\Request;
use Symfony\Component\Routing\Exception\RouteNotFoundException;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function currentUser(Request $request) {
        $user = User::findOrFail($request->user())
            ->first();
        return new UserResource($user);
    }

    public function logout(Request $request) {
        $request->user()->token()->revoke();
        $request->user()->token()->delete();
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }
}
