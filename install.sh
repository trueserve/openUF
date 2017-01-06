#!/bin/sh
# openUF Installer
#
# Temporary install script until packages are made
# to install openUF on writable flash of a device.
#

case "$1" in
	install)
		;;
	uninstall)
		;;
	*)
		echo -e "\nusage: $0 <install/uninstall>"
		echo ""
		echo " * Installs openUF by:"
		echo "   - Moving files to /opt/openuf"
		echo "   - Creating symlinks to scripts used for L2 adoption in /usr/bin"
		echo ""
		echo " * Uninstall is the reverse of install."
		echo ""		
		;;
esac