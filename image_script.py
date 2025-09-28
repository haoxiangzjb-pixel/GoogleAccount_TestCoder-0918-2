import cv2
import numpy as np
import os

# Load an image from the current directory
image_path = 'sample_image.jpg' # Assuming an image exists with this name
image = cv2.imread(image_path)

if image is not None:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    cv2.waitKey(0) # Wait for a key press
    cv2.destroyAllWindows() # Close the window

    # Save the image data to a new, randomly named .py file
    random_filename = np.random.bytes(12).hex() + '.py'
    np.save(random_filename, image)
    print(f"Image data saved to {random_filename}")
else:
    print(f"Error: Could not load image from {image_path}")
