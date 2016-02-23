#!/bin/bash
#
# Script Name: weon-daemoncheck.sh
# Author: Antonio Herran
#
# Description: Called from cronjob. Checks if WeON daemon is up. Starts it if not 
#

if [ ! `pidof python` ]; then
	python /etc/weon/weondaemon.py start
fi
