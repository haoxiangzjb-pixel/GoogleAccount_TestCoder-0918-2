#!/bin/bash

# Check if source directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <source_directory> [destination_directory]"
  exit 1
fi

SOURCE_DIR="$1"
DEST_DIR="${2:-./backups}" # Default to ./backups if not specified

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create destination backup folder name
BACKUP_NAME="backup_$TIMESTAMP"
DEST_PATH="$DEST_DIR/$BACKUP_NAME"

# Create the backup directory
mkdir -p "$DEST_PATH"

# Perform the copy using rsync for efficiency and robustness
# rsync is preferred for its options and handling of various file types
if command -v rsync &> /dev/null; then
    rsync -a "$SOURCE_DIR/" "$DEST_PATH/"
else
    # Fallback to cp if rsync is not available
    cp -r "$SOURCE_DIR" "$DEST_PATH/"
fi

echo "Backup of '$SOURCE_DIR' completed successfully to '$DEST_PATH'."
