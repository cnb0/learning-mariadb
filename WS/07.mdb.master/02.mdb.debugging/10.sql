 
GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @error = MESSAGE_TEXT;
SELECT @sqlstate, @errno, @error;
