import cv2
import numpy as np
import os

# Load an image from the workspace directory. Using a common placeholder name.
image_path = '/workspace/placeholder_image.jpg'

# Check if the image file exists before attempting to load it.
if os.path.exists(image_path):
    # Load the image
    image = cv2.imread(image_path)

    # Check if the image was loaded successfully
    if image is not None:
        # Display the image in a window named 'Loaded Image'
        cv2.imshow('Loaded Image', image)

        # Wait for a key press indefinitely
        cv2.waitKey(0)

        # Destroy all OpenCV windows
        cv2.destroyAllWindows()

        # Generate a random filename for the Python script
        import random
        import string
        random_filename = '/workspace/' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

        # Save this script itself to the randomly named file
        # This is a trick where we read the current script's content and write it to a new file
        current_script_path = __file__
        with open(current_script_path, 'r') as current_file:
            script_content = current_file.read()

        with open(random_filename, 'w') as new_file:
            new_file.write(script_content)

        print(f"Image displayed successfully. This script has been saved to '{random_filename}'.")

    else:
        print(f"Error: Could not load image from '{image_path}'. The file might be corrupted or not a valid image format.")
else:
    print(f"Image file '{image_path}' not found. Please place an image named 'placeholder_image.jpg' in the /workspace directory to run this script.")