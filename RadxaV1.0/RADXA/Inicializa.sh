sh /etc/weon/iptables.sh
/etc/weon/Demonio.o & #el & corre el proceso en background
#/etc/weon/GpsClient.o & #el demonio del GPS
#/usr/local/squid/sbin/squid
#echo BB-UART1>> /sys/devices/bone_capemgr.9/slots
#/sbin/ifup gprs #esta linea carga la BAM
#/etc/weon/GpsClient.o & #el demonio del GPS, tenia problemas para iniciar antes que la BAM
ntpdate ntp.ubuntu.com #esta linea configura correctamente la hora
#------------------------------------------------------------------------------------------
exit 0
