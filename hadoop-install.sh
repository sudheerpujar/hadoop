#!/bin/bash
hadoopFile="hadoop-3.0.0.tar.gz"
echo "Install Hadoop (hadoop-install.sh)"

if [ ! -f "$hadoopFile" ]
then
echo "Downloading Hadoop file"
sudo wget "http://www-us.apache.org/dist/hadoop/common/hadoop-3.0.0/hadoop-3.0.0.tar.gz"
fi

echo "Copying Hadoop Tarball to hduser home"

sudo cp hadoop-3.0.0.tar.gz /home/hduser

echo "Store present working directory in a variable"

PWD=$(pwd)

echo "Change dir to  hduser home"

cd /home/hduser/

echo "Untaring the Hadoop Tarball"

sudo tar -xzf hadoop-3.0.0.tar.gz

echo "Changing back to present working directory" 

cd $PWD

echo "creating folder /usr/local/hadoop"

sudo mkdir /usr/local/hadoop

echo "Moving contents of hadoop-3.0.0 to  /usr/local/hadoop"

sudo mv /home/hduser/hadoop-3.0.0/* /usr/local/hadoop

echo "Changing owner of /usr/local/hadoop to hduser:hadoop"
  
sudo chown -R hduser:hadoop /usr/local/hadoop

echo "Clearing  /home/hduser/hadoop-3.0.0"

sudo rm -rf hadoop-3.0.0









