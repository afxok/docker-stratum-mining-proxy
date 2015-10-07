FROM ubuntu:trusty
MAINTAINER <afxok0@gmail.com>

RUN apt-get update
RUN apt-get install -y python-dev python-setuptools python-software-properties software-properties-common
RUN apt-get install -y git

RUN git clone git://github.com/slush0/stratum-mining-proxy.git
WORKDIR stratum-mining-proxy

# Upgrade setuptools package
RUN python distribute_setup.py

# Install required dependencies (namely Twisted and Stratum libraries)
RUN python setup.py develop


EXPOSE 3333
EXPOSE 8332

ENTRYPOINT /stratum-mining-proxy/mining_proxy.py

