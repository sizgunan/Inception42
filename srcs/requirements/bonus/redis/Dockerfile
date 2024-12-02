FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install redis-server -y

COPY ./conf/redis_script.sh /var/
RUN chmod +x /var/redis_script.sh

EXPOSE 6379

ENTRYPOINT [ "/var/redis_script.sh" ]
CMD [ "redis-server",  "--daemonize no", "--protected-mode no" ]
