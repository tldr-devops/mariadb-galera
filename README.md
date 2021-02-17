02.02.2021 11:40-00:20
03.02.2021 19:00-19:30 19:40-20:10
04.02.2021 00:00-00:40 17:10-18:30
06.02.2021 17:30-19:30
07.02.2021 16:15-18:15 19:50-21:50
12.02.2021 01:00-02:00 12:40-15:00
17.02.2021 20:50-22:20 22:50-23:50

# Mariadb Galera

## monitoring
```
SHOW GLOBAL STATUS LIKE 'wsrep%';
```

Important
```
| wsrep_cluster_size| 1
| wsrep_cluster_state_uuid| 044c5dd8-694f-11eb-8911-970a826f77a7
| wsrep_cluster_status| Primary
| wsrep_connected | ON
| wsrep_ready | ON
```

## Fail resistance
### 1 nodes cluster
Works as usual database

### 2 nodes cluster
One time I got `Deadlock found when trying to get lock; try restarting transaction` on Primary when Secondary went down.
Other tries Primary and Secondary instances worked fine when other node was down, and it be able to reconnect to worked instance after shutdow.

### 3 nodes cluster (2 nodes + arbiter)
- Primary node with arbiter works fine.
Secondary can reconnect to cluster and get updates after offline.
Secondary can reconnect to cluster and get updates after being recreated from zero.
- Primary and Secondary nodes can work without Arbiter.
Arbiter can reconnect to cluster and get updates after being recreated from zero.
- Primary can work even without Secondary and Arbiter.
Secondary and Arbiter can reconnect to Primary after being recreated from zero.

# Links

## mariadb galera
https://mariadb.com/docs/deploy/community-cluster/
https://www.digitalocean.com/community/tutorials/how-to-configure-a-galera-cluster-with-mariadb-on-ubuntu-18-04-servers
https://github.com/percona/galera

## Arbitrator
https://www.percona.com/doc/percona-xtradb-cluster/LATEST/howtos/garbd_howto.html

## percona xtradb
https://severalnines.com/database-blog/overview-percona-xtradb-cluster-kubernetes-operator
https://www.percona.com/software/mysql-database/percona-xtradb-cluster

## load balance
https://mariadb.com/kb/en/galera-load-balancer/
https://jelastic.com/blog/mysql-mariadb-database-auto-clustering-cloud-hosting/
https://severalnines.com/database-blog/benchmark-load-balancers-mysqlmariadb-galera-cluster
https://github.com/codership/glb/
https://mariadb.com/kb/en/mariadb-maxscale-25-about-mariadb-maxscale/
https://www.educba.com/mariadb-maxscale/
https://proxysql.com/  - require addition setup of user with passwords like in database itself as it works on L7 instead of L3

## docker
https://hub.docker.com/_/mariadb/
https://hub.docker.com/_/percona/
https://hub.docker.com/r/bitnami/mariadb-galera/
https://hub.docker.com/r/instantlinux/mariadb-galera
https://severalnines.com/database-blog/running-mariadb-galera-cluster-without-container-orchestration-tools-part-one

## k8s
https://hub.kubeapps.com/charts/bitnami/mariadb-galera#!
https://www.percona.com/resources/webinars/building-kubernetes-operator-percona-xtradb-cluster
https://github.com/ids/mariadb-galera-k8s
https://github.com/ausov/k8s-mariadb-cluster
https://github.com/adfinis-sygroup/mariadb-galera-chart
https://severalnines.com/database-blog/running-galera-cluster-kubernetes

## percona xtrabackup
https://mariadb.com/kb/en/mariabackup/
https://mariadb.com/kb/en/backup-and-restore-overview/
https://www.percona.com/software/mysql-database/percona-xtrabackup
https://mariadb.com/kb/en/manual-sst-of-galera-cluster-node-with-mariabackup/
https://mariadb.com/kb/en/how-mariabackup-works/
