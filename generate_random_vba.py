import os
import random
import string
from datetime import datetime

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Create a random string for the filename
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    return f"macro_{random_string}_{timestamp}.vba"

def main():
    # Read the VBA macro content
    with open('/workspace/format_excel_macro.bas', 'r') as f:
        macro_content = f.read()
    
    # Generate a random .vba filename
    random_filename = generate_random_vba_filename()
    random_filepath = f'/workspace/{random_filename}'
    
    # Write the macro content to the randomly named .vba file
    with open(random_filepath, 'w') as f:
        f.write(macro_content)
    
    print(f"VBA macro saved to: {random_filepath}")
    return random_filepath

if __name__ == "__main__":
    main()