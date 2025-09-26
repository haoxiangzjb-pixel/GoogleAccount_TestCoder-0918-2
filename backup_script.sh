#!/bin/bash

# Script to create a backup of a file with a random name

if [ $# -ne 1 ]; then
  echo "Usage: $0 <file_to_backup>"
  exit 1
fi

file_to_backup="$1"

if [ ! -f "$file_to_backup" ]; then
  echo "Error: File '$file_to_backup' does not exist."
  exit 1
fi

# Generate a random filename for the backup
random_name=$(mktemp --suffix=.bak)

# Copy the original file to the random filename
cp "$file_to_backup" "$random_name"

echo "Backup of '$file_to_backup' created as '$random_name'"