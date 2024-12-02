FROM debian:bullseye

RUN apt-get update && \
     apt-get upgrade && \ 
     apt-get install -y nginx && \
    apt-get install -y openssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-private.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=[sizgunan.1337.ma]"

COPY ./conf/nginx.conf /etc/nginx/conf.d/

LABEL TLS 1.3

CMD ["nginx", "-g", "daemon off;"]
