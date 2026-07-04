FROM alpine:3.24

RUN apk add --no-cache \
    wget \
    curl \
    bash \
    php84 \
    php84-fpm \
    php84-pdo_mysql \
    php84-mysqli \
    php84-json \
    php84-curl \
    php84-dom \
    php84-exif \
    php84-fileinfo \
    php84-mbstring \
    php84-openssl \
    php84-xml \
    php84-zip \
    php84-iconv \
    php84-phar \
    mariadb-client && \
    addgroup -S www-data 2>/dev/null || true && \
    adduser -S -G www-data www-data 2>/dev/null || true && \
    ln -sf /usr/sbin/php-fpm84 /usr/sbin/php-fpm && \
    ln -sf /usr/bin/php84 /usr/bin/php


WORKDIR /var/www

RUN wget https://fr.wordpress.org/wordpress-6.9.4-fr_FR.tar.gz && \
    tar -xzf wordpress-6.9.4-fr_FR.tar.gz && rm wordpress-6.9.4-fr_FR.tar.gz && \
    chown -R www-data:www-data /var/www/wordpress && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php84/php-fpm.d/www.conf
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]
