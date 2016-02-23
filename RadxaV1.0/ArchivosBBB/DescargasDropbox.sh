# /bin/bash

#iptables
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/iptables.sh
#sitio
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/LogSite.tar /var/www/LogSite.tar
#Demonio
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/Demonio.o
#squid
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/squid-3.3.10.tar.gz /etc/weon/squid-3.3.10.tar.gz
#cron
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/CronGps.sh
#gps
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/GpsClient.o
#envios de informacion
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/EnviaInformacion.sh
#sh del dhcp
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/InstalaDHCP.sh
#descarga rc.local
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/rc.local /etc/rc.local 
#sh de instalacion de PHP
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/InstalaPHP.sh
#descarga configurador de squid
Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/InstalaSQUID.sh
#descarga el batch para la BAM
Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/l100g.sh
#descarga el que diagnostica la red automaticamente
Dropbox-Uploader/dropbox_uploader.sh download ArchivosBBB/Autodiagnostico.sh

