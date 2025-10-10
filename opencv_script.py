import cv2
import numpy as np
import os

# Load an image from file
# Replace 'path_to_image.jpg' with the actual path to your image file
image_path = '/workspace/placeholder_image.jpg' # Assuming a placeholder image path, this will likely fail if the image doesn't exist.
# For demonstration, let's create a simple synthetic image instead of loading a real one.
# image = cv2.imread(image_path)

# Create a simple synthetic image (a white square with a black square inside)
synthetic_image = np.ones((400, 400, 3), dtype="uint8") * 255  # White background
synthetic_image[100:300, 100:300] = [0, 0, 0]  # Black square in the middle
image = synthetic_image

# Save the image to a randomly named file
import random
import string
random_filename = 'output_image_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=6)) + '.jpg'
success = cv2.imwrite(random_filename, image)
if success:
    print(f"Image saved as {random_filename}")
else:
    print("Failed to save image.")
