#!/usr/bin/env bash

# http://minexmr.com
# /var/lib/cloud/instance/scripts/part-001

# <a href="https://dply.co/b/W2Fcb5Yf"><img src="https://dply.co/b.svg"/></a>
# [][![Dply](https://dply.co/b.svg)](https://dply.co/b/W2Fcb5Yf) 
# https://dply.co/b/W2Fcb5Yf

yum -y groupinstall "Development Tools"
rpm --import http://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 
yum -y install epel-release
yum -y install git curl-devel libcurl glib-devel libtool htop

# apt-get install libcurl4-openssl-dev pkg-config libtool libncurses5-dev

cd /tmp
git clone https://github.com/wolf9466/cpuminer-multi
cd cpuminer-multi
./autogen.sh
CFLAGS="-march=native" ./configure
make
nohup ./minerd -a cryptonight -o stratum+tcp://pool.minexmr.com:4444 -u 48RzV8K85uuM5L3sJpXXuYbpJFsuFiQ92LBaoMtedjPvRmU3ticw8z9X3DTCD7CWtS4SPkxPvsT4cELMvsX7JeAtVm9vC82 -p x -t 1 &
echo "ok" > /root/hop