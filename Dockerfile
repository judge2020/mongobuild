FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://azure.archive.ubuntu.com/ubuntu/ bionic main restricted universe" > /etc/apt/sources.list && \
    echo "deb http://azure.archive.ubuntu.com/ubuntu/ bionic-updates main restricted universe" >> /etc/apt/sources.list && \
    echo "deb http://azure.archive.ubuntu.com/ubuntu/ bionic-security main restricted universe" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y gnupg netcat && \
    wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc | sudo apt-key add - && \
    echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list &&  \
    apt-get update && \
    apt-get install -y --force-yes mongodb-org mongodb-org-server mongodb-org-shell mongodb-org-mongos mongodb-org-tools && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
