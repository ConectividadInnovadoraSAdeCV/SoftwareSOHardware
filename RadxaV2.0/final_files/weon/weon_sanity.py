# Script Name: weon_sanity.py
# Author: Antonio Herran 
#
# Description: WeON system sanity module. Checks for sanity of the components and takes action if needed
#
#

import os
import time
import subprocess
import syslog


#def check_connection():											# Check status of connection
#	cmd = subprocess.Popen('nmcli -t -f TYPE,STATE dev', shell=True, stdout=subprocess.PIPE)		# Not enabled in first version
#	output, err = cmd.communicate()
#	for line in output.splitlines():
#		if "gsm" in output:
#			if "disconnected" in line:
#				return False
#	else:
#		return True


def check_interface():
	cmd = subprocess.Popen('ifconfig -a', shell=True, stdout=subprocess.PIPE)
	output, err = cmd.communicate()
	for line in output.splitlines():
		if "ppp0" in line:
			return True
	else:
		return False

def check_nmapplet():
	pid = subprocess.Popen('pidof nm-applet', stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
	output, errors = pid.communicate()
	if not output:
		return False 
	else:
		return True

def enable_connection():
	print "bogus"
	#subprocess.Popen('/etc/weon/weon-connection.sh', shell=True, stdout=subprocess.PIPE)


def do_all_checks(checker):
	#checker['connection']=check_connection()  								# Not implemented in first version
	checker['nmapplet']=check_nmapplet()
	checker['interface']=check_interface()
	return checker

def do_sanity(checker):
#	if checker['bam'] == False:
#		subprocess.Popen('reboot', shell=True)
	if checker['nmapplet'] == False:
		subprocess.Popen('/etc/weon/weon-nmapplet.sh', shell=True)
	time.sleep(5)
	checker['interface'] = check_interface()
	if checker['interface'] == False:
		subprocess.Popen('reboot', shell=True)


if __name__ == "__main__":	
	checker = {}
	do_all_checks(checker)
	print checker
