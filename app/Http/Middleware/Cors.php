<?php

namespace App\Http\Middleware;

use Closure;

class Cors
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next) {
        return $next($request)
            ->header('Access-Control-Allow-Origin', 'http://localhost:4000')
            ->header('Access-Control-Allow-Methods', 'DELETE, GET, POST, PUT')
            ->header('Access-Control-Allow-Headers', 'Accept, Authorization, Application, Content-Type')
            ->header('Access-Control-Allow-Credentials', 'true');
    }
}
