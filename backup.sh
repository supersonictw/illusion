#!/bin/bash
# illusion - docker-composer.yml of mariadb + redis + phpmyadmin, for sample only.
# (c) 2023 SuperSonic (https://github.com/supersonictw)

# Arguments:
BACKUP_DATABASE_NAME=$1
BACKUP_DATABASE_HOST="localhost"
BACKUP_DATABASE_USER="root"
BACKUP_DATABASE_PASS="illusion-admin"

# Export databases
if ! [ -z "$BACKUP_DATABASE_NAME" ]; then
    compressed_filename="database-$BACKUP_FILENAME.sql.xz"
else
    compressed_filename="databases.sql.xz"
fi

cd /tmp

rm -rf $BACKUP_FILENAME $compressed_filename

touch $compressed_filename
chmod 600 $compressed_filename

if ! [ -z "$BACKUP_DATABASE_NAME" ]; then
    mysqldump -h$BACKUP_DATABASE_HOST -u$BACKUP_DATABASE_USER -p$BACKUP_DATABASE_PASS $BACKUP_DATABASE_NAME | xz -c >>$compressed_filename
else
    mysqldump -h$BACKUP_DATABASE_HOST -u$BACKUP_DATABASE_USER -p$BACKUP_DATABASE_PASS --all-databases | xz -c >>$compressed_filename
fi

# Move to /dump
rm -rf /dump/$compressed_filename
mv $compressed_filename /dump/$compressed_filename
