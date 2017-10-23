FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y  curl  \
		vim \
		git \
		zip \
		php7.0 \
		php7.0-mbstring \
		php7.0-xml \
		php7.0-sqlite3 \
		php7.0-mysql \
		php7.0-curl \
		php7.0-intl \
		php-xdebug

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require "fxp/composer-asset-plugin:^1.3.1"

#sudo docker build -t ubuntu-php .
