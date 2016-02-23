#!/bin/bash

# Script Name: weon-start.sh
# Author: Antonio Herran
#
# Description: WeON services caller script. 
#		Calls WeON daemon, 
#		hostapd. Logs calls
#         


LOG_DIR=/var/log/weon 					# Logging files location
SYSTEM_LOG_FILE=system.log				# Log for systems started
HOSTAPD_LOG_FILE=hostapd.log				# Log for HostAPD output
TCPDUMP_LOG_FILE=tcpdump.log				# Log for tcpdump output
SYSTEM_LOG_PATH=$LOG_DIR/$SYSTEM_LOG_FILE		# Full filename for system
HOSTAPD_LOG_PATH=$LOG_DIR/$HOSTAPD_LOG_FILE		# Full filename for hostapd
TCPDUMP_LOG_PATH=$LOG_DIR/$TCPDUMP_LOG_FILE		# Full filename for tcpdump
HOTSPOT_NAME=`grep essid /etc/weon/weon.conf | sed -r 's/essid=//'`

start_from_init(){				# Create directories and save old logs

if [ ! -d /var/log/weon ]; then		        
	mkdir /var/log/weon
fi

if [ ! -d /var/run/weondaemon ]; then	
	mkdir /var/run/weondaemon
fi

for i in $(ls $LOG_DIR/*.log); do
	if [ -f $i ]; then
        	mv $i $i.old
	fi
done

sed -i "s/^essid=.*$/essid=$HOTSPOT_NAME/" /etc/hotspot/hotspot.conf

echo "[WeON system log] Start of file" > $SYSTEM_LOG_PATH
echo "[Hostapd log] Start of file" > $HOSTAPD_LOG_PATH
echo "[tcpdump log] Start of file" > $TCPDUMP_LOG_PATH
}

stop_from_init() {					#Stop function -placeholder-
echo "[End of session]" >> $SYSTEM_LOG_PATH
}

log_sys(){						# Routes console output to systemlog
exec >> $SYSTEM_LOG_PATH 2>&1
set -x
}

log_host(){						# Routes console output to hostapd.log
exec >> $HOSTAPD_LOG_PATH 2>&1
set -x
}


log_tcpdump(){						# Routes console output to tcpdump.log
exec >> $TCPDUMP_LOG_PATH 2>&1
set -x
}


start_wlan() {						# Ensure interfaces files are in place
	log_sys
	rm /etc/network/interfaces
	cp /etc/weon/backupfiles/wlan0 /etc/network/interfaces
	ifdown wlan0
	ifup wlan0
}

start_eth() {						# Ensure interfaces files are in place
	log_sys
	rm /etc/network/interfaces 
	cp /etc/weon/backupfiles/eth0 /etc/network/interfaces
	ifdown eth0
	ifup eth0
}

start_hostapd() {					#Start HostAPD in the background
	log_host
	pidof hostapd
	if [ $? -ne 0 ]
	then
		exec nohup hostapd -B -dd /etc/hostapd/hostapd.conf &
	fi
}

stop_hostapd() {					#Stop HostAPD
	log_host
	HAPD = pidof hostapd
	kill `pidof hostapd`
	echo "[HostAPD Killed PID $HAPD]"
}

start_tcpdump() {					# Start tcpdump
	log_tcpdump
	echo "[tcpdump Start]"
	exec nohup tcpdump &
}

start_pppd() {
	log_sys
	exec nohup /usr/sbin/pppd nodetach lock nodefaultroute ipv6 , user webgprs ttyUSB1 noipdefault noauth usepeerdns lcp-echo-failure 5 lcp-echo-interval 30 idle 0 ipparam /org/freedesktop/NetworkManager/PPP/0 plugin /usr/lib/pppd/2.4.6/nm-pppd-plugin.so &
}


start_weondaemon() {					#Start daemon
	log_sys
	echo "[Starting WeON Python Daemon]"
	exec python /etc/weon/weondaemon.py start	
}

stop_weondaemon() {					#Stop daemon
        log_sys
        echo "[Stopping WeON Python Daemon]"
        exec python /etc/weon/weondaemon.py stop
}

### Cases of script

case "$1" in	
	init-start)
		start_from_init
		start_weondaemon
		;;
	start-daemon)
		start_weondaemon
		;;
	stop-daemon)
		stop_weondaemon
		;;
	start-wlan)
		start_wlan
		start_hostapd
		;;
	start-eth)
		start_eth
		;;
	start-pppd)
		start_pppd
		;;
        start-hostapd)
                start_hostapd		
                ;;
	stop-hostapd)
		stop_hostapd
		;;
	start-tcpdump)
		start_tcpdump
		;;
        *)
                echo "Usage: $0 {init-start|start-daemon|stop-daemon|start-hostapd|stop-hostapd}"
                exit 1
                ;;
esac

