#!/bin/bash 
# Script 5: Open Source Manifesto Generator 

# Concept demonstration: Aliases. 
# An alias is a custom shortcut for a command. If a user wanted to run this 
# script easily in the future, they could add this to their ~/.bashrc:
# alias manifesto='~/scripts/script5.sh'

echo "=========================================="
echo " The Open Source Manifesto Generator"
echo "=========================================="
echo "Answer three short questions to generate your manifesto." 
echo "" 

# Using read -p to prompt the user and save their input to variables
read -p "1. Name one open-source tool you use every day: " TOOL 
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM 
read -p "3. Name one thing you would build and share freely: " BUILD 

# Getting the current date for the document header
DATE=$(date '+%d %B %Y') 
OUTPUT="manifesto_$(whoami).txt" 

# Composing the paragraph and writing it to the output file
# We use standard redirection (>) to overwrite/create the file with the header
echo "--- MY OPEN SOURCE MANIFESTO ---" > "$OUTPUT"
echo "Date: $DATE" >> "$OUTPUT"
echo "Author: $(whoami)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# We use append redirection (>>) to add the paragraph text to the bottom of the file
echo "Open source is not just about code; it is about community. Every day, I rely on tools like $TOOL to accomplish my goals. To me, the core of the open source movement is $FREEDOM. It represents the ability to study, modify, and improve the digital world around us. Because I have benefited so greatly from this community, my ultimate goal is to one day build a $BUILD and share it freely with the world, ensuring that the cycle of knowledge and collaboration continues for the next generation." >> "$OUTPUT"

echo "----------------------------------------"
echo "Success! Manifesto saved to $OUTPUT" 
echo "Here is what you wrote:"
echo "----------------------------------------"

# Displaying the contents of the newly created file to the user
cat "$OUTPUT"