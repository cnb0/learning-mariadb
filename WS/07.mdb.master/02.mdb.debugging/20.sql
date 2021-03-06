NOTE:
I grouped here some consecutive examples which are very similar. all you need to check is that they produce no error (no particular output is expected)

sql:
FLUSH LOGS;
FLUSH ERROR LOGS; -- error log
FLUSH GENERAL LOGS; -- general query log
FLUSH SLOW LOGS; -- slow query log
FLUSH BINARY LOGS; -- binary log
FLUSH ENGINE LOGS; -- storage engines logs
FLUSH RELAY LOGS; -- replication slaves log
FLUSH NO_WRITE_TO_BINLOG LOGS;
FLUSH LOCAL ERROR LOGS;
FLUSH TABLES;
FLUSH LOCAL TABLES;

shell:
mysqladmin flush-logs
mysqladmin flush-tables
