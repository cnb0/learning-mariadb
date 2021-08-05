

1. Performance Introduction 

            MariaDB history
            Choosing the appropriate hardware
            Disks
            SATA magnetic drives
            SAS magnetic drives
            Hybrid drives
            SSDs
            RAID and acceleration cards
            RAID cards and levels
            Fusion-io direct acceleration cards
            Disk arrays
            RAM
            CPU
            Architecture types and performances
            BIOS power management optimization
            C-States
            P-States
            Constructor name options
            Power management optimization
            cpufreq
            cpuidle
            Disk and filesystem optimization
            Kernel disks' I/O schedulers
            Partition alignment
            SSD optimization
            Filesystem options
            SWAP
            Dedicating hardware with cgroups
            Manual solution
            Automatic solution using the cgconfig daemon
            Dedicating hardware optimization with NUMA
            Migrating from MySQL to MariaDB
            Introduction to MariaDB engines
                 

                 
2. Performance Analysis
                 
            Slow queries
            The explain command
            Slow query logs
            The show explain command
            Profiling
            Performance schema
            User statistics
            Sysbench
            Percona Toolkits
            pt-query-digest
            pt-stalk
            pt-                   
            pt-mysql-                   
            pt-duplicate-key-checker
            pt-index-usage
            Process list progression
            mytop
            innotop
            mysqlsla
                            
                   
                 
3. Performance Optimizations
                 
            Resetting statistics
            Global statistics
            DNS connections
            The DNS cache server
            Maximum connections
            The binlogs cache
            Binlogs for transactional caches
            Binlogs for nontransactional caches
            Temporary tables
            Open tables
            The query cache
            Understanding the query cache
            Modifying the query cache
            Optimizing storage engines
            Summarizing your databases
            InnoDB/XtraDB
            Pool size and statistics
            Redo logs
            Transaction commits and logs
            Buffer pool instances
            The flush method
            TokuDB
            Installation
            The flush method
            Cache size
            Transaction commits and logs
            Temporary directory
            Compression
            MyISAM
            Key buffer
            Index
             Engines
            Types
            mysqltuner
                 
4. MariaDB Replication
                 
            How replication works
            Configuring the master node
            Preparing the master node
            Configuring the slave node
            Creating a slave
            Using mysqldump
            Using Xtrabackup
            Checking the slave status
            GTID replication
            What is GTID
            Configuring the master node
            Preparing the master node
            Configuring a GTID slave node
            Creating a slave
            Starting the slave
            Checking the slave status
            Migrating from classical to GTID replication
            Parallel replication
            Load balancing read transactions
            Installing HAProxy
            Configuring HAProxy
            Checking health
            Testing the configuration
            Use cases and troubleshooting
            SQL errors
            Analyzing binlogs
            GTID – switching a slave to master and recovering
                 
5. WAN Slave Architectures

            Cascade slaves
            Speeding up replication performance for middle slaves
            Restricting replications
            Designing slave in multiple continents
            SSL replication
            Generating certificates
            Building your own CA
            Building your server certificate
            Building your client certificates
            Checking your certificates
            Configuring MariaDB for SSL
            Master SSL
            Client SSL
            Compression options
                 
6. Building a Dual Master Replication
                 
            Dual master replication and risks
            Installing and configuring a dual master
            Automatic management
            HAProxy
            Learning about the maintenance mode
            Using Unix Socket
            Using HATop
            Using the configuration file
            Keepalived
            Pacemaker or Percona Replication Manager
            DRBD
            How to repair a dual master replication
                            
                
7. MariaDB Multimaster Slaves
                 
            Multimaster slave replication
            Setting up a multisource replication
            Other options
                            
                 
8. Galera Cluster – Multimaster Replication
                 
            How Galera Cluster works
            Galera Cluster limitations
            The basics of installation and configuration
            Installation
            Configuration files
            MariaDB configuration
            Galera configuration
            First boot
            Usages and understandings
            Transfer methods
            Using mysqldump
            Using Xtrabackup
            Using rsync
            Dedicating a donor node
            Starting after a complete blackout
            Consensus clustering and maintenance
            Garb – the quorum solution
            Performance tuning
            Parallel slave threads
            Gcache size
            Designing redundant architectures
            Read and write nodes
            Load balanced architecture
            WAN replication
            Disaster recovery
            Tests and issues
            Paused replication
            Break Galera
            Split-brain
                   
                 
9. Spider – Sharding Your Data
                            
            Configuring Spider
            Creating your first shard
            Sharding replication
            Creating replicated shards
            Spider HA monitoring
            Recovering data after server failure
            Performance tuning
            Spider parameters
            The bgs mode
            The connection recycle mode
            Statistics tables
            Remote SQL logs
            Number of shards
                   
                 
10. Monitoring
                 
            Single instance
            Replication
            Galera Cluster
            Other monitoring solutions
            Graphs
            Logs
                 
11. Backups
                 
            Using mysqldump
            Compression
            Using mysqlhotcopy
            LVM
            Snapshot
            Removing snapshots
            Rollback
            Backup
            Xtrabackup
            Full backup
            Incremental backup
            Restoring from a full backup
            Restoring from an incremental backup
            Galera backup.
