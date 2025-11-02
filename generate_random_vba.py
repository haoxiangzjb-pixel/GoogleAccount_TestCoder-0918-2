import os
import random
import string
import shutil

def generate_random_filename(extension=".vba"):
    """Generate a random filename with the specified extension."""
    # Generate a random string of 10 characters
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return random_name + extension

def create_random_vba_file(source_file, destination_dir="."):
    """Create a copy of the source VBA file with a random name."""
    random_filename = generate_random_filename()
    destination_path = os.path.join(destination_dir, random_filename)
    
    # Copy the source file to the destination with the random name
    shutil.copy2(source_file, destination_path)
    return destination_path

# Source file containing the VBA macro
source_file = "format_excel_macro.vba"

# Create 5 randomly named .vba files as examples
print("Creating randomly named .vba files:")
for i in range(5):
    random_file_path = create_random_vba_file(source_file)
    print(f"Created: {random_file_path}")

print("\nAll randomly named .vba files in the workspace:")
for file in os.listdir("."):
    if file.endswith(".vba") and file != source_file:
        print(f"- {file}")