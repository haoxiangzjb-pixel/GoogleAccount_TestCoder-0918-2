import os
import random
import string
from datetime import datetime

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Create a random name with timestamp for uniqueness
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    filename = f"macro_{random_string}_{timestamp}.vba"
    return filename

def save_vba_macro():
    """Read the VBA macro and save it to a randomly named .vba file"""
    # Read the original VBA macro content
    with open('format_excel_macro.vba', 'r') as original_file:
        vba_content = original_file.read()
    
    # Generate a random filename
    random_filename = generate_random_vba_filename()
    
    # Save the content to the new randomly named file
    with open(random_filename, 'w') as new_file:
        new_file.write(vba_content)
    
    print(f"VBA macro saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    save_vba_macro()