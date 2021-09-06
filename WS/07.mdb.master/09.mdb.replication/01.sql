Try the following example using the STATEMENT binlog format.

SQL:

SET @a = RAND();
CREATE TABLE example ENGINE = InnoDB SELECT @a;


