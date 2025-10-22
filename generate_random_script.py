#!/usr/bin/env python3
"""
Script to copy the REST API script to a new file with a random name
"""

import os
import random
import string
import shutil

def generate_random_filename():
    """Generate a random Python filename"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Source file
    source_file = "/workspace/rest_api_script.py"
    
    # Generate random filename
    random_filename = generate_random_filename()
    destination_file = f"/workspace/{random_filename}"
    
    # Copy the file
    shutil.copy2(source_file, destination_file)
    
    print(f"Copied REST API script to randomly named file: {destination_file}")

if __name__ == "__main__":
    main()