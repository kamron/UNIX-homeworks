#!/bin/ksh

###############################################
#
# Project : FTP tear down
# Filename : umagic.sh
# Purpose : The purpose of this script is to perform magic!
#
# Usage : # /home/f30xx/umagic.sh
#
# Date created : April 9, 2012
# Date last modified : April 9, 2012
#
# Author : Adrian Perez
#
###############################################

# Stop the ftp service
inetadm -d ftp

# Allow us acces to delete this folder
chmod -R 777 /export/home/ftp

# Delete the user ftp as well as the home directory for that user
userdel -r ftp

#remove the modified copy and restore the backup copy
rm /etc/ftpd/ftpaccess
cp /etc/ftpd/ftpaccess.bak /etc/ftpd/ftpaccess
rm /etc/ftpd/ftpaccess.bak

# SHAZAM!
echo "SHAZAM!"
