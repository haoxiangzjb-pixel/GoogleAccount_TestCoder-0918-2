import cv2
import numpy as np
import os

# Load an image from file
image_path = '/workspace/lena512color.tiff'
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    print(f"Image loaded successfully from {image_path}. Shape: {image.shape}")

    # Save the loaded image to a new file with a random name
    # Generate a random filename for the output image
    random_filename = f"output_image_{np.random.randint(10000, 99999)}.tiff"
    success = cv2.imwrite(random_filename, image)

    if success:
        print(f"Image successfully saved as {random_filename}")
    else:
        print("Failed to save the image.")