PATH_HOME = /home/mdelforg
PATH_YML = ./srcs/docker-compose.yml

all:
	@rm -rf /etc/hosts
	@cp hosts /etc/hosts
	@mkdir -p /home/mdelforg/data/wordpress
	@mkdir -p /home/mdelforg/data/mariadb
	@docker compose -f $(PATH_YML) up -d --build

stop:
	@docker compose -f $(PATH_YML) stop

clean:
	@docker compose -f $(PATH_YML) down

fclean: clean
	@rm -rf $(PATH_HOME)/data/wordpress
	@rm -rf $(PATH_HOME)/data/mariadb
	@docker system prune -af

re: fclean all

.PHONY: all down clean fclean re
