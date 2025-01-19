FROM debian:11

RUN apt-get update && apt-get upgrade -y
RUN apt-get	install -y mariadb-server mysql-client

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mdb-conf.sh /mdb-conf.sh

EXPOSE 3306

ENTRYPOINT ["/mdb-conf.sh"]