#!/bin/bash 
# Script 2: FOSS Package Inspector 

# Variable defining the package we want to inspect
PACKAGE="vlc"   # e.g., httpd, mysql, vlc, firefox 

echo "Checking status for package: $PACKAGE..."
echo "----------------------------------------"

# Check if package is installed by suppressing standard output and errors
# dpkg -s is used for Debian/Ubuntu based systems. 
if dpkg -s "$PACKAGE" &>/dev/null; then 
    echo "[+] $PACKAGE is installed." 
    # Fetch details and pipe (|) into grep to filter only specific lines
    dpkg -l "$PACKAGE" | tail -n 1
else 
    echo "[-] $PACKAGE is NOT installed." 
fi 

echo "----------------------------------------"

# Case statement to match the package name and print a custom message
# This replaces multiple if-elif statements for cleaner code
case "$PACKAGE" in 
    httpd|apache2)  
        echo "Apache: the web server that built the open internet." 
        ;; 
    mysql)  
        echo "MySQL: open source at the heart of millions of apps." 
        ;; 
    vlc)
        echo "VLC: The traffic cone that plays absolutely any media format."
        ;;
    firefox)
        echo "Firefox: Championing a free, open, and private web browser."
        ;;
    git)
        echo "Git: Decentralizing version control and empowering collaboration."
        ;;
    *)
        # Default case if the package doesn't match the ones above
        echo "$PACKAGE: Another great tool in the open-source ecosystem."
        ;;
esac