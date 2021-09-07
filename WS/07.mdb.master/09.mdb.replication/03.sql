 

CREATE USER 'mslave1'@'host10' IDENTIFIED BY 'somepwd';
GRANT REPLICATION SLAVE ON *.* TO 'mslave1'@'host10' REQUIRE SSL;

