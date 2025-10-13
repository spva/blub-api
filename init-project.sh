#!/bin/bash

USER_GROUP = "$(id -u):$(id -g)"

# Check Docker installation
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed!"
    exit 1
fi

# Create project structure (if needed)
mkdir -p {docker/nginx,docker/php,src}

# Start containers
docker compose up -d --build

# Install Symfony (disable because already installed)
# docker compose exec php composer create-project symfony/skeleton:"6.4.*" .

# Fix permissions (добавлено исправление прав)
docker compose exec php sh -c "chown -R $(id -u):$(id -g) ."

# Environment setup
echo "APP_ENV=dev" > src/.env
echo "DATABASE_URL=mysql://symfony:password@mysql:3306/symfony_db?serverVersion=8.0" >> src/.env

# Install dependencies
docker compose exec php composer require \
    symfony/orm-pack \
    symfony/maker-bundle \
    --no-interaction

# Create database
docker compose exec php bin/console doctrine:database:create

# Write permissions (important for Symfony cache)
docker compose exec php chmod -R 777 var/

# Fix permissions again after operations (дополнительное исправление)
docker compose exec php sh -c "chown -R $(id -u):$(id -g) ."

echo "---------------------------------------------"
echo "Project is ready!"
echo "Available URLs:"
echo "  - Symfony:    http://localhost"
echo "  - PHPMyAdmin: http://localhost:8080"
echo "  - MailHog:    http://localhost:8025"
echo "Commands:"
echo "  make up      - Start containers"
echo "  make bash    - Enter PHP container"