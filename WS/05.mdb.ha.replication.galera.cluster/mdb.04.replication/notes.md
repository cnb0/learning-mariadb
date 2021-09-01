
### Configuring the master node

The first thing to do is to prepare the master node. We need to activate some options in its configuration file (my.cnf):

        [mysqld]
        server-id=1
        bind-address = 0.0.0.0
        log_bin=/var/log/mysql/mariadb-bin


Now, we are able to build a master/slave replication. There are other options that you should be aware of:

    expire_logs_days=10
    sync_binlog = 1
    slave_compressed_protocol
    transaction-isolation = READ COMMITTED
    binlog_format = row


### Preparing Master Node :

    MariaDB [(none)]> create user 'replication'@'192.168.33.32' identified by 'password';

    - grant the replication privileges to all the databases

        MariaDB [(none)]> grant replication slave on *.* to 'replication'@'192.168.33.32';

    - reload the privileges:

        MariaDB [(none)]> FLUSH PRIVILEGES;

    - Master status

            MariaDB [(none)]> show master status;
                +--------------------+----------+--------------+------------------+
                | File               | Position | Binlog_Do_DB | Binlog_Ignore_DB |
                +--------------------+----------+--------------+------------------+
                | mariadb-bin.000012 |      328 |              |                  |
                +--------------------+----------+--------------+------------------+
                1 row in set (0.00 sec)
            
            - The file corresponds to the binary logs file available in your logbin directory, 
              and then the next column shows the current position in the binary log.

