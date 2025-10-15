#!/bin/bash

# Function to backup a directory to a timestamped folder
backup_directory() {
    local source_dir="$1"
    local dest_base="$2"
    
    # Check if source directory is provided
    if [ -z "$source_dir" ]; then
        echo "Usage: $0 <source_directory> [destination_base_directory]"
        echo "Example: $0 /path/to/source /path/to/backup/location"
        exit 1
    fi
    
    # Set default destination if not provided
    if [ -z "$dest_base" ]; then
        dest_base="./backups"
    fi
    
    # Validate source directory exists
    if [ ! -d "$source_dir" ]; then
        echo "Error: Source directory '$source_dir' does not exist."
        exit 1
    fi
    
    # Create destination directory if it doesn't exist
    mkdir -p "$dest_base"
    
    # Generate timestamp for backup folder
    timestamp=$(date +"%Y%m%d_%H%M%S")
    backup_folder="${dest_base}/backup_${timestamp}"
    
    # Create the backup folder
    mkdir -p "$backup_folder"
    
    # Perform the backup using rsync for efficiency
    echo "Backing up '$source_dir' to '$backup_folder'..."
    rsync -av --progress "$source_dir/" "$backup_folder/"
    
    echo "Backup completed successfully: $backup_folder"
}

# Call the function with provided arguments
backup_directory "$1" "$2"