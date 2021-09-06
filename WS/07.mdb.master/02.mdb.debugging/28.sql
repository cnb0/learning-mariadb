sql:
CALL test.p(5, 0) /* test01 */ ;

shell:
cat /usr/local/mysql/data/sql_errors.log | grep test01

NOTE:
an sql error should appear in the console.
it will be different from the one reported in the book (because the test.p procedure does not exist)
but this is not relevant: the example shows how to display the error
