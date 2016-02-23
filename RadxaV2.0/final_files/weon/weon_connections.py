# Script file: weon_connections.py
# Author: Antonio Herran
#
# Description: WeON module for counting connections open.
#               
#
#

import weon_databaser
import mysql.connector
import os
import sys

def connect_db():
        db = mysql.connector.connect( user='radius', password='radius', host='127.0.0.1', database='radius')        # Open Connections
        return db

def conns():
	w = connect_db()
	cur = w.cursor()
	cur.execute("SELECT CallingStationId FROM radacct WHERE AcctStopTime IS NULL")
	data = cur.fetchall()
	conns = len(data)
	if data[0] == (u'00-00-00-00-00-00',):
		conns = 0
	w.close()
	return conns
