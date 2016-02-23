#remplaza el paso 10 del 5.0.0
#descomprime
tar xvf squid-3.3.10.tar.gz
#entr a squid
cd squid-3.3.10
#configurar squid
./configure --enable-eui
#compliar squid
make all
#instalar squid
make install
#Descarga Squid conf: 
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/squid.conf /usr/local/squid/etc/squid.conf
# hacer transparente
/etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/sysctl.conf /etc/sysctl.conf 

#permisos y apagado
sudo chmod 7777 -R /etc/weon
sudo chmod 7777 -R /usr/local/squid/var/logs/
sudo poweroff -h now
