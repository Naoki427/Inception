FROM debian:11

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl php php7.4-fpm php-mysql mariadb-client 
#iputils-ping wget vim zsh git netcat mycli

COPY /conf/script.sh /

RUN  chmod +x script.sh

CMD ["/script.sh"]