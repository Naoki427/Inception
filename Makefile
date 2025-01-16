all: up

up: 
	docker compose -f srcs/docker-compose.yml up

build:
	docker compose -f srcs/docker-compose.yml build

down:
	docker compose -f srcs/docker-compose.yml down

stop:
	docker compose -f srcs/docker-compose.yml stop

clean:
	docker rmi wordpress mariadb nginx