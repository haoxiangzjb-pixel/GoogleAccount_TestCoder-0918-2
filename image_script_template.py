import cv2
import numpy as np
import os

# Load an image from file
# Using a placeholder path. In a real scenario, you would specify the path to your image.
image_path = 'input_image.jpg' # This path might not exist, causing a failure if not handled.
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}. Using a blank image instead.")
    # Create a blank black image as a fallback
    image = np.zeros((512, 512, 3), dtype=np.uint8)



# Save the loaded (or created) image to a file
output_path = 'output_image.png'
cv2.imwrite(output_path, image)
print(f"Image saved as {output_path}")
