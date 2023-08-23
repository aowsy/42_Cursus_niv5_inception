PATH_DATA = /home/mdelforg/data
PATH_YML = ./srcs/docker-compose.yml

all:
        @grep "127.0.0.1  mdelforg.42.fr" /etc/hosts || echo "127.0.0.1  mdelforg.42.fr" >> /etc/hosts
        @mkdir -p $(PATH_DATA)/wordpress
        @mkdir -p $(PATH_DATA)/mariadb
        @docker compose -f $(PATH_YML) up -d --build

build:
        @docker compose -f $(PATH_YML) build

stop:
        @docker compose -f $(PATH_YML) stop

start:
        @docker compose -f $(PATH_YML) start

clean:
        @docker compose -f $(PATH_YML) down --rmi local

fclean:
        @docker compose -f $(PATH_YML) down --rmi local -v
        @rm -rf $(PATH_DATA)
        @docker system prune -af

re: fclean all

.PHONY: all down clean fclean re
