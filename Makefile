NAME = inception
COMPOSE = docker compose -f srcs/docker-compose.yml
DATA_DIR = /home/brcoppie/data

all: up

build: directories
	$(COMPOSE) build

up: build
	$(COMPOSE) up

down:
	$(COMPOSE) down

start:
	$(COMPOSE) start

stop: 
	$(COMPOSE) stop

restart: down up

clean: down
	docker system prune -f

fclean:
	$(COMPOSE) down -v --rmi all
	sudo rm -rf $(DATA_DIR)/wordpress
	sudo rm -rf $(DATA_DIR)/mariadb
	docker system prune -af

directories:
	mkdir -p $(DATA_DIR)/wordpress
	mkdir -p $(DATA_DIR)/mariadb

.PHONY: all build up down start stop restart clean fclean directories
