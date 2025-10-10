import cv2
import numpy as np
import os
import random
import string

# Load an image from file
# Using a placeholder path; you would replace this with the path to your image
image_path = '/workspace/placeholder_image.jpg' # This path might not exist, see comments below
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}. Using a blank image instead.")
    # Create a blank black image if loading fails
    image = np.zeros((300, 300, 3), dtype=np.uint8)
else:
    print(f"Image loaded successfully from {image_path} with shape {image.shape}.")

# Define the content of the script to be saved
script_content = f'''import cv2
import numpy as np

# This script was generated automatically.
# It loads an image and creates a blank image if the file is not found.

image_path = '{image_path}'
image = cv2.imread(image_path)

if image is None:
    print("Loaded image was None, creating a blank image.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
else:
    print(f"Loaded image successfully. Shape: {{image.shape}}")

# The image array 'image' now contains the pixel data.
# You can perform operations on it here.
'''

# Generate a random filename
def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

random_filename = generate_random_filename()
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"New script saved to {random_filename}")
