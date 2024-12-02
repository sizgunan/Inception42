
up:
	mkdir -p /home/sizgunan/data/wordpress
	mkdir -p /home/sizgunan/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down

prune:
	docker system prune -af --volumes

clean:
	docker-compose -f srcs/docker-compose.yml down -v

clean-images: clean
	images=$$(docker images -q); \
	if [ -n "$$images" ]; then \
	    docker rmi $$images; \
	fi

fclean: clean-images
	sudo rm -rf /home/sizgunan/data/mariadb/*
	sudo rm -rf /home/sizgunan/data/wordpress/*

.PHONY: clean fclean down up prune clean-images
