FROM alpine:3.24

RUN apk add --no-cache \
    bash \
    mariadb \
    mariadb-client && \
    sed -i 's/skip-networking//' /etc/my.cnf.d/mariadb-server.cnf

COPY conf/50-server.cnf /etc/my.cnf.d/50-server.cnf
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]