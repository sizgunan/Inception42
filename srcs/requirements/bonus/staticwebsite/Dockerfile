FROM debian:bullseye

RUN apt-get update && \
     apt-get upgrade && \ 
     apt-get install -y nginx 

LABEL WEBSITE STATIC

COPY ./index.html /var/www/html/
COPY ./style.css /var/www/html/
COPY ./images/ /var/www/html/images/

WORKDIR /var/www/html/

RUN rm -f ./index.nginx-debian.html
# RUN mv index.html index.nginx-debian.html

EXPOSE 6783

CMD ["nginx", "-g", "daemon off;"]
