#!/bin/bash
# illusion - docker-composer.yml of mariadb + redis + phpmyadmin, for sample only.
# (c) 2023 SuperSonic (https://github.com/supersonictw)

target_name=$1
database_hostname="localhost"
database_username="root"
database_password="illusion-admin"

if ! command -v curl &>/dev/null; then
    apt-get update
    apt-get install -y curl
fi

tmp_filename="$target_name.sql.xz"
touch /tmp/$tmp_filename && chmod 600 /tmp/$tmp_filename
mysqldump -h$database_hostname -u$database_username -p$database_password $target_name | xz -c >>/tmp/$tmp_filename

cat /tmp/$tmp_filename > /dump/$tmp_filename
rm /tmp/$tmp_filename
