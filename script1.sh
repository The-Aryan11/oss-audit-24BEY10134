#!/bin/bash 
# Script 1: System Identity Report 
# Author: [Your Name] | Course: Open Source Software 

# --- Variables --- 
# Defining standard variables for the user and chosen software
STUDENT_NAME="Student"         
SOFTWARE_CHOICE="VLC Media Player"      

# --- System info --- 
# Using command substitution $() to execute commands and store their output in variables
KERNEL=$(uname -r) 
USER_NAME=$(whoami) 
HOME_DIR=$HOME
UPTIME=$(uptime -p) 
DATE_TIME=$(date '+%Y-%m-%d %H:%M:%S')

# Extracting the distribution name from the os-release file
# We use grep to find the specific line and cut to remove the quotes
DISTRO=$(cat /etc/os-release | grep '^PRETTY_NAME=' | cut -d'"' -f2)

# --- Display --- 
# Using echo to format and print the output to the terminal
echo "==================================================" 
echo "  Open Source Audit — $Aryan_Ranjan" 
echo "==================================================" 
echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL" 
echo "User         : $USER_NAME" 
echo "Home Dir     : $HOME_DIR"
echo "Uptime       : $UPTIME" 
echo "Date/Time    : $DATE_TIME"
echo "==================================================" 
echo "License Info : This operating system is powered by the Linux kernel,"
echo "               which is distributed under the GNU General Public"
echo "               License (GPL) version 2. It guarantees your freedom"
echo "               to run, study, share, and modify the software."
echo "=================================================="