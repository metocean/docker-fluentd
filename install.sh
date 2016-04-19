#!/bin/sh
set -e

apk update
apk upgrade

# Install fluentd
apk add build-base ca-certificates ruby ruby-irb ruby-dev
echo 'gem: --no-document' >> /etc/gemrc
gem install fluentd -v $FLUENTD_VERSION
mkdir -p /etc/fluentd
mkdir -p /usr/lib/fluentd/plugins
cp /install/fluentd.conf /etc/fluentd/
mkdir /etc/service/fluentd
cp /install/fluentd.sh /etc/service/fluentd/run
apk del build-base ca-certificates ruby-dev

# Clean up
rm -rf /install
rm -rf /tmp/*
rm -rf /var/cache/apk/*