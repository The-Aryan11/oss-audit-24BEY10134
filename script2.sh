#!/bin/bash 
# Script 2: FOSS Package Inspector 

# Variable defining Git as the package
PACKAGE="git"

echo "Checking status for package: $PACKAGE..."
echo "----------------------------------------"

# Check if package is installed (using dpkg for Debian/Ubuntu environments like WSL/Git Bash)
if dpkg -s "$PACKAGE" &>/dev/null; then 
    echo "[+] $PACKAGE is installed." 
    # Fetch details and filter specific lines
    dpkg -l "$PACKAGE" | tail -n 1
else 
    echo "[-] $PACKAGE is NOT installed." 
fi 

echo "----------------------------------------"

# Case statement to match the package name
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
    git)
        echo "Git: Decentralizing version control and empowering developers to collaborate freely."
        ;;
    *)
        echo "$PACKAGE: Another great tool in the open-source ecosystem."
        ;;
esac