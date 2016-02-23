# /bin/bash
#preparo las descargas 
sudo mkdir /var/www
sudo chmod 7777 -R /var/www

#iptables
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/iptables.sh
#sitio
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/LogSite.tar /var/www/LogSite.tar
#Demonio
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/Demonio.o
#squid
#/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/squid-3.3.10.tar.gz /etc/weon/squid-3.3.10.tar.gz
#cron
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/CronGps.sh
#gps
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/GpsClient.o
#envios de informacion
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/EnviaInformacion.sh
#sh del dhcp
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/InstalaDHCP.sh
#descarga rc.local
#/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/RADXA/rc.local rc.local 
#sh de instalacion de PHP
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/InstalaPHP.sh
#descarga configurador de squid
#Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/InstalaSQUID.sh
Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/InstalaSquid_2.sh
#descarga el batch para la BAM
Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/l100g.sh
#descarga el que diagnostica la red automaticamente
Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/Autodiagnostico.sh
#descarga el archivo del horario para mexico
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/General /usr/share/zoneinfo/localtime
#listdo de servicios por arrancar
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/ArrancaServicios.sh

#descargo y compilo el arrancador de servicios
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/RADXA/ServiceStart.cpp
g++ ServiceStart.cpp -o ServiceStart.o

#coloco los nuevos permisos
sudo chmod 7777 -R  /etc/weon/
