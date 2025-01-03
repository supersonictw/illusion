#!/bin/sh
# illusion - docker-composer.yml of mariadb + redis + phpmyadmin, for sample only.
# (c) 2025 Shiranui (https://shiranui.xyz)

RANDOM_STRING() {
    # Generate a random string for a password.
    docker run --rm alpine/openssl:latest rand -hex 16
}

# Copy from .env.default file
cp .env.default .env.local

# Generate a random password for MariaDB
MARIADB_ROOT_PASSWORD="$(RANDOM_STRING)"
sed -i "s/MARIADB_ROOT_PASSWORD=.*/MARIADB_ROOT_PASSWORD=$MARIADB_ROOT_PASSWORD/" .env.local
