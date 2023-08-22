FROM debian:buster

RUN apt-get update

RUN apt-get install wget -y
RUN apt-get install bash -y
RUN apt-get install php -y
RUN apt-get install php-cgi -y
RUN apt-get install php-mysql -y
RUN apt-get install php-fpm -y
RUN apt-get install php-pdo -y
RUN apt-get install php-gd php-cli -y
RUN apt-get install php-mbstring -y
RUN apt-get install redis -y
RUN apt-get install php-redis -y

RUN rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/auto_config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/auto_config.sh
ENTRYPOINT ["/usr/local/bin/auto_config.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
