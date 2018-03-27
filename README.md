# Docker Initiation


## Requirements

* Docker & Docker compose (https://docs.docker.com/install/)
* NPM & NodeJS (https://docs.npmjs.com/getting-started/installing-node)
* GIT (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Docker should be running.

## Build docker

    ./lets.sh build-docker

## Init laravel project

    ./lets.sh dev
    ./lets.sh init

## Development

Start devloppment :

    ./lets.sh dev

Stop devloppment :

    ./lets.sh sleep

Run build (composer / assets)

    ./lets.sh build


Application : http://localhost:8010/  
PHPMyadmin : http://localhost:8081/ (username : dev / password : dev)


## Build assets

    npm run dev|prod|watch|watch-poll

## Laravel artisan

    ./lets.sh artisan [ARTISAN ARGUMENTS]
