#!/usr/bin/env bash

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
    docker-compose build --no-cache
    echo -e "${green}Docker build done!${normal}"
  ;;

  dev)
    if [ ! -f "./.env" ]
    then
      echo "You need to run \"${red}./lets.sh build-docker${normal}\" first." 1>&2
      exit;
    fi
    docker-compose up -d
  ;;

  init)
    CONTAINER="simplon_php"
    RUNNING=$(docker inspect --format="{{.State.Running}}" $CONTAINER 2> /dev/null)
    if [ $? -eq 1 ]; then
      echo "You need to run \"${red}./dev.sh${normal}\" first." 1>&2
      exit;
    fi
    if [ "$RUNNING" == "false" ];
      then
      echo "You need to run \"${red}./lets.sh dev${normal}\" first." 1>&2
      exit;
    fi

    if [ ! -f "./.env" ]
    then
      echo "You need to run \"${red}./lets.sh build-docker${normal}\" first." 1>&2
      exit;
    fi

    if [ ! -f "./app/.env" ]
    then
      cp "./app/.env.example" "./app/.env"
    fi

    chmod -R 777 app/storage

    docker-compose exec php composer install
    docker-compose exec php php artisan key:generate && \
    docker-compose exec php php artisan migrate
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
