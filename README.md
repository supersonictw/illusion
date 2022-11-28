# Illusion

docker-composer.yml of mariadb + redis + phpmyadmin, for sample only.

## MariaDB default account

| Username | Password       |
| -------- | -------------- |
| root     | illusion-admin |

## Internal Hosts/Ports

Allow to connect via networking `illusion` only.

| Service    | Host           | Port |
| ---------- | -------------- | ---- |
| MariaDB    | illusion-data  | 3306 |
| Redis      | illusion-cache | 6379 |
| phpMyAdmin | illusion-pga   | 80   |

## External Ports

Allow to connect via host `localhost` only.

| Service    | Port |
| ---------- | ---- |
| MariaDB    | 2001 |
| Redis      | 2002 |
| phpMyAdmin | 2003 |

## License

[MIT License](LICENSE)

> (c)2022 [SuperSonic](https://github.com/supersonictw).
