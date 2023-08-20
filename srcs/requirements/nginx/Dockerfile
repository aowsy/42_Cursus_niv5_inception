FROM debian:buster

RUN apt-get update

RUN apt install nginx -y
RUN apt-get install openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/mdelforg.crt \
	-keyout /etc/nginx/ssl/mdelforg.key \
	-subj "/C=FR/ST=Brussels/L=Brussels/O=42/OU=19/CN=mdelforg.42.fr/UID=mdelforg"

COPY conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
