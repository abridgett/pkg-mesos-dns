#!/bin/sh

VERSION=0.5.0
VERSION_SUFFIX=os1
MAINTAINER="adrian@opensignal.com"

wget -c https://github.com/mesosphere/mesos-dns/releases/download/v$VERSION/mesos-dns-v$VERSION-linux-amd64
chmod +x mesos-dns-v$VERSION-linux-amd64

fpm -f -m "$MAINTAINER" -t deb -s dir -n mesos-dns -v $VERSION-$VERSION_SUFFIX \
  mesos-dns-v$VERSION-linux-amd64=/usr/sbin/mesos-dns \
  init.conf=/etc/init/mesos-dns.conf \
  mesos-dns.json=/etc/mesos/mesos-dns.json
