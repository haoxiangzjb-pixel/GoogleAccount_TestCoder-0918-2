#!/bin/bash

# Check if source directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <source_directory> [destination_directory]"
  echo "  destination_directory defaults to ./backups if not provided"
  exit 1
fi

SOURCE_DIR="$1"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Set destination directory, default to ./backups
DEST_DIR="${2:-./backups}"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create destination backup folder name
BACKUP_NAME="backup_$(basename "$SOURCE_DIR")_$TIMESTAMP"
DEST_PATH="$DEST_DIR/$BACKUP_NAME"

# Perform the copy using rsync for efficiency and robustness
echo "Backing up '$SOURCE_DIR' to '$DEST_PATH'..."
rsync -a "$SOURCE_DIR/" "$DEST_PATH/"

# Check if rsync was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully: $DEST_PATH"
else
  echo "Error: Backup failed during copy operation."
  exit 1
fi