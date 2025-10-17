import random
import string
import os

def generate_random_filename():
    """Generate a random Python filename."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return random_name + '.py'

# Read the content of the original OpenCV script
with open('/workspace/opencv_script.py', 'r') as original_file:
    script_content = original_file.read()

# Generate a random filename
random_filename = generate_random_filename()

# Write the content to the new file with random name
with open(random_filename, 'w') as new_file:
    new_file.write(script_content)

print(f"OpenCV script saved to randomly named file: {random_filename}")