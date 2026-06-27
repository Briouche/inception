FROM debian:13
RUN apt update && apt upgrade -y && \
    apt -y install wget \
    curl \
    php8.4 php8.4-fpm php8.4-mysql \
    mariadb-client

WORKDIR /var/www

RUN wget https://fr.wordpress.org/wordpress-6.9.4-fr_FR.tar.gz && \
    tar -xzf wordpress-6.9.4-fr_FR.tar.gz && rm wordpress-6.9.4-fr_FR.tar.gz && \
    chown -R www-data:www-data /var/www/wordpress && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/8.4/fpm/pool.d/www.conf
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]
