# Script Name: weon_databaser.py
# Author: Antonio Herran
#
# Description: WeON module for collecting data and connecting to databases. 
#		Opens weon and radmin databases
#
#
	
import weon_conf
import weon_gps
import weon_connections
import mysql.connector
import os
import sys
import datetime


class Weondb:					# Class for connecting to weonDB
	
	def __init__(self):
		self.camion = int(weon_conf.parse_config('/etc/weon/weon.conf')['no_camion'])
		self.latitude, self.longitude = weon_gps.readgps()
		self.connections = weon_connections.conns()
		self.dbconn = self.connect_db()
		
	
	def close(self):			# Close connection
		self.dbconn.close()

	def connect_db(self):
		db = mysql.connector.connect( user='weon', password='WeonDB', host='127.0.0.1', database='weon')	# Open Connections
		return db
	
	def return_data(self):
		self.latitude, self.longitude = weon_gps.readgps()
		self.connections = weon_connections.conns()
		list = [self.camion, self.latitude, self.longitude, self.connections]
		return list

	def insert_record(self):
		self.close()
		self.dbconn = self.connect_db()
		cur = self.dbconn.cursor()
		cur.execute("INSERT INTO gps(camion,latitud,longitud,conectados) VALUES(%s, %s, %s, %s)", (self.camion, self.latitude, self.longitude, self.connections, ))
		self.dbconn.commit()




class Radmindb:				# Class for connecting to radminDB
	
	def __init__(self):
		self.eth = 'a:7:{s:12:"lanipaddress";s:11:"192.168.2.1";s:11:"networkmask";s:13:"255.255.255.0";s:20:"opendnsbogusnxdomain";b:0;s:5:"lanif";s:4:"eth0";s:5:"wanif";s:4:"ppp0";s:10:"dnsservers";a:2:{i:0;s:11:"10.34.44.36";i:1;s:13:"10.182.29.164";}s:7:"bogusnx";a:0:{}}'

		self.wlan = 'a:7:{s:12:"lanipaddress";s:11:"192.168.2.1";s:11:"networkmask";s:13:"255.255.255.0";s:20:"opendnsbogusnxdomain";b:0;s:5:"lanif";s:4:"wlan0";s:5:"wanif";s:4:"ppp0";s:10:"dnsservers";a:2:{i:0;s:11:"10.34.44.36";i:1;s:13:"10.182.29.164";}s:7:"bogusnx";a:0:{}}'


		self.dbconn = self.connect_db()
	
	def close(self):
		self.dbconn.close()

	def connect_db(self):
		db = mysql.connector.connect( user='radmin', password='portal', host='127.0.0.1', database='radmin')
		return db

	
if __name__ == "__main__":
	wdb = weondb()
	print wdb.latitude, wdb.longitude
	print wdb.camion
	print wdb.connections
	wdb.close()
