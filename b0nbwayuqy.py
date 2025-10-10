import cv2
import numpy as np

# This script was generated automatically.
# It loads an image and creates a blank image if the file is not found.

image_path = '/workspace/placeholder_image.jpg'
image = cv2.imread(image_path)

if image is None:
    print("Loaded image was None, creating a blank image.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
else:
    print(f"Loaded image successfully. Shape: {image.shape}")

# The image array 'image' now contains the pixel data.
# You can perform operations on it here.
