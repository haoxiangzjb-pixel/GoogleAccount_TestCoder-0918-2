import cv2
import numpy as np
import os

# Load an image from file
# Using a placeholder path; you would replace this with the path to your image
image_path = '/workspace/placeholder_image.jpg' # This path might not exist, see comments below
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}. Using a blank image instead.")
    # Create a blank black image if loading fails
    image = np.zeros((300, 300, 3), dtype=np.uint8)

# Display the image in a window
cv2.imshow('Loaded Image', image)
cv2.waitKey(0) # Wait for a key press
cv2.destroyAllWindows() # Close the display window

# Save the script to a randomly named .py file
import random
import string

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

script_content = '''import cv2
import numpy as np
import os

# Load an image from file
# Using a placeholder path; you would replace this with the path to your image
image_path = '/workspace/placeholder_image.jpg' # This path might not exist, see comments below
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}. Using a blank image instead.")
    # Create a blank black image if loading fails
    image = np.zeros((300, 300, 3), dtype=np.uint8)

# Display the image in a window
cv2.imshow('Loaded Image', image)
cv2.waitKey(0) # Wait for a key press
cv2.destroyAllWindows() # Close the display window
'''

random_filename = generate_random_filename()
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script saved to {random_filename}")
