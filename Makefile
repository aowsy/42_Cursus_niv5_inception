PATH_DATA = /home/mdelforg/data
PATH_YML = ./srcs/docker-compose.yml

all:
	@rm -rf /etc/hosts
	@cp hosts /etc/hosts
	@mkdir -p $(PATH_DATA)/wordpress
	@mkdir -p $(PATH_DATA)/mariadb
	@docker compose -f $(PATH_YML) up -d --build

stop:
	@docker compose -f $(PATH_YML) stop

clean:
	@docker compose -f $(PATH_YML) down

fclean: clean
	@rm -rf $(PATH_DATA)/wordpress
	@rm -rf $(PATH_DATA)/mariadb
	@docker system prune -af

re: fclean all

.PHONY: all down clean fclean re
