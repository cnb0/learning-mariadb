## MariaDB Database Administration
```
Installing MariaDB server
        Installing in Ubuntu/Debian
        Installing in other Linux Distributions
        Installation on Windows


MariaDB Server Files and Scripts
        MariaDB Programs
        MariaDB Server
        MariaDB Client
        GUI Tools

MariaDB Server Configuration
        Server Options
        The Server SQL Mode
        Server System Variables
        Dynamic System Variables
        Server Status Variables
        Shutdown Process

MariaDB Security Issues
        Securing MariaDB Against Attacks
        Security-Related Options
        Security Issues with LOAD DATA LOCAL

MariaDB Access Privilege System
        MariaDB Privilege System Overview
        Privileges Provided by MariaDB
        Connecting to the MariaDB Server - Stages
        Access Control, Stage 1: Connection Verification
        Access Control, Stage 2: Request Verification
        Access Denied Errors

MariaDB User Account Management
        Users and Passwords
        Creating New Users
        Deleting User Accounts
        Limiting User Resources
        Changing Passwords

MariaDB Database Maintenance
        Backup and Recovery
        Point-in-Time Recovery
        Maintenance and Crash Recovery
        myisamchk Syntax and Options
        Getting Table Information
        MariaDB Local Setting
        National Characters and Sorting
        MariaDB Server Time Zone

MariaDB Log Files
        Error Log
        General Query Log
        Update Log
        Binary Log
        Slow Query Log
        Log File Maintenance and Rotation


Running Multiple MariaDB Servers on the Same Machine
        Running Multiple Servers in Windows
        Running Multiple Servers in Windows as Services
        Running Multiple Servers in Unix and Linux
        Using Client Tools in a Multi-Server Environment

MariaDB Query Cache
        The Concept of Query Cache
        Testing Query Cache with SELECT
        Configuring Query Cache
        Checking Query Cache Status and Maintenance


The CONNECT Storage Engine
        Installing the CONNECT storage engine
        Creating and dropping CONNECT tables
        Reading and writing CSV data using CONNECT
        Reading and writing XML data using CONNECT
        Accessing MariaDB tables using CONNECT
        Using the XCOL table type
        Using the PIVOT table type
        Using the OCCUR table type


Exploring Dynamic and Virtual Columns in MariaDB
        Creating tables with dynamic columns
        Inserting, updating, and deleting dynamic column data
        Reading data from a dynamic column
        Using virtual columns

Performance and Usage Statistics
        Installing the Audit Plugin
        Using the Audit Plugin
        Using engine-independent table statistics
        Using extended statistics
        Enabling the performance schema
        Using the performance schema


Optimizing and Tuning MariaDB
        Using SHOW STATUS
        Controlling MariaDB optimizer strategies
        Using extended Keys with InnoDB and XtraDB
        Configuring the MyISAM segmented key cache
        Configuring threadpool
        Configuring the Aria pagecache
        Optimizing queries with the subquery cache
        Optimizing semijoin subqueries
        Using microseconds in DATETIME columns
        Updating the DATETIME and TIMESTAMP columns automatically
