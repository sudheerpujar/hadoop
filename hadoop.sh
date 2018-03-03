#!/bin/bash

BASE_DIR=$(dirname $0)

$BASE_DIR/hadoop-uninstall.sh

$BASE_DIR/del-hduser.sh

$BASE_DIR/add-hduser.sh

$BASE_DIR/java8-install.sh

$BASE_DIR/configure-ssh.sh

$BASE_DIR/hadoop-install.sh

$BASE_DIR/hadoop-config.sh

$BASE_DIR/hadoop-start.sh
