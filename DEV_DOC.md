# Inception

This project sets up a wordpress website using docker compose.

The infrastructure consists of:

- Nginx
- Wordpress
- MariaDB

Each service is built from a debian 13 image and runs in its own container.

## Setup

check if DATA_DIR in makefile corresponds with the volume directories in docker-compose.

Create the .env file in srcs/ with all needed fields

example:

---

```env
MARIADB_USER=brcoppie
MARIADB_DATABASE=database
MARIADB_PASSWORD=passw0rd
MARIADB_ROOT_PASSWORD=passw0rd

DOMAIN_NAME=brcoppie.42.fr

WP_TITLE=Inception

WP_ADMIN_USER=brcoppie42
WP_ADMIN_PASSWORD=passw0rd
WP_ADMIN_EMAIL=brcoppie@42.fr

WP_USER=corr42
WP_USER_PASSWORD=passw0rd
WP_USER_EMAIL=corr@42.fr
```

---

### build


```bash
make
```

or

```bash
make up
```

or if containers already exist
```bash
make start
```

---

### Stop

delete containers

```bash
make down
```

stop containers
```bash
make stop
```

restart containers
```bash
make restart
```

---

### Remove everything

remove all containers
```bash
make clean
```

remove images and volumes too
```bash
make fclean
```

## Acces

to acces the website, start the containers. once its done loading, open a browser and go to 

```
https://<DOMAIN_NAME>
```

should originally be:

```
https://brcoppie.42.fr
```

login using the credentials in the env file

## verifying services

Check that all containers are running:

```bash
docker ps
```

Expected running containers:

- nginx
- wordpress
- mariadb

To view container logs:

```bash
docker compose -f srcs/docker-compose.yml logs
```

## Data percistance

data is stored via docker volumes in the /home/$USER/data directory

wordpress in /home/$USER/data/wordpress
mariadb in /home/$USER/data/mariadb

be careful to have consistent path in docker-compose and makefile.
