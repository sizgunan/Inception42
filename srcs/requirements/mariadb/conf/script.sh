#!/bin/sh


mysql_install_db
mysqld_safe &

while ! mysqladmin ping --silent; do sleep 1; done

mysqladmin -u $MYSQL_ROOT password $MYSQL_ROOT_PASSWORD

echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pass' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' IDENTIFIED BY '$db_pass' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ROOT'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> db.sql
echo "FLUSH PRIVILEGES ;" >> db.sql

echo "DONE: MySQL user and database"

mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" < db.sql


mariadb-admin shutdown 

echo "done"
mysqld_safe