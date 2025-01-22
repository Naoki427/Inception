#!/bin/bash
mkdir /var/www

mkdir /var/www/html

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

if [ -f "/var/www/html/wp-config.php" ]; then
    echo "wp-config.phpファイルが見つかりました。削除します。"
    rm "/var/www/html/wp-config.php"
    echo "wp-config.phpファイルを削除しました。"
    sleep 5
else
    echo "wp-config.phpファイルが見つかりませんでした。"
fi


wp core download --allow-root

wp config create --dbhost=mariadb:3306 --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F
