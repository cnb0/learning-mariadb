Before trying the code:
SET @@session.sql_mode = 'ERROR_FOR_DIVISION_BY_ZERO';

Code:
\W
SELECT 1/0;
\w
SELECT 1/0;