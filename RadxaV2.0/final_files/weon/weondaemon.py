# Script Name: weondaemon.py
# Author: Antonio Herran 
#
# Description: WeON system daemon. Checks for sanity of the system and keeps system up
#
#

import logging 				#Standard Python lib
import time
import datetime
import ConfigParser
import subprocess
import mysql.connector
from daemon import runner

import weon_sanity 	 		#WeON libs
import weon_databaser
import weon_conf
import weon_gps
import weon_connections

class App():
    
    def __init__(self):
        self.stdin_path = '/dev/null' 						# Redirect console output to log files
        self.stdout_path = '/var/log/weon/system.log'				#
        self.stderr_path = '/var/log/weon/system.log'				#
        self.pidfile_path =  '/var/run/weondaemon/weondaemon.pid'		
        self.pidfile_timeout = 5
	self.config = ConfigParser.ConfigParser()
	self.config.read('/etc/weon/weon.conf')
	self.checker = {}												# WeON Variables - List for sanity checks
	self.connection = 0												# WeON Variable -
	self.sleep_time = int(weon_conf.parse_config('/etc/weon/weon.conf')['sleep_time'])				# WeON Variable -
	self.start_delay = int(weon_conf.parse_config('/etc/weon/weon.conf')['start_delay'])				#

    def run(self):								# Main module 
	logger.debug(self.config.sections())
	logger.debug('[WeON Daemon start]')
	self.startup()
	time.sleep(20)
        while True: 							        # Main code loop
	    self.sanity_check()							# Sanity Checker
#	    weon_sanity.do_sanity(self.checker)
	    self.insert_db()
            time.sleep(self.sleep_time)

    def startup(self):							
	"""Do at load functions """
	self.nmapplet()
	time.sleep(10)
	logger.debug('[nm-applet started]')
	if self.config.get('Interfaces', 'lan') == 'eth0':
		self.start_eth()
		logger.debug('[Interface up eth0]')
	if self.config.get('Interfaces', 'lan') == 'wlan0':
		self.start_wlan()
		logger.debug('[Interface up wlan0]')
	time.sleep(self.start_delay)
	self.tcpdump()								# Workaround for iptables (without this, Grase doesn't open ports)
	logger.debug('[tcpdump started]')

    def tcpdump(self):
	subprocess.Popen('/etc/weon/weon-start.sh start-tcpdump', shell=True)


    def start_wlan(self):
	subprocess.Popen('/etc/weon/weon-start.sh start-wlan', shell=True)
	subprocess.Popen('/usr/share/grase/scripts/update_grase_networksettings.sh', shell=True) 

    def start_eth(self):
	subprocess.Popen('/etc/weon/weon-start start-eth', shell=True)
	subprocess.Popen('/usr/share/grase/scripts/update_grase_networksettings.sh', shell=True)

    def nmapplet(self):
	subprocess.Popen('/etc/weon/weon-nmapplet.sh', shell=True)
		
    def sanity_check(self):
	logger.info("Sanity check")
	weon_sanity.do_all_checks(self.checker)
	logger.info(self.checker)

    def insert_db(self):
	self.weondb =  mysql.connector.connect( user='weon', password='WeonDB', host='127.0.0.1', database='weon')      # Open Connections	
	self.cursor = self.weondb.cursor()
	camion = int(weon_conf.parse_config('/etc/weon/weon.conf')['no_camion'])
	self.latitude, self.longitude = weon_gps.readgps() 
	connections = weon_connections.conns()
	self.cursor.execute("INSERT INTO gps(camion,latitud,longitud,conectados) VALUES(%s, %s, %s, %s)", (camion, self.latitude, self.longitude, connections, ))
        self.weondb.commit()



app = App()
logger = logging.getLogger("WeON Daemon")
logger.setLevel(logging.DEBUG)
formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
handler = logging.FileHandler("/var/log/weon/daemon.log")
handler.setFormatter(formatter)
logger.addHandler(handler)

daemon_runner = runner.DaemonRunner(app)
#This ensures that the logger file handle does not get closed during daemonization
daemon_runner.daemon_context.files_preserve=[handler.stream]
daemon_runner.do_action()

