#!/bin/bash

# Function to create a backup of a directory to a timestamped folder
backup_directory() {
    local source_dir="$1"
    local dest_base_dir="${2:-./backups}"
    
    # Check if source directory is provided
    if [ -z "$source_dir" ]; then
        echo "Usage: backup_directory <source_directory> [destination_base_directory]"
        echo "Example: backup_directory /path/to/source ./backups"
        exit 1
    fi
    
    # Check if source directory exists
    if [ ! -d "$source_dir" ]; then
        echo "Error: Source directory '$source_dir' does not exist."
        exit 1
    fi
    
    # Create destination base directory if it doesn't exist
    mkdir -p "$dest_base_dir"
    
    # Generate timestamp for the backup folder
    timestamp=$(date +"%Y%m%d_%H%M%S")
    backup_dir="${dest_base_dir}/backup_${timestamp}"
    
    # Create the backup directory
    mkdir -p "$backup_dir"
    
    # Perform the backup using rsync for efficiency
    echo "Backing up '$source_dir' to '$backup_dir'..."
    rsync -av --exclude='.DS_Store' "$source_dir/" "$backup_dir/"
    
    echo "Backup completed successfully!"
    echo "Backup location: $backup_dir"
}

# Call the function with command line arguments
backup_directory "$1" "$2"