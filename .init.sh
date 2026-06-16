#!/bin/sh
# illusion - docker-composer.yml of mariadb + redis + phpmyadmin, for sample only.
# (c) 2025 Shiranui (https://shiranui.xyz)

RANDOM_STRING() {
    # Generate a random string using openssl
    openssl rand -hex 16
}

# Generate a random passwords
export MARIADB_ROOT_PASSWORD="$(RANDOM_STRING)"

# Render the .env file from the template
envsubst '$MARIADB_ROOT_PASSWORD' <.env.tmpl >.env
