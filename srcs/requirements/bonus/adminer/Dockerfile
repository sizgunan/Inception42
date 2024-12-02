FROM debian:bullseye

RUN apt-get update -y && apt-get install adminer  -y


WORKDIR /usr/share/adminer

RUN mv adminer.php index.php

CMD ["php", "-S", "0.0.0.0:8081"]