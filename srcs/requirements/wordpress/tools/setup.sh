#!/bin/bash

set -e

cd /var/www/wordpress

until mariadb -hmariadb -u"$MARIADB_USER" -p"$MARIADB_PASSWORD" -e "SELECT 1"; do
    echo "waiting for database..."
    sleep 2;
done

if [ ! -f wp-config.php ]; then
    wp config create \
        --dbname="$MARIADB_DATABASE" \
        --dbuser="$MARIADB_USER" \
        --dbpass="$MARIADB_PASSWORD" \
        --dbhost="mariadb:3306" \
        --allow-root
fi

if ! wp --allow-root core is-installed; then
    wp core install \
        --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    wp user create \
        "$WP_USER" \
        "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author \
        --allow-root
fi

chown -R www-data:www-data /var/www/wordpress

exec php-fpm8.4 -F