### Configuring the slave node

        [mysqld]
        server-id=2
        bind-address = 0.0.0.0
        slave_compressed_protocol = 1
        binlog_format = row
        read_only

        Creating a slave -There are multiple ways to create a slave. Here are two of the common and best ways:

            - mysqldump: 
                         We can create a slave with the classical mysqldump tool. 
                         It works well, but it could take a very long time depending on the database size and locks tables during the whole dump.
                        The biggest inconvenience with the mysqldump solution is that you need to lock tables during the whole dump operation.

                    -   first let's flush all the data on the disk that hasn't been written yet and lock the tables:

                         MariaDB [(none)]> flush tables with read lock;

                     -   If you want to perform a full replication with all the databases available on the master, you can run the following command:

                        $ mysqldump -uroot -p --opt --routines --triggers --events --single-transaction --master-data=2 -A > alldb.sql

                     - Once the preceding command is executed, release the lock on tables:

                            MariaDB [(none)]> unlock tables;

                      - To restore the dump on the slave, run the following command:

                          $ mysql -uroot -p < alldb.sql

                      - Now, to be ready to start the slave, we need to get the binary logfile and position written in the dump file, 
                        if you've chosen the master-data option to be 1:
                           $ grep -m 1 "^-- CHANGE MASTER" alldb.sql -- CHANGE MASTER TO MASTER_LOG_FILE='mariadb-bin.000012', MASTER_LOG_POS=328;





            - Xtrabackup: 
                         This is a Percona open source tool. It is faster and has a very small lock table duration on InnoDB/XtraDB.
                         Xtrabackup is the best solution to create backups for several reasons:
                            - It can create dumps fast
                            - It locks tables for a very short time
                            - It can stream compressed databases
                        - To be able to use Xtrabackup for replication purposes, we need to have Xtrabackup installed on both the master and 
                          slave server. To install it, add the repository of Percona, add a preference pinning file, and install it 

                        - To be able to boot the slave properly, be sure no MariaDB instance is running on your slave and delete all the current MariaDB datadir content:
            
                                        slave1> service mysql stop
                                        [ ok ] Stopping MariaDB database server: mysqld.
            
                                        slave1> service mysql status
                                        [info] MariaDB is stopped..
                                        slave1> rm -Rf /var/lib/mysql/*

                        - You will also need to do an SSH key exchange from the master to the slave to be able to stream the backup directly to the slave:

                                master1> ssh-copy-id 192.168.33.32

                        - Replace the IP address with the slave's IP address. You can now launch the stream (via xbstream) backup from the master to the slave through SSH:

                            - master1> innobackupex --stream=xbstream ./ | ssh root@192.168.33.32 "xbstream -x -C /var/lib/mysql/"
                                        [...]
                                        innobackupex: MySQL binlog position: filename 'mariadb-bin.000012', position 328
                                        140220 22:12:48  innobackupex: Connection to database server closed
                                        140220 22:12:48  innobackupex: completed OK!

                        - Now, the backup has been pushed on the slave server in /var/lib/mysql; however, it's not ready for use. 
                          We need to prepare it on the slave host using the following command:

                                    slave1> innobackupex --apply-log /var/lib/mysql
                                    [...]
                                    InnoDB: FTS optimize thread exiting.
                                    InnoDB: Starting shutdown...
                                    InnoDB: Shutdown completed; log sequence number 1619478
                                    140220 22:31:23  innobackupex: completed OK!
                                    Change the right to give MariaDB user control using the following command:

                                    slave1> chown -Rf mysql. /var/lib/mysql
                                    You can now start the slave host with the following command:

                                    slave1> service mysql start

                        - Now, to be ready to start the slave, we need to get the binary logfile and position located in /var/lib/mysql/xtrabackup_binlog_info on the slave:
                            mariadb-bin.000012  328

                        - We now have all the necessary information to start the slave! Let's do it! The stop and reset options are not required but, as a rule, it's better to do it. This is generally done when a previous slave was configured and it's required to make it work to build a new replication. Execute these commands on the slave:

                                MariaDB [(none)]> stop slave;
                                MariaDB [(none)]> reset slave;
                                MariaDB [(none)]> change master to master_host='192.168.33.31', master_user='replication', master_password='password', master_log_file='mariadb-bin.000012', master_log_pos=328;
                                MariaDB [(none)]> start slave;

                         - What does the change master command do? It indicates to the slave the IP/DNS of the master host, the credentials for replication, and the logbin information.

                            The logbin information indicates the position of the slave to the master. If actions occurred on the master during the time interval of the back up and the restore operations, those actions will be replayed on the slave to elevate it at the same level of data as the master node.

                            The last thing to do is to replicate, from the master node, the debian.cnf file from /etc/mysql/ to the slave one. Then, you have to change the password of that user with the one indicated in the debian.cnf file to replicate it across all nodes:

                                    MariaDB [(none)]> SET PASSWORD FOR 'debian-sys-maint'@'localhost' = PASSWORD('password');
                                    MariaDB [(none)]> FLUSH PRIVILEGES;

                                    This avoids a failed startup service on the slaves.

                                    Checking the slave status
                                            You can check the slave status with the following command:

                                            MariaDB [(none)]> show slave status\G;
                                            *************************** 1. row ***************************
                                                        Slave_IO_State: Waiting for master to send event
                                                            Master_Host: 192.168.33.31
                                                            Master_User: replication
                                                            Master_Port: 3306
                                                            Connect_Retry: 60
                                                        Master_Log_File: mariadb-bin.000012
                                                    Read_Master_Log_Pos: 328
                                                        Relay_Log_File: mysqld-relay-bin.000006
                                                            Relay_Log_Pos: 617
                                                    Relay_Master_Log_File: mariadb-bin.000012
                                                        Slave_IO_Running: Yes
                                                        Slave_SQL_Running: Yes
                                                        ....

                                            Slave_IO_Running and Slave_SQL_Running: If they both are set to yes, then the replication is ok. 
                                            If one of them is not, then you'll have to     correct it.
                                            Last_Errno and Last_Error: They indicate when a problem occurs and can notify the current SQL query what has failed the replication. 
                                            You can then try to reproduce or understand it.

                                            The relay logs store the replication state which is updated on data changes. This works independently of the master bin logs. This helps the slave to make the correlation between binary logs and itself. It is commonly used when you want to chain slaves from other slaves.