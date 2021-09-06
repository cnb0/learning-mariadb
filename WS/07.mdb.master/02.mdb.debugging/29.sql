Before the code:
Install SQL_ERROR_LOG, as showed in previous examples
Execute:
CREATE DATABASE IF NOT EXISTS shop;
CREATE DATABASE IF NOT EXISTS backups;
DROP TABLE IF EXISTS shop.customer;
CREATE TABLE shop.customer (a INT);
DROP PROCEDURE IF EXISTS backups.backup_table;
DELIMITER ||

sql:
CREATE PROCEDURE backups.backup_table(IN db_name CHAR(64), IN table_name CHAR(64))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN END;
	
	SET @sql = CONCAT('TRUNCATE TABLE backups.', table_name);
	PREPARE stmt FROM @sql;
	EXECUTE stmt;
	
	SET @sql = CONCAT('INSERT INTO backups.', table_name, ' SELECT * FROM ', db_name, '.', table_name);
	PREPARE stmt FROM @sql;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	SET @sql = NULL;
END;

After the code:
||
DELIMITER ;
CALL backups.backup_table('shop', 'customer');

Now you should check that no error appeared in backups and no error was added in /usr/local/mysql/data/sql_errors.log
