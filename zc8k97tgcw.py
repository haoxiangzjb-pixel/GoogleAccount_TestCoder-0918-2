import cv2
import numpy as np

# This is a randomly named Python script that uses OpenCV
# Load an image (without display in headless environment)

def load_image(image_path):
    image = cv2.imread(image_path)
    if image is not None:
        print("Image loaded successfully")
        # In a headless environment, we skip the display
        # cv2.imshow functionality would go here in a GUI environment
    else:
        print("Could not load image")

# Example usage would go here
