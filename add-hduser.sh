#!/bin/bash

echo "Adding dedicated group and user for hadoop (add-hduser.sh)"

echo "Adding  the group"

sudo  addgroup hadoop

echo "Creating and adding the new user to the above group, please enter password and other details when prompted"

sudo adduser --ingroup hadoop hduser
