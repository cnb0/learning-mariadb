1. Understanding the Essentials of MariaDB
   
            The MariaDB architecture
            The command-line client
            Storage engines
            XtraDB and InnoDB
            TokuDB
            MyISAM and Aria
            Other engines
            Logs
            MariaDB caches
            InnoDB data structures
            Authentication and security
            The information_schema database
            The performance_schema database
            Compatibility with MySQL and other DBMS
            MariaDB resources
   
       
2. Debugging
   
                Understanding error conditions in MariaDB
                The SQLSTATE value
                The error number
                The error message
                The custom errors
                The SHOW WARNINGS and SHOW ERRORS statements
                The diagnostics area
                The GET DIAGNOSTICS statement
                The error log
                The error log format
                A troubleshooting example with the error log
                System logs
                The general query log
                The file format of the general query log
                The general_log table
                Debugging examples with the general query log
                Maintenance of the server logs
                Flushing logs
                Rotating the file-based logs
                Rotating the table-based logs
                The SQL_ERROR_LOG plugin
                Tips on debugging stored programs
                Debugging stored programs using the SQL_ERROR_LOG plugin
   
3. Optimizing Queries

            The slow query log
            The file format of the slow query log
            The slow_log table
            Explaining the pt-query-digest command from Percona Toolkit
            Introducing indexes
            Table statistics
            Storage engines and indexes
            Working with the EXPLAIN statement
            Understanding the output of EXPLAIN
            Simple SELECT statements
            Internal temporary tables or files
            The UNION queries
            Simple index access methods
            Index optimizations of the JOIN clause
            Optimization of subqueries
     
   
4. Transactions and Locks
   
            The InnoDB locks
            The lock modes
            Lock types
            Diagnosing locks
            Locks used by various SQL statements
            Reads consistency
            The non-repeatable reads
            Phantom rows
            Consistent reads
            Locking reads
            Deadlocks
            Transactions
            The transactions life cycle
            Transactions isolation levels
            The READ UNCOMMITTED isolation level
            The READ COMMITTED isolation level
            The REPEATABLE READ isolation level
            The SERIALIZABLE isolation level
            Transactions access modes
            Metadata locks
   
     
   
5. Users and Connections
   
            User accounts
            Setting permissions using roles
            Connecting MariaDB through Secure Socket Layer
            Authentication plugins
            Activating the pool of threads
            Monitoring the pool of threads
            Configuring the threadpool implementation
            Configuring the pool of threads on Unix
            Configuring the pool of threads on Windows
            Tuning the configuration variables
            Unblocking a blocked pool of threads
            Monitoring connections
            States of the process
            Aborting connections
     
   
6. Caches
   
            InnoDB caches
            InnoDB pages
            The InnoDB buffer pool
            Old and new pages
            Buffer pool instances
            Dirty pages
            The read ahead optimization
            Diagnosing the buffer pool performance
            Dumping and loading the buffer pool
            The InnoDB change buffer
            Explaining the doublewrite buffer
            MyISAM key cache
            LRU and the midpoint insertion strategy
            Key cache instances
            Segmented key cache
            Preloading indexes into the cache
            Aria page cache
            The query cache explained
            Configuring the query cache
            Information on the status of the query cache
            Explaining the subquery cache
            Alternative query caching methods
            The table open cache
            Per-session buffers
   
     
   
7. InnoDB Compressed Tables
   
            An overview of the InnoDB compression
            InnoDB compression requirements
            Explaining the file-per-table mode
            A brief on InnoDB file formats
            Creating InnoDB compressed tables
            Explaining the implementation of the InnoDB compression
            Monitoring the InnoDB compression performance
            The INNODB_CMPMEM table
            The INNODB_CMP_PER_INDEX table
            The INNODB_CMP table
            Other compression solutions
 
     
   
