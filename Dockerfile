FROM mariadb:latest

ENV BRUCE=WAYNE

ENV MARIADB_ROOT_PASSWORD=bayport_123

ENV MYSQL_ROOT_PASSWORD==bayport_123

RUN echo ${BRUCE} >> BATCAVE

EXPOSE 3307