import cv2
import numpy as np
import os

# Load an image from file
# Replace 'path_to_your_image.jpg' with the actual path to your image
image_path = '/workspace/lena512color.tiff'  # Using a standard test image if available, or specify your own path
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press and close the window
    print("Press any key on the image window to close it and save the script.")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Save the loaded image to a new file with a random name
    # Generate a random filename for the output image
    random_filename = f"output_image_{np.random.randint(10000, 99999)}.tiff"
    success = cv2.imwrite(random_filename, image)

    if success:
        print(f"Image successfully saved as {random_filename}")
    else:
        print("Failed to save the image.")