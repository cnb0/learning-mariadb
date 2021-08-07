Before trying the example:

CREATE DATABASE gest_pescara;
CREATE TABLE gest_pescara.orders (a INT, o_time DATE) ENGINE = InnoDB;

SQL:

bin/mysql -uroot -proot --execute="SELECT * FROM gest_pescara.orders WHERE o_time > NOW() - INTERVAL 2 DAY;"
