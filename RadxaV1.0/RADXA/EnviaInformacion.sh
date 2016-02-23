#!/bin/bash
CAMION=$(head /etc/weon/CAMION)
PUNTO=I

enviar()
{
  sudo /etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k upload /etc/weon/$1 ArchivosBBB/Informacion/$CAMION.$1
  sudo rm /etc/weon/$1
}

#sube todos los archivos
enviar "InciosSesion.txt"
enviar "Registro.txt"
#se copia el log y ese es el que se manda
sudo /usr/local/squid/sbin/squid -k rotate
enviar "squid.log.0"

#elimina el syslog
#sudo rm /var/log/syslog
sudo dmesg --clear

#limpia el dhcp
sudo rm /var/lib/dhcp/dhcpd.leases
sudo service isc-dhcp-server restart
#sudo /bin/sh /etc/weon/iptables.sh
