import os
import random
import string
from datetime import datetime

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Create a random name with letters, numbers, and timestamp
    random_part = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"macro_{random_part}_{timestamp}.vba"
    return filename

def copy_macro_to_random_vba():
    """Copy the macro content to a randomly named .vba file"""
    # Read the macro content
    with open('/workspace/format_excel_macro.bas', 'r') as f:
        macro_content = f.read()
    
    # Generate random filename
    random_filename = generate_random_vba_filename()
    random_filepath = os.path.join('/workspace', random_filename)
    
    # Write the macro content to the random .vba file
    with open(random_filepath, 'w') as f:
        f.write(macro_content)
    
    print(f"VBA macro saved to: {random_filepath}")
    return random_filepath

if __name__ == "__main__":
    filepath = copy_macro_to_random_vba()
    print(f"Successfully created {filepath}")