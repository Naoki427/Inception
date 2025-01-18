include ./srcs/.env
# export $(shell sed 's/=.*//' ./srcs/.env)
all: up

up: 
	mkdir -p $(WP_VOLUME)
	mkdir -p $(DB_VOLUME)
	chmod -R 755 $(WP_VOLUME)
	chmod -R 755 $(DB_VOLUME)
	docker compose -f srcs/docker-compose.yml up

build:
	docker compose -f srcs/docker-compose.yml build

down:
	docker compose -f srcs/docker-compose.yml down

stop:
	docker compose -f srcs/docker-compose.yml stop

clean:
	docker rmi wordpress mariadb nginx
	rm -rf $(WP_VOLUME)
	rm -rf $(DB_VOLUME)