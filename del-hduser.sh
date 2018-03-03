#!/bin/bash

echo "Deleting the dedicated user and group for hadoop (del-hduser.sh)"

echo "Deleting the user"

sudo userdel hduser

echo "Deleting the group"

sudo  groupdel hadoop

echo "Deleting the home directory"
sudo rm -rf /home/hduser




