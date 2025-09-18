import random
import string
import os

def generate_random_name(length=8):
    """Generate a random string of specified length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def rename_vba_file():
    # Original file name
    original_name = "format_sheet_macro.vba"
    
    # Generate a random name
    random_name = generate_random_name()
    new_name = f"{random_name}.vba"
    
    # Rename the file
    os.rename(original_name, new_name)
    print(f"File renamed from {original_name} to {new_name}")

if __name__ == "__main__":
    rename_vba_file()