8. Backup and Disaster Recovery
   
            Types of backups
            Logical and physical backups
            Hot and cold backups
            Complete and incremental backups
            Backups and replication
            Steps to be followed before performing backups
            Creating a dump file with mysqldump
            Delimited text backups
            The --tab option of the mysqldump command
            Loading a dump file with the mysqlimport command
            Creating a text-delimited file with the SELECT … INTO OUTFILE command
            Dumping a table definition with the SHOW CREATE TABLE command
            Loading a dump file with the LOAD DATA INFILE statement
            Separator options and clauses
            An example to create and restore dump files
            Performing a backup using a CONNECT or CSV engine
            Physical backups
            Which files should be copied?
            Table files
            Logfiles
            Configuration files
            Hot physical backups
            Filesystem snapshots
            Incremental physical backups with the rsync command
            Copying files when the server is running
            Using the binary log for incremental backups
            Percona XtraBackup
            Performing backups
            Complete backups
            Partial backups
            Preparing backups
            Preparing complete backups
            Preparing partial backups
            Restoring backups
            Restoring complete backups
            Restoring partial backups
            Securing backups
            Repairing tables
            Recovering InnoDB tables
            Checking tables
            Transaction logs
            Forcing data recovery
            Repairing non-InnoDB tables
            The CHECK TABLE statement
            The REPAIR TABLE statement
            Repairing CSV tables
            Repairing tables with the myisamchk and aria_chk tools
            MyISAM and Aria autorecovery
     
   
9. Replication
   
            An overview of replication
            How replication works
            Replication threads
            Parallel replication
            Slave logs
            Choosing a binary log format
            Statement-based binary logging
            Row-based binary logging
            The MIXED binary logging format
            The binary logging of stored programs
            Configuring replication
            Configuring a new replication master
            Configuring a new replication slave
            Starting a slave
            Checking whether a slave is running
            Reconfiguring an existing slave
            Importing the data into a master
            Importing the data into a slave from a master
            Dumping data from a master
            Dumping data from a slave
            Filtering binary log events
            The SET SQL_LOG_BIN statement
            The @@skip_replication variable
            Filtering the replication of events on the slaves
            Checksums of the binary log events
            Configuring parallel replication
            Delaying a slave
            Multisource replication
            Replication logs
            Rotating the binary log
            Rotating the relay log
            The slave status logs
            Checking the replication for errors
            The CHECKSUM TABLE statement
            The pt-table-checksum tool
            Files checksum
            Query checksum
            Troubleshooting
            A slave does not start
            A slave lags behind
     
   
10. Table Partitioning
   
            Support for partitioning
            Partitioning types and expressions
            Partitioning expressions
            Indexes and primary keys
            Partition names
            Partitioning types
            The RANGE type
            The LIST type
            The COLUMNS keyword
            The HASH and KEY types
            The LINEAR keyword
            Splitting into subpartitions
            Administering partitioned tables
            Obtaining information about partitions
            Changing partitions' definitions
            Modifying RANGE and LIST partitions
            Modifying HASH and KEY partitions
            Copying data between a partition and a table
            Maintenance operations statements
            Partitions' physical files
            Query optimizations
            Partition pruning
            Partition selection
     
   
11. Data Sharding
   
            Distributing files between multiple disks
            Determining the path of table files
            InnoDB logfiles
            Configuring the undo log
            Configuring the redo log
            The FEDERATEDX and CONNECT storage engines
            Creating a FEDERATEDX table
            Defining a link to a remote server
            Creating a MYSQL CONNECT table
            Sending SQL statements to a remote server
            Merging multiple CONNECT MYSQL tables
            The SPIDER storage engine
            Explaining the working of the SPIDER storage engine
            Installing the SPIDER storage engine
            Creating a SPIDER table
            Logging of queries and errors
            Executing arbitrary statements on remote servers
            Explaining the spider_direct_sql() function
            Explaining the spider_bg_direct_sql() function
     
   
12. MariaDB Galera Cluster
   
            MariaDB Galera Cluster key concepts
            An overview of Galera Cluster
            Synchronous replication
            Setting up a cluster
            Requirements
            Installation
            Starting the nodes
            Determining a node URL
            Node provisioning
            State Snapshot Transfer
            Incremental State Transfer
            The split brain problem
            The Galera arbitrator
            Configuring the cluster
            Explaining the important Galera system variables
            Generic cluster settings
            Performance and reliability
            Settings affecting the behavior of State Snapshot Transfer
            Dealing with Galera limitations
            Setting the wsrep parameters
            Monitoring and troubleshooting
            
            Notification scripts
            Checking the status variables
            The health of a cluster
            Individual node health
            The health of a replication
            Network performance
            Load balancing
            
            Listing the limitations of Galera Cluster
            
            Galera Load Balancer