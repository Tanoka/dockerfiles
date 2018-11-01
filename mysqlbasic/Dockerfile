FROM mysql:5.7.17

ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes

RUN apt-get -y update && apt-get -y install curl
COPY install-database.sh /root/install-database.sh 
RUN chmod 700 /root/install-database.sh

RUN curl -L http://downloads.mysql.com/docs/sakila-db.tar.gz -o /root/sakila-db.tar.gz 
RUN cd /root && tar -zxvf sakila-db.tar.gz

# docker volume create mysql-test
# docker run -d -p 3308:3306 --network [red] -v mysl-test:/var/lib/mysql [image]

