import cv2
import numpy as np
import os

# Load an image from file
# Replace 'path_to_your_image.jpg' with the actual path to your image file
image_path = 'path_to_your_image.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press and close the window
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Generate a random filename for the Python script
    import random
    import string
    random_filename = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

    # Save this script with the random filename
    # Note: This part is tricky if done from within the script itself.
    # A common approach is to save a different script or just print the name.
    # For this example, we will just print the intended name.
    print(f"This script would be saved with the name: {random_filename}")
