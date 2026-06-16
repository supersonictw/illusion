#!/bin/sh
# illusion - docker-composer.yml of mariadb + redis + phpmyadmin, for sample only.
# (c) 2026 Shiranui (https://shiranui.xyz)

# Exits on error occurred
set -e

# Execute the dumpfiles script inside the container
docker exec illusion-data dumpfiles

# Echo done message
echo "Database dump completed and saved to /dump/data.sql.xz"
