 

SET SQL_LOG_BIN = 0;
/* this statement will not be logger or replicated */
DROP TABLE orders;
SET SQL_LOG_BIN = 1;
