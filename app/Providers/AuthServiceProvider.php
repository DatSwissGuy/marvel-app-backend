<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Laravel\Passport\Passport;
use Laravel\Passport\RouteRegistrar;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot() {
        $this->registerPolicies();
        Passport::routes(
            function (RouteRegistrar $router) {
                // List of all possible routes with Passport
                $router->forAccessTokens();
                // $router->forAuthorization();
                // $router->forTransientTokens();
                // $router->forClients();
                // $router->forPersonalAccessTokens();
            }, ['prefix' => 'api/v1']
        );
        Passport::tokensExpireIn(now()->addMinutes(60));
        Passport::refreshTokensExpireIn(now()->addMinutes(59));
    }
}
