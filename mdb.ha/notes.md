

## [ MariaDB HA on K8s](https://portworx.com/run-ha-mariadb-google-kubernetes-engine/)
## [MariaDB Galera](https://www.digitalocean.com/community/tutorials/how-to-configure-a-galera-cluster-with-mariadb-on-centos-7-servers)

                 
1. MariaDB Replication
                 
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
                 
2. WAN Slave Architectures

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
                 
3. Building a Dual Master Replication
                 
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
                            
                
4. MariaDB Multimaster Slaves
                 
            Multimaster slave replication
            Setting up a multisource replication
            Other options
                            
                 
5. Galera Cluster – Multimaster Replication
                 
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
                   

