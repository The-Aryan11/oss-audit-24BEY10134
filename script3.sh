#!/bin/bash 
# Script 3: Disk and Permission Auditor 

# Array containing a list of important system directories
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp") 

echo "Directory Audit Report" 
echo "----------------------" 

# Loop through each directory in the array
for DIR in "${DIRS[@]}"; do 
    # Check if the directory actually exists on the system
    if [ -d "$DIR" ]; then 
        # Extract permissions, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}') 
        # Get human-readable size, suppressing errors, and extracting the size column
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1) 
        echo "$DIR => Permissions/Owner: $PERMS | Size: $SIZE" 
    else 
        echo "$DIR does not exist on this system" 
    fi 
done 

echo "----------------------" 
echo "Specific Software Config Audit:"

# Check for a chosen software's config directory (e.g., Apache/httpd)
# We define the path and use an if statement to verify it
CONFIG_DIR="/etc/apache2" # Change to /etc/httpd or /etc/nginx depending on system

if [ -d "$CONFIG_DIR" ]; then
    # Fetch permissions for just this specific directory
    CONF_PERMS=$(ls -ld "$CONFIG_DIR" | awk '{print $1}')
    echo "[Found] $CONFIG_DIR exists."
    echo "Config Permissions: $CONF_PERMS"
else
    echo "[Missing] The configuration directory $CONFIG_DIR was not found."
fi