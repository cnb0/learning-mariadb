
 

CREATE TABLE customer ( 
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    hire_date DATE NOT NULL, 
    first_name VARCHAR(50), 
    last_name VARCHAR(50) 
    ) 
    ENGINE = InnoDB, 
    CHARACTER SET = 'utf8';
INSERT INTO customer (hire_date, first_name, last_name) VALUES 
    ('2011-05-07', 'David', 'Coverdale'), 
    ('2010-01-20', 'Ritchie', 'Blackmore'), 
    ('2012-11-15', 'Ian', 'Paice'), 
    ('2011-06-01', 'Jon', 'Lord'), 
    ('2010-02-28', 'Roger', 'Glover');

Bash:

mysqldump -uroot -proot test customer --tab=/tmp --fields-terminated-by=, --fields-enclosed-by="'" --fields-escaped-by=/
tail --lines 3 /tmp/customer.txt

SQL:

SELECT * 
    FROM customer 
    INTO OUTFILE '/tmp/customer.2.txt' 
    FIELDS 
    TERMINATED BY ',' 
    ENCLOSED BY '\'' 
    ESCAPED BY ',';

Bash:

md5sum /tmp/customer.txt 
md5sum /tmp/customer.2.txt

SQL:

TRUNCATE TABLE customer;

Bash:

bin/mysqlimport -uroot -proot --fields-terminated-by=, --fields-enclosed-by="'" --fields-escaped-by=/ test /tmp/customer.txt

SQL:

LOAD DATA INFILE '/tmp/customer.txt' 
    INTO TABLE test.customer 
    FIELDS 
    TERMINATED BY ',' 
    ENCLOSED BY '\'' 
    ESCAPED BY ',';
