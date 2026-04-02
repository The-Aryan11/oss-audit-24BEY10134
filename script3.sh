#!/bin/bash 
# Script 3: Disk and Permission Auditor 

# Array containing a list of important system directories
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp") 

echo "Directory Audit Report" 
echo "----------------------" 

for DIR in "${DIRS[@]}"; do 
    if [ -d "$DIR" ]; then 
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}') 
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1) 
        echo "$DIR => Permissions/Owner: $PERMS | Size: $SIZE" 
    else 
        echo "$DIR does not exist on this system" 
    fi 
done 

echo "----------------------" 
echo "Specific Software Config Audit:"

# Check for Git's core data directory
CONFIG_DIR="/usr/share/git-core" 

if [ -d "$CONFIG_DIR" ]; then
    CONF_PERMS=$(ls -ld "$CONFIG_DIR" | awk '{print $1}')
    echo "[Found] Git core directory $CONFIG_DIR exists."
    echo "Directory Permissions: $CONF_PERMS"
else
    echo "[Missing] The Git core directory $CONFIG_DIR was not found."
fi