#!/bin/bash 
# Script 1: System Identity Report 
# Author: Aryan Ranjan (24BEY10134) | Course: Open Source Software 

# --- Variables --- 
STUDENT_NAME="Aryan Ranjan"         
SOFTWARE_CHOICE="Git"      

# --- System info --- 
KERNEL=$(uname -r) 
USER_NAME=$(whoami) 
HOME_DIR=$HOME
UPTIME=$(uptime -p) 
DATE_TIME=$(date '+%Y-%m-%d %H:%M:%S')

# Extracting the distribution name from the os-release file
DISTRO=$(cat /etc/os-release | grep '^PRETTY_NAME=' | cut -d'"' -f2)

# --- Display --- 
echo "==================================================" 
echo "  Open Source Audit — $STUDENT_NAME" 
echo "==================================================" 
echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL" 
echo "User         : $USER_NAME" 
echo "Home Dir     : $HOME_DIR"
echo "Uptime       : $UPTIME" 
echo "Date/Time    : $DATE_TIME"
echo "==================================================" 
echo "Software     : $SOFTWARE_CHOICE"
echo "License Info : This operating system is powered by the Linux kernel,"
echo "               which is distributed under the GNU General Public"
echo "               License (GPL) version 2. It guarantees freedom"
echo "               to run, study, share, and modify the software."
echo "=================================================="