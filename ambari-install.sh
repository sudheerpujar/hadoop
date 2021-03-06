#!/bin/bash

ambariSrcFile="apache-ambari-2.6.1-src.tar.gz"
ambariSrcFolder="apache-ambari-2.6.1-src"
pythonSetUpToolsEggFile="setuptools-0.6c11-py2.7.egg"

echo "Install Ambari (ambari-install.sh)"

if [ ! -f "$ambariSrcFile" ]
then

echo "Downloading Ambari source tar file"
wget http://www.apache.org/dist/ambari/ambari-2.6.1/apache-ambari-2.6.1-src.tar.gz

fi

if [ ! -d "$ambariSrcFolder" ]
then

echo "Untaring Ambari source tar file"
tar xfvz apache-ambari-2.6.1-src.tar.gz

fi

if [ -d "$ambariSrcFolder" ]
then

cd $ambariSrcFolder

fi

echo "Setting ambari build version"

mvn versions:set -DnewVersion=2.6.1.0.0

pushd ambari-metrics
mvn versions:set -DnewVersion=2.6.1.0.0
popd

echo "Installing Python pre requisets"

sudo apt-get install build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev libssl-dev

sudo apt-get install python-setuptools

if [ ! -f "$pythonSetUpToolsEggFile" ]
then
echo "Downloading Python Setuptools egg file"
sudo wget https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg
fi

sh $pythonSetUpToolsEggFile

echo "Copying ambari-metrics-grafana-pom.xml into "

sudo cp ambari-metrics-grafana-pom.xml $ambariSrcFolder/ambari-metrics/ambari-metrics-grafana/pom.xml
sudo cp ambari-funtest-pom.xml $ambariSrcFolder/ambari-metrics/ambari-funtest/pom.xml
sudo cp ambari-logsearch-pom.xml $ambariSrcFolder/ambari-metrics/ambari-logsearch/pom.xml

echo "Creating Debein packages for Ambari"

mvn -B -P $ambariSrcFolder clean install jdeb:jdeb -DnewVersion=2.6.1.0.0 -DskipTests -Dpython.ver="python >= 2.7.6"

sudo apt-get install ambari-server*.deb

sudo ambari-server setup




