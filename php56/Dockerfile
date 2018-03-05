FROM tanoka/ubuntu-14

RUN apt-get -y install software-properties-common
RUN LANG=C.UTF-8 apt-add-repository -y ppa:ondrej/php
RUN apt-get update

RUN apt-get install -y --allow-unauthenticated php5.6  \
		php5.6-mbstring \
		php5.6-xml \
		php5.6-mysql \
		php5.6-curl \
		php5.6-intl \
		php5.6-mcrypt \
		php5.6-gd \
		php5.6-imap \
		php5.6-cgi \
		php5-redis \
		php-xdebug

RUN apt-get install -y php5.6-mongo
RUN apt-get install -y php5.6-bcmath


RUN echo "xdebug.remote_enable=1" >> /etc/php/5.6/mods-available/xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /etc/php/5.6/mods-available/xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require "fxp/composer-asset-plugin:^1.3.1"
