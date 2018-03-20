# Docker Initiation


## Requirements

* Docker & Docker compose (https://docs.docker.com/install/)
* NPM & NodeJS (https://docs.npmjs.com/getting-started/installing-node)
* GIT (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)


## Install

    ./lets.sh install

## Development

### Docker

Start docker :

    ./lets.sh dev
    
Stop docker :

    ./lets.sh sleep

Application : http://localhost:8010/  
PHPMyadmin : http://localhost:8081/ (username : dev / password : dev)
    
### Build assets

    npm run dev|prod|watch|watch-poll

## Laravel artisan

    ./lets.sh artisan [ARTISAN ARGUMENTS]
