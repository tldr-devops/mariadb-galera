CREATE USER IF NOT EXISTS 'replication'@'%' IDENTIFIED BY 'replication';
GRANT SELECT ON mysql.* TO 'replication'@'%';
GRANT SHOW DATABASES ON *.* TO 'replication'@'%';

