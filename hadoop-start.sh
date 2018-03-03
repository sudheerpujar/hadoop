#!/bin/bash

export HADOOP_INSTALL=/usr/local/hadoop

BASE_DIR=$(dirname $0)

echo "Starting HDFS Services"

sudo -H -u hduser $HADOOP_INSTALL/sbin/start-dfs.sh

echo "ssh" | sudo tee /etc/pdsh/rcmd_default

echo "Starting YARN Services"

sudo -H -u hduser $HADOOP_INSTALL/sbin/start-yarn.sh

sudo -H -u hduser jps

sudo xdg-open "http://localhost:9870/" &

sudo xdg-open "http://localhost:8088/" &
