FROM jenkins/jenkins

USER root
RUN apt update

RUN apt-get install -y  apt-transport-https lsb-release ca-certificates  \
	&& wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg  \
	&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN apt-get update
RUN apt-get install -y php5.6

RUN apt-get install -y --allow-unauthenticated 	php5.6-mbstring \
		php5.6-xml \
		php5.6-mysql \
		php5.6-curl \
		php5.6-intl \
		php5.6-mcrypt \
		php5.6-gd \
		php5.6-imap \
		php5.6-cgi \
		php-xdebug \
		php-redis \
		php5.6-bcmath \
		php5.6-zip \
		php5.6-mongo \
		php-mongodb

RUN apt install -y ant

RUN echo "xdebug.remote_enable=1" >> /etc/php/5.6/mods-available/xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /etc/php/5.6/mods-available/xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN mkdir -p /home/jenkins && chown jenkins:jenkins /home/jenkins

RUN mkdir -p /opt/framework && && chown jenkins:jenkins /opt/framework

user jenkins
WORKDIR /home/jenkins

RUN composer require --dev "phpunit/phpunit:^5.6"
RUN composer require --dev "squizlabs/php_codesniffer=*"
RUN composer require --dev "phploc/phploc"
RUN composer require --dev "theseer/phpdox"
RUN composer require --dev "pdepend/pdepend:2.5.0"
RUN composer require --dev "phpmd/phpmd:@stable"
RUN composer require --dev "sebastian/phpcpd"

RUN /usr/local/bin/install-plugins.sh checkstyle cloverphp crap4j dry htmlpublisher jdepend plot pmd violations warnings xunit

CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war", "--httpPort=8081"]
