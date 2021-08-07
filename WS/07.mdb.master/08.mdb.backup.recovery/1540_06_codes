INSTALL SONAME 'ha_connect';
CREATE TABLE customer_bkp 
    ENGINE = CONNECT 
    TABLE_TYPE = CSV 
    FILE_NAME = '/tmp/customer.csv' 
    HUGE = 0 
    COMPRESS = 1 
    READONLY = 1 
    DATA_CHARSET = 'utf8' 
    SEP_CHAR = ',' 
    ENDING = 1 
    QUOTED = 1 
    QCHAR = '"' 
    HEADER = 1 
    SELECT * FROM customer;
