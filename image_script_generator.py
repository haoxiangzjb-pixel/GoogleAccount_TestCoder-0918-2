import cv2
import numpy as np
import os

# Load an image from file.
# For demonstration, we'll create a simple synthetic image if a file is not found.
image_path = 'example_image.jpg' # You can change this to your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Image '{image_path}' not found. Creating a sample image...")
    # Create a sample image: a 300x300 blue square
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    image[:] = [255, 0, 0]  # BGR for blue

# Display the image in a window named 'Image'
cv2.imshow('Image', image)

# Wait for a key press indefinitely
cv2.waitKey(0)

# Destroy all OpenCV windows
cv2.destroyAllWindows()

# Save the script to a randomly named .py file
import random
import string

random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
with open(random_name, 'w') as f:
    f.write('# This script was randomly generated\n')
    f.write('# It loads, displays, and saves an image using OpenCV\n\n')
    f.write('# Load an image from file.\n')
    f.write('# For demonstration, we\'ll create a simple synthetic image if a file is not found.\n')
    f.write('image_path = \'example_image.jpg\' # You can change this to your image path\n')
    f.write('image = cv2.imread(image_path)\n\n')
    f.write('if image is None:\n')
    f.write('    print(f"Image \'{image_path}\' not found. Creating a sample image...")\n')
    f.write('    # Create a sample image: a 300x300 blue square\n')
    f.write('    image = np.zeros((300, 300, 3), dtype=np.uint8)\n')
    f.write('    image[:] = [255, 0, 0]  # BGR for blue\n\n')
    f.write('# Display the image in a window named \'Image\'\n')
    f.write('cv2.imshow(\'Image\', image)\n\n')
    f.write('# Wait for a key press indefinitely\n')
    f.write('cv2.waitKey(0)\n\n')
    f.write('# Destroy all OpenCV windows\n')
    f.write('cv2.destroyAllWindows()\n')

print(f"Script saved as {random_name}")
