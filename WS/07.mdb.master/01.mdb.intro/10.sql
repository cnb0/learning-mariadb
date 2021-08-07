Before trying the code:
DROP TABLE IF EXISTS test.t1, test.t2;
CREATE TABLE test.t1 SELECT 1;
CREATE TABLE test.t2 SELECT * FROM test.t1;

Code:
\P md5sum
SELECT * FROM test.t1;
SELECT * FROM test.t2;