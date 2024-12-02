FROM debian:bullseye

RUN apt-get update && \
     apt install php7.4-fpm php7.4-mysql mariadb-client curl -y

RUN mkdir /run/php


COPY ./conf/wp_script.sh /var/www/html/
WORKDIR /var/www/html/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
     chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && chmod +x /usr/local/bin/wp

EXPOSE 9000

CMD [ "bash", "./wp_script.sh" ]
