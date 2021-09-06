Before the code:
install the SQL_ERROR_LOG plugin as showed in the previous examples
and run this SQL statement 10 times:
SET GLOBAL sql_error_log_rotate = ON;

shell:
\! ls /usr/local/mysql/data | grep errors 
