import os
import random
import string
import shutil

def generate_random_filename(ext=".vba"):
    """Generate a random filename with the specified extension."""
    # Generate a random string of 10 characters
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}{ext}"

def create_random_vba_file():
    """Create a randomly named .vba file from the macro template."""
    # Read the original macro file
    with open('/workspace/format_excel_macro.bas', 'r') as f:
        macro_content = f.read()
    
    # Generate a random filename
    random_filename = generate_random_filename(".vba")
    
    # Write the content to the new randomly named file
    with open(f'/workspace/{random_filename}', 'w') as f:
        f.write(macro_content)
    
    print(f"Created randomly named VBA file: {random_filename}")
    return random_filename

if __name__ == "__main__":
    create_random_vba_file()