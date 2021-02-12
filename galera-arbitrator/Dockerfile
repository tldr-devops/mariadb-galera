FROM ubuntu:20.04

LABEL description="Galera Arbitrator binary version 4" maintainer="filipp.s.frizzy@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN groupadd -g 1000 garbd && \
useradd -r -u 1000 -g 1000 -s /sbin/nologin -c "Galera Arbitrator" garbd && \
apt-get update && \
apt-get -y install galera-arbitrator-4 && \
apt-get autoclean

USER garbd
WORKDIR /tmp

EXPOSE 4567

# garbd --help
# Usage: garbd [options] [group address]
# Configuration:
#   -d [ --daemon ]        Become daemon
#   -n [ --name ] arg      Node name
#   -a [ --address ] arg   Group address
#   -g [ --group ] arg     Group name
#   --sst arg              SST request string
#   --donor arg            SST donor name
#   -o [ --options ] arg   GCS/GCOMM option list
#   -l [ --log ] arg       Log file
#   -c [ --cfg ] arg       Configuration file
# Other options:
#   -v [ --version ]       Print version & exit
#   -h [ --help ]          Show help message & exit

# open file(./gvwstate.dat.tmp) failed(Permission denied)

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "/usr/bin/garbd --group ${MARIADB_GALERA_CLUSTER_NAME} \
    --address ${MARIADB_GALERA_CLUSTER_ADDRESS}"]
