Before the code:
to test this example, MariaDB must be started with these options:
mysqld --general-log --log-output=table,file

sql:
SET GLOBAL general_log = 0;
ALTER TABLE mysql.general_log ENGINE = MyISAM;
SET GLOBAL general_log = 1;
