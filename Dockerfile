FROM debian:stretch-slim

MAINTAINER Raphael APARD <raphael.apard@acolad.fr>

RUN apt-get update && apt-get install -y \
    nginx 

RUN apt-get install -y sl

ADD docker/nginx/nginx.conf /etc/nginx/
ADD docker/nginx/vhost.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/vhost.conf /etc/nginx/sites-enabled/vhost
RUN rm /etc/nginx/sites-enabled/default

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
