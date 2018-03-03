#!/bin/bash

export HADOOP_INSTALL=/usr/local/hadoop

BASE_DIR=$(dirname $0)

echo "Configuring Hadoop (hadoop-config.sh)"

echo "Backing up the .bashrc"

sudo cp /home/hduser/.bashrc  /home/hduser/.bashrc.bkp 
sudo chown -R hduser:hadoop /home/hduser/.bashrc.bkp
sudo chmod 777 /home/hduser/.bashrc

echo "Adding configs contents from bashrc-config.txt to /home/hduser/.bashrc"

sudo cat $BASE_DIR/bashrc-config.txt>>/home/hduser/.bashrc
sudo chmod 644 /home/hduser/.bashrc
sudo Source /home/hduser/.bashrc

echo "Backing up the hadoop-env.sh"
sudo cp $HADOOP_INSTALL/etc/hadoop/hadoop-env.sh $HADOOP_INSTALL/etc/hadoop/hadoop-env.sh.bkp
sudo chown -R hduser:hadoop $HADOOP_INSTALL/etc/hadoop/hadoop-env.sh.bkp
sudo chmod 777 $HADOOP_INSTALL/etc/hadoop/hadoop-env.sh

echo "Adding JAVA_HOME to hadoop-env.sh"
sudo echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle">> $HADOOP_INSTALL/etc/hadoop/hadoop-env.sh
sudo chmod 644 $HADOOP_INSTALL/etc/hadoop/hadoop-env.sh

echo "Creating temporary directory for the propery value of property name hadoop.tmp.dir"
sudo mkdir -p /app/hadoop/tmp
sudo chown hduser:hadoop /app/hadoop/tmp

echo "Backing up the core-site.xml"
sudo cp $HADOOP_INSTALL/etc/hadoop/core-site.xml $HADOOP_INSTALL/etc/hadoop/core-site.xml.bkp
sudo chown -R hduser:hadoop $HADOOP_INSTALL/etc/hadoop/core-site.xml.bkp
sudo chmod 777 $HADOOP_INSTALL/etc/hadoop/core-site.xml

echo "Adding core-site configuration to core-site.xml"
sudo cp $BASE_DIR/core-site.xml $HADOOP_INSTALL/etc/hadoop/core-site.xml
sudo chmod 644 $HADOOP_INSTALL/etc/hadoop/core-site.xml


echo "Backing up the hdfs-site.xml"
sudo cp $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml.bkp
sudo chown -R hduser:hadoop $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml.bkp
sudo chmod 777 $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml

echo "Adding hdfs-site configuration to hdfs-site.xml"
sudo cp $BASE_DIR/hdfs-site.xml $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml
sudo chmod 644 $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml


echo "Backing up the mapred-site.xml"
sudo cp $HADOOP_INSTALL/etc/hadoop/mapred-site.xml $HADOOP_INSTALL/etc/hadoop/mapred-site.xml.bkp
sudo chown -R hduser:hadoop $HADOOP_INSTALL/etc/hadoop/mapred-site.xml.bkp
sudo chmod 777 $HADOOP_INSTALL/etc/hadoop/mapred-site.xml

echo "Adding mapred-site configuration to mapred-site.xml"
sudo cp $BASE_DIR/mapred-site.xml $HADOOP_INSTALL/etc/hadoop/mapred-site.xml
sudo chmod 644 $HADOOP_INSTALL/etc/hadoop/mapred-site.xml

echo "Backing up the yarn-site.xml"
sudo cp $HADOOP_INSTALL/etc/hadoop/yarn-site.xml $HADOOP_INSTALL/etc/hadoop/yarn-site.xml.bkp
sudo chown -R hduser:hadoop $HADOOP_INSTALL/etc/hadoop/yarn-site.xml.bkp
sudo chmod 777 $HADOOP_INSTALL/etc/hadoop/yarn-site.xml

echo "Adding yarn-site configuration to yarn-site.xml"
sudo cp $BASE_DIR/yarn-site.xml $HADOOP_INSTALL/etc/hadoop/yarn-site.xml
sudo chmod 644 $HADOOP_INSTALL/etc/hadoop/yarn-site.xml

echo "Formatting the namenode - is done once when Hadoop is being installed"
sudo -H -u hduser $HADOOP_INSTALL/bin/hdfs namenode -format


