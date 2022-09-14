#!/bin/bash

composer install  --no-interaction

php artisan migrate --env=development 
php artisan key:generate 
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan config:cache

php artisan serve  --host=0.0.0.0 