#!/bin/bash 
# Script 4: Log File Analyzer 
# Usage: ./script4.sh /var/log/syslog error 

# Assigning command line arguments to variables
LOGFILE=$1 
KEYWORD=${2:-"error"}    # Default keyword is 'error' if a second argument isn't provided
COUNT=0 

# Do-while style retry loop. 
# In bash, we use a while loop to keep prompting the user as long as 
# the file does not exist (! -f) or is empty (! -s).
while [ ! -f "$LOGFILE" ] || [ ! -s "$LOGFILE" ]; do
    echo "Error: File '$LOGFILE' not found or is empty."
    read -p "Please enter a valid path to a log file: " LOGFILE
done

echo "Analyzing $LOGFILE for keyword: '$KEYWORD'..."

# While-read loop to process the file line by line safely
while IFS= read -r LINE; do 
    # Check if the line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then 
        COUNT=$((COUNT + 1))  # Increment the counter
    fi 
done < "$LOGFILE" 

# Print the final count summary
echo "----------------------------------------"
echo "SUMMARY: Keyword '$KEYWORD' found $COUNT times in $LOGFILE" 
echo "----------------------------------------"

# Print the last 5 matching lines using grep and tail
echo "Last 5 occurrences of the keyword in the log:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5