import cv2
import numpy as np
import os

# Load an image from the current directory. You might need to change this path.
image_path = 'example.jpg'  # Replace with your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
    exit()

# Display the image in a window
cv2.imshow('Loaded Image', image)

# Wait for a key press and close the window
print("Press any key on the image window to close it and save the script.")
cv2.waitKey(0)
cv2.destroyAllWindows()
