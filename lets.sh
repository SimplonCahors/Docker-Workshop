#!/usr/bin/env bash

set -e

# Colors
normal=$'\e[0m'
bold=$(tput bold)
red="$bold$(tput setaf 1)"
green="$(tput setaf 2)"
blue="$(tput setaf 4)"

readonly PROJECT_NAME="Atelier DevOps"


case "$1" in
  
  build-docker)
    if [ ! -f "./env" ]
    then
     cp "./.env.example" "./.env"
    fi
    docker-compose build
    echo -e "${green}Docker build done!${normal}"
  ;;

  init)
    if [ ! -f "./.env" ]
    then
      echo "You need to run \"${red}./lets.sh build-docker${normal}\" first." 1>&2
      exit;
    fi

    if [ ! -f "./app/.env" ]
    then
      cp "./app/.env.example" "./app/.env"
    fi

    docker-compose up -d

    cd app
    composer install
    npm install
    cd -       
    
    docker-compose exec php php artisan key:generate && \
    docker-compose exec php php artisan migrate
  ;;

  dev)
    if [ ! -f "./.env" ]
    then
      echo "You need to run \"${red}./lets.sh build-docker${normal}\" first." 1>&2
      exit;
    fi
    docker-compose up -d
  ;;
  
  build)
    cd app
    composer install
    npm install
    npm run dev
    cd -
    echo -e "${green}Done!${normal}"
  ;;

  sleep)
    docker-compose down -v
    echo -e "${blue}Good night!${normal}"
  ;;

  artisan)
    ARTISAN_ARGS=''
    for ARG in "${@:2}"; do
        ARTISAN_ARGS="$ARTISAN_ARGS $ARG"
    done
    docker-compose exec php php artisan $ARTISAN_ARGS
  ;;

  *)
    echo "Command \"${red}$1${normal}\" not found." 1>&2
    exit 1;
  ;;
esac
