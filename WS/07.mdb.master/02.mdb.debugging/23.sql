Before the code:
to test this example, MariaDB must be started with these options:
mysqld --general-log --log-output=table,file
Execute:
CREATE DATABASE _;
CREATE TABLE `mysql`.`general_log02` LIKE `mysql`.`general_log`;
CREATE TABLE `mysql`.`general_log03` LIKE `mysql`.`general_log`;
DELIMITER ||

sql:
DROP PROCEDURE IF EXISTS `_`.`rotate_general_log`;
CREATE PROCEDURE `_`.`rotate_general_log`()
BEGIN
	DECLARE old_general_log TINYINT DEFAULT @@global.general_log;
	SET @@global.general_log = 0;
	DROP TABLE `mysql`.`general_log03`;
	RENAME TABLE
		`mysql`.`general_log02` TO `mysql`.`general_log03`,
		`mysql`.`general_log` TO `mysql`.`general_log02`;
	CREATE TABLE `mysql`.`general_log` LIKE `mysql`.`general_log02`;
	SET @@global.general_log = old_general_log;
END;

After the code:
||
DELIMITER ;

Then, call the procedure:
CALL `_`.`rotate_general_log`();

and check that this statement produces this output:
SHOW TABLES LIKE 'general%';
+----------------------------+
| Tables_in_mysql (general%) |
+----------------------------+
| general_log                |
| general_log02              |
| general_log03              |
+----------------------------+

