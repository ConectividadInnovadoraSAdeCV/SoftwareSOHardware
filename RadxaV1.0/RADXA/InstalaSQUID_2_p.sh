#!bash
#ayuda a instalar en un paso squid
sudo scp jalvarez@192.168.1.251:/home/jalvarez/Radxa/Squid.tar . #
sudo tar xvf Squid.tar
cd squid-3.3.10
sudo make install
sudo /etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/squid.conf /usr/local/squid/etc/squid.conf
sudo /etc/weon/Dropbox-Uploader/dropbox_uploader.sh -k download ArchivosBBB/sysctl.conf /etc/sysctl.conf
sudo chmod 7777 -R /etc/weon
sudo chmod 7777 -R /usr/local/squid/var/logs/

