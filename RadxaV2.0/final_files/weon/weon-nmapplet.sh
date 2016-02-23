#!/bin/bash
while [ ! `pidof nm-applet` ]; do
#		systemctl restart NetworkManager
#	sleep 5
	sudo -u rock DISPLAY=:0 nm-applet &
	sleep 15
	sudo ntpdate -b -u pool.ntp.org
done
