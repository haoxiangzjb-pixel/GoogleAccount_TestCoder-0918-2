#!/bin/bash

# Function to create a timestamped backup
backup_directory() {
    local source_dir="$1"
    local dest_base="$2"
    
    # Check if source directory is provided
    if [ -z "$source_dir" ]; then
        echo "Usage: $0 <source_directory> [destination_base_directory]"
        echo "Example: $0 /path/to/source /path/to/backups"
        exit 1
    fi
    
    # Set default destination if not provided
    if [ -z "$dest_base" ]; then
        dest_base="./backups"
    fi
    
    # Create destination directory if it doesn't exist
    mkdir -p "$dest_base"
    
    # Generate timestamp
    timestamp=$(date +"%Y%m%d_%H%M%S")
    
    # Create backup folder name
    backup_folder="${dest_base}/backup_${timestamp}"
    
    # Create the backup directory
    mkdir -p "$backup_folder"
    
    # Perform the backup using rsync for efficiency
    echo "Backing up '$source_dir' to '$backup_folder'..."
    rsync -av --exclude='backups' "$source_dir/" "$backup_folder/" 2>/dev/null
    
    # Alternative using cp if rsync is not available
    if [ $? -ne 0 ]; then
        echo "rsync failed, trying with cp..."
        cp -r "$source_dir"/* "$backup_folder/" 2>/dev/null
    fi
    
    echo "Backup completed: $backup_folder"
}

# Call the function with command line arguments
backup_directory "$1" "$2"