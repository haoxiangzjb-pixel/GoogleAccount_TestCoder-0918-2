import random
import string
import os
from datetime import datetime

def generate_random_vba_filename():
    # Generate a random string of 10 characters
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    
    # Create the filename with .vba extension
    filename = f"format_macro_{random_string}.vba"
    
    return filename

def main():
    # Read the VBA macro template
    with open('/workspace/format_macro_template.vba', 'r') as f:
        vba_content = f.read()
    
    # Generate random filename
    random_filename = generate_random_vba_filename()
    random_filepath = f'/workspace/{random_filename}'
    
    # Write the VBA content to the randomly named file
    with open(random_filepath, 'w') as f:
        f.write(vba_content)
    
    print(f"VBA macro saved to: {random_filepath}")
    return random_filepath

if __name__ == "__main__":
    main()