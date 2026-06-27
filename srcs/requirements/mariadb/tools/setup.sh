#!/bin/bash

set -e

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld
chmod 755 /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

    mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
EOF

    mysqld_safe --datadir=/var/lib/mysql &

    until mariadb-admin ping; do
        sleep 1
    done

    mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
    mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO '${MARIADB_USER}'@'%';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"

    mariadb-admin -uroot -p"${MARIADB_ROOT_PASSWORD}" shutdown
fi

exec mysqld --user=mysql
