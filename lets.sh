#!/usr/bin/env bash

set -e

readonly PROJECT_NAME="Atelier DevOps"

case "$1" in
  dev)
    docker-compose up -d
  ;;

  install)
    if [ ! -f "./env" ]
    then
     cp "./.env.example" "./.env"
    fi
    composer install
    npm install
    docker-compose up -d && \
    docker-compose exec php php artisan key:generate && \
    docker-compose exec php php artisan migrate
  ;;

  sleep)
    docker-compose down -v
  ;;

  artisan)
    ARTISAN_ARGS=''
    for ARG in "${@:2}"; do
        ARTISAN_ARGS="$ARTISAN_ARGS $ARG"
    done
    docker-compose exec php php artisan $ARTISAN_ARGS
  ;;

  *)
    echo "Command \"$1\" not found." 1>&2
    exit 1;
  ;;
esac
