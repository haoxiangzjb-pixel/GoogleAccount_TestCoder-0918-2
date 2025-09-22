import random
import string
import os

# Function to generate a random file name
def generate_random_filename(length=8):
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return f"{random_name}.py"

# Read the template script
with open('/workspace/filter_script_template.py', 'r') as file:
    script_content = file.read()

# Generate a random filename
random_filename = generate_random_filename()
file_path = f"/workspace/{random_filename}"

# Write the content to the new file
with open(file_path, 'w') as file:
    file.write(script_content)

print(f"Script saved to {file_path}")

# Let's also run the script to demonstrate that it works
exec(script_content)