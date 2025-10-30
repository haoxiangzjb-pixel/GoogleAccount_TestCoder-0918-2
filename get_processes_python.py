#!/usr/bin/env python3
"""
Python script to get list of processes and save to a file with random name
"""

import psutil
import random
import string
from datetime import datetime

def generate_random_filename(extension=".txt"):
    """Generate a random filename with the given extension"""
    random_part = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    return f"processes_{timestamp}_{random_part}{extension}"

def get_processes_and_save():
    """Get list of processes and save to a file with random name"""
    # Generate random filename
    filename = generate_random_filename()
    
    # Get list of processes
    processes = []
    for proc in psutil.process_iter(['pid', 'name', 'username', 'status']):
        try:
            processes.append(proc.info)
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            # Handle cases where process disappears or access is denied
            pass
    
    # Sort processes by PID
    processes.sort(key=lambda x: x['pid'])
    
    # Write to file
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(f"Process List - Generated at {datetime.now()}\n")
        f.write("="*50 + "\n")
        for proc in processes:
            f.write(f"PID: {proc['pid']:<8} | Name: {proc['name']:<25} | User: {proc['username'] or 'N/A':<15} | Status: {proc['status']}\n")
    
    print(f"Process list saved to: {filename}")

if __name__ == "__main__":
    get_processes_and_save()