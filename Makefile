# Main commands
up:
	docker compose up -d

down:
	docker compose down

restart: down up

# PHP operations
bash:
	docker compose exec php bash

composer:
	docker compose exec php composer $(filter-out $@,$(MAKECMDGOALS))

console:
	docker compose exec php bin/console $(filter-out $@,$(MAKECMDGOALS))

# Administration
logs:
	docker compose logs -f

mysql:
	docker compose exec mysql mysql -usymfony -ppassword symfony_db

phpmyadmin:
	xdg-open http://localhost:8080  # Linux

mailhog:
	xdg-open http://localhost:8025

# Quality tools
cs-fix:
	docker compose exec php php-cs-fixer fix src

phpstan:
	docker compose exec php phpstan analyse src

# Help for beginners
help:
	@echo "Available commands:"
	@echo "  make up          - Start containers"
	@echo "  make down        - Stop containers"
	@echo "  make bash        - Enter PHP container"
	@echo "  make composer ... - Run Composer command"
	@echo "  make console ... - Run Symfony console"
	@echo "  make phpmyadmin  - Open PHPMyAdmin"
	@echo "  make cs-fix      - Code formatting"

# Utility rule for argument processing
%:
	@: