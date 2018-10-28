FROM debian:stretch

RUN apt update

RUN apt-get install -y apache2 
RUN apt-get install -y curl \
			gnupg \
			git \
			vim

RUN apt-get -y install apt-transport-https lsb-release ca-certificates
RUN curl https://packages.sury.org/php/apt.gpg | apt-key add -
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN apt-get update
RUN apt-get -y install php7.2-cli php7.2-fpm 

RUN apt-get install -y --allow-unauthenticated php7.2-mbstring \
		php7.2-xml \
		php7.2-mysql \
		php7.2-curl \
		php7.2-intl \
		php7.2-gd \
		php7.2-imap \
		php7.2-cgi \
		php-redis \
		php7.2-mongo 

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require "fxp/composer-asset-plugin:^1.3.1"

RUN /usr/sbin/a2enmod socache_shmcb
RUN /usr/sbin/a2enmod headers
RUN /usr/sbin/a2enmod mpm_event
RUN /usr/sbin/a2enmod rewrite
RUN /usr/sbin/a2enmod alias
RUN /usr/sbin/a2enmod proxy
RUN /usr/sbin/a2enmod proxy_fcgi

RUN mkdir -p /usr/local/bin
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony
RUN php -r "file_put_contents('symfony', file_get_contents('https://symfony.com/installer'));"

WORKDIR /var/www
RUN symfony new symfony28 2.8
RUN symfony new symfony34 3.4

COPY symfony34.conf /etc/apache2/sites-available/
COPY symfony28.conf /etc/apache2/sites-available/
RUN a2ensite symfony34.conf
RUN a2ensite symfony28.conf

COPY httpd-foreground /usr/local/bin/httpd-foreground
RUN chmod 755 /usr/local/bin/httpd-foreground

COPY docker-entrypoint.sh /root/docker-entrypoint.sh
RUN chmod 755 /root/docker-entrypoint.sh
ENTRYPOINT ["/root/docker-entrypoint.sh"]

CMD ["httpd-foreground"]

#docker run -d -p 8028:8028 -p 8034:8034 --rm symfony_php72
#ab -c 10 -t 10 "http://localhost:8028/"
