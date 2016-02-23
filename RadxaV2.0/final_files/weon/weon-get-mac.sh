#!/bin/bash

### Script to reverse get mac from IP connected
IP=$1

arp -a $IP | awk '{print $4}'
