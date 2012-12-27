#!/bin/ksh

###############################################
#
# Project : FTP set up
# Filename : magic.sh
# Purpose : The purpose of this script is to perform magic!
#
# Usage : # /home/f30xx/magic.sh
#
# Date created : April 9, 2012
# Date last modified : April 9, 2012
#
# Author : Adrian Perez
#
###############################################

# Note: /bin/true always returns true
echo "ftp:x:123:1:Anonymous FTP:/export/home/ftp:/bin/true" >> /etc/passwd

# Create a home directory for this new user
mkdir /export/home/ftp

# Sync with the shadow file!
pwconv

# Change ownership and user permissions
chown -R root:other /export/home/ftp
chmod 555 /export/home/ftp

# Create a public folder in which files are stored
mkdir /export/home/ftp/pub

# Change permissions!
chmod 777 /export/home/ftp/pub

cp /etc/ftpd/ftpaccess /etc/ftpd/ftpaccess.bak
echo "upload /export/home/ftp /pub yes ftp other 0600 nodirs" >> /etc/ftpd/ftpaccess

inetadm -e ftp

