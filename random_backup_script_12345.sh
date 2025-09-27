#!/bin/bash

# Check if source directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <source_directory> [destination_directory]"
  echo "  source_directory: The directory to backup (required)"
  echo "  destination_directory: The directory to store the backup (optional, defaults to current directory)"
  exit 1
fi

SOURCE_DIR="$1"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Set destination directory, default to current directory if not provided
DEST_DIR="${2:-.}"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create destination folder name with timestamp
BACKUP_DIR="$DEST_DIR/backup_$(basename "$SOURCE_DIR")_$TIMESTAMP"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Copy the contents of the source directory to the backup directory
cp -r "$SOURCE_DIR"/* "$BACKUP_DIR/"

# Check if the copy was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully!"
  echo "Source: $SOURCE_DIR"
  echo "Destination: $BACKUP_DIR"
else
  echo "Error: Backup failed during the copy process."
  exit 1
fi