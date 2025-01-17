FROM debian:11

RUN apt update -y && apt upgrade -y &&\
	apt-get	install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mdb-conf.sh /mdb-conf.sh

EXPOSE 3306

ENTRYPOINT ["/mdb-conf.sh"]