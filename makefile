################################## Container ##################################

shell: # run bash shell in container
	docker-compose exec php-fpm bash

build: # build images and run
	docker-compose up -d --build

run: # start containers
	docker-compose up -d

stop: # stop containers
	docker-compose down --remove-orphans

################################### Laravel ###################################

migrate: # run pending migrations
	docker-compose exec -T php-fpm php artisan migrate

rollback: # rollback last database migration
	docker-compose exec -T php-fpm php artisan migrate:rollback

fresh: # drop all tables and re-run all migrations
	docker-compose exec -T php-fpm php artisan migrate:fresh

model: # create model and corresponding migration file
	@read -p "Enter model name:" modelname; \
	docker-compose exec -T php-fpm php artisan make:model $$modelname -m

resource: # create resource
	@read -p "Enter resource name:" resourcename; \
	docker-compose exec -T php-fpm php artisan make:resource $$resourcename

migration: # create migration
	@read -p "Enter migration name:" migrationname; \
	docker-compose exec -T php-fpm php artisan make:migration $$migrationname

publish: # publish vendor files
	docker-compose exec -T php-fpm php artisan vendor:publish
