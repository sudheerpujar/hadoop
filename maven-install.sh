#!/bin/bash

echo "Installing Maven"

sudo apt-get purge maven maven2 maven3
sudo add-apt-repository ppa:andrei-pozolotin/maven3
sudo apt-get update
sudo apt-get install maven3

echo "Verify Maven Installation"

mvn -version

cp  maven-settings.xml ~/.m2/settings.xml

ls -ls /usr/share/maven

ls -ls /etc/maven


