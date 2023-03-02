/*
* Relational Migrator needs source database to allow change data capture.
* The following scripts must be executed on MySQL source database before starting migration.
* For more details, please see https://debezium.io/documentation/reference/stable/connectors/mysql.html#setting-up-mysql
*/

/*
* Before initiating migration job, the MySQL user is required to be able to connect to the source database.
* This MySQL user must have appropriate permissions on all databases for which the Relational Migrator is supposed to capture changes.
*
* Grant the required permissions to the user
*/

GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.*  TO 'root'@'%' ;

/* Finalize the user’s permissions: */
FLUSH PRIVILEGES;


/* Furthermore, binary logging must be enabled for MySQL replication.
* In MySQL 8.0 and higher, binary logging is enabled by default and no further configuration should be needed.
* In MySQL 5.7, binary logging must be explicitly enabled by adding the following configuration to MySQL's
* my.ini (Windows) or my.cnf (Linux/Mac) file, before restarting the service:

[mysqld]
server-id         = 1			# Set to a unique value within your topology
log_bin           = mysql-bin	# The base name of the sequence of binlog files.
binlog_format     = ROW
binlog_row_image  = FULL
expire_logs_days  = 10			# Set to desired number of days for automatic binlog file removal.

* If the source uses the NDB (clustered) database engine, the following parameters must be configured to enable CDC on tables that use that storage engine.

ndb_log_bin			    = ON
ndb_log_update_as_write = OFF	# This value prevents writing UPDATE statements as INSERT statements in the binary log.
ndb_log_updated_only  	= OFF	# This value ensures that the binary log contains the entire row and not just the changed columns.
*/