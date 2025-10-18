import cv2
import numpy as np
import os
import sys

def load_and_display_image(image_path):
    """
    Load an image using OpenCV, display it if possible, and save the script with a random name
    """
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    # In a headless environment, we'll just report that the image was loaded
    # In a GUI environment, we would display the image
    print(f"Image loaded successfully from {image_path} with dimensions {image.shape}")
    
    # Generate a random name for the saved Python script
    import random
    import string
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    output_path = f"{random_name}.py"
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Save the script with the random name
    with open(output_path, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as {output_path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py <image_path>")
        sys.exit(1)
    
    image_path = sys.argv[1]
    load_and_display_image(image_path)