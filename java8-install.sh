#!/bin/bash

echo "Java 8 Installation (java8-install.sh)"

echo "Installing Python Software Properties"

sudo apt-get install python-software-properties

echo "Adding Repository"

sudo add-apt-repository ppa:webupd8team/java

echo "Update the source list"

sudo apt-get update

echo "Installating Java 8"

sudo apt-get install oracle-java8-installer

echo "Verifying the Java installation"

java -version
