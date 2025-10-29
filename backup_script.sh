#!/bin/bash

# Script to create a backup of a file with a random name
# Usage: ./backup_script.sh <source_file>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <source_file>"
    exit 1
fi

SOURCE_FILE="$1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: File '$SOURCE_FILE' does not exist."
    exit 1
fi

# Generate a random filename using timestamp and random number
RANDOM_NAME=$(date +%s%N)$(shuf -i 1000-9999 -n 1)
BACKUP_FILE="$RANDOM_NAME"

# Create the backup
cp "$SOURCE_FILE" "$BACKUP_FILE"

echo "Backup created: $BACKUP_FILE"