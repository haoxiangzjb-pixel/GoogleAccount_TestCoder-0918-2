import cv2
import numpy as np
import os

# Load an image from the workspace directory or use a placeholder
image_path = 'placeholder_image.jpg' # This path should be updated to an actual image file
image = cv2.imread(image_path)

if image is None:
    # Create a blank white image if the file is not found
    print(f"Image file '{image_path}' not found. Creating a blank image.")
    image = 255 * np.ones(shape=[512, 512, 3], dtype=np.uint8)

# The display function is omitted for headless environments
# cv2.imshow('Loaded Image', image)
# cv2.waitKey(0) # Wait for a key press
# cv2.destroyAllWindows() # Close the window

# Save the image to a new file with a random name
random_filename = f"random_output_{np.random.randint(10000, 99999)}.jpg"
cv2.imwrite(random_filename, image)
print(f"Image saved as {random_filename}")
