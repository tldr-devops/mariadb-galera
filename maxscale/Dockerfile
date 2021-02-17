FROM ubuntu:20.04

LABEL description="MariaDB MaxScale binary v2.5.7" maintainer="filipp.s.frizzy@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN groupadd -g 1000 maxscale && \
useradd -r -u 1000 -g 1000 -s /sbin/nologin -c "MariaDB MaxScale" maxscale && \
apt-get -y update && \
apt-get -y install gnupg2 ca-certificates less sysstat && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "0xE3C94F49" && \
echo "deb http://downloads.mariadb.com/MaxScale/2.5.7/ubuntu focal main" >> /etc/apt/sources.list.d/maxscale.list && \
apt-get update && \
apt-get -y install maxscale && \
apt-get autoclean

USER maxscale
WORKDIR /tmp

EXPOSE 3306 8989

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "/usr/bin/maxscale --config /etc/maxscale.cnf -d -l stdout"]
