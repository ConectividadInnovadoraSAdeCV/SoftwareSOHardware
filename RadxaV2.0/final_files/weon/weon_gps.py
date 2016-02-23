# Script Name: weon_gps.py
# Author: Antonio Herran
#
# Description: Reads gps and returns latitude and longitude using NMEA standard
#		Sanitizes to zero on garbage. 
#

import serial
import socket


def readgps():
	ser = serial.Serial('/dev/ttyS0', 9600, timeout=1)
	"""Read the GPG LINE using the NMEA standard"""
	latitude=''
	longitude=''
	while True:
		line = ser.readline()
		if "GPGGA" in line:
			latitude = line[18:26]
			longitude = line[31:39]
			if longitude[4] == 'M':			# Sanitize garbage
				latitude = '0000.0000'
				longitude = '0000.0000'
			return(latitude, longitude)

if __name__ == "__main__":
	output = readgps()
	print output
