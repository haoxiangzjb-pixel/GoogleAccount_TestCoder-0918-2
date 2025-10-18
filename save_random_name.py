#!/usr/bin/env python3
"""
Script to save the REST API script to a randomly named .py file
"""

import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Read the content of the original script
    with open('/workspace/rest_api_script.py', 'r') as original_file:
        content = original_file.read()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the content to the new file with random name
    with open(f'/workspace/{random_filename}', 'w') as new_file:
        new_file.write(content)
    
    print(f"REST API script saved to: /workspace/{random_filename}")

if __name__ == "__main__":
    main()