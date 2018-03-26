# Docker Initiation


## Requirements

* Docker & Docker compose (https://docs.docker.com/install/)
* NPM & NodeJS (https://docs.npmjs.com/getting-started/installing-node)
* GIT (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)


## Build (nothing to build because we are using containers)

    docker-compose build

## Run

    docker-compose up

## Others docker commands

Stop all docker containers :

    docker stop $(docker ps -a -q)

Remove all docker containers :

    docker rm $(docker ps -a -q)

Remove all docker images :

    docker rmi $(docker images -q)
