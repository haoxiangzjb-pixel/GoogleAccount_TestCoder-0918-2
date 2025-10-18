import os
import random
import string
import shutil

def generate_random_filename(ext=".vba"):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}{ext}"

def copy_macro_to_random_file():
    """Copy the existing macro file to a randomly named .vba file."""
    source_file = "format_excel_macro.vba"
    random_filename = generate_random_filename()
    
    # Copy the file with the random name
    shutil.copy(source_file, random_filename)
    
    print(f"VBA macro copied to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    if os.path.exists("format_excel_macro.vba"):
        random_vba_file = copy_macro_to_random_file()
        print(f"Successfully created randomly named VBA file: {random_vba_file}")
    else:
        print("Error: format_excel_macro.vba not found!")