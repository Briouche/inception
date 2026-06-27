FROM debian:13
RUN apt update && apt upgrade -y &&\
    apt install nginx vim openssl -y &&\
    mkdir -p /etc/nginx/ssl && \
    mkdir -p /var/run/nginx && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=BE/ST=BX/L=Bruxelles/O=42/OU=42/CN=brcoppie.42.fr/UID=brcoppie" &&\
    mkdir -p /var/www/wordpress && \
    chmod 755 /var/www/wordpress &&\
    chown -R www-data:www-data /var/www/wordpress
COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD [ "nginx", "-g", "daemon off;"]
