FROM debian:buster

RUN apt-get update

RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld

COPY ./tools/auto_config.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/auto_config.sh
RUN chmod +x /usr/local/bin/wordpress.sql

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/auto_config.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
