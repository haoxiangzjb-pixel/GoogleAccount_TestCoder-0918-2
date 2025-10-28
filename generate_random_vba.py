import random
import string
import os
from pathlib import Path

def generate_random_filename(extension=".vba"):
    """Generate a random filename with the given extension"""
    # Generate a random string of 10 characters
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def copy_vba_macro():
    # Read the original VBA macro
    with open("/workspace/format_macro.vba", "r") as source_file:
        vba_content = source_file.read()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create the full path for the new file
    new_file_path = f"/workspace/{random_filename}"
    
    # Write the content to the new file
    with open(new_file_path, "w") as dest_file:
        dest_file.write(vba_content)
    
    print(f"VBA macro saved to: {new_file_path}")
    return new_file_path

if __name__ == "__main__":
    copy_vba_macro()