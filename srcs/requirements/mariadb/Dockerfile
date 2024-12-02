FROM debian:bullseye

RUN apt-get update && \
     apt-get install -y mariadb-server && \
     rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB Server"

COPY ./conf/script.sh /var/
RUN chmod +x /var/script.sh

ENTRYPOINT [ "/var/script.sh" ]

