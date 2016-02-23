#! Script para arrancar todos los servicios
sudo /sbin/ifup gprs
sudo /bin/sh /etc/weon/iptables.sh
sudo ntpdate ntp.ubuntu.com
sudo /etc/weon/Demonio.o & #el & corre el proceso en background
sudo /etc/weon/GpsClient.o &#arranca el servicio de gps
sudo /usr/local/squid/sbin/squid &
