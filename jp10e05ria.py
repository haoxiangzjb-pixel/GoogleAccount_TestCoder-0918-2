import cv2
import numpy as np
import os
import sys
from datetime import datetime
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Try to load an image - you can change this path to any image you have
    image_path = "sample_image.jpg"  # Default name, but you can change this
    
    # If no specific image provided, create a simple test image
    if not os.path.exists(image_path):
        print(f"Image {image_path} not found, creating a sample image...")
        # Create a sample image with OpenCV
        sample_img = np.zeros((300, 300, 3), dtype=np.uint8)
        # Add some shapes to make it interesting
        cv2.rectangle(sample_img, (50, 50), (250, 250), (0, 255, 0), -1)  # Green square
        cv2.circle(sample_img, (150, 150), 50, (255, 0, 0), -1)  # Blue circle
        cv2.putText(sample_img, 'Sample Image', (70, 100), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 0, 0), 2)
        
        # Save the sample image
        cv2.imwrite("sample_image.jpg", sample_img)
        image = sample_img
        print("Created sample image: sample_image.jpg")
    else:
        # Load the image from file
        image = cv2.imread(image_path)
        
        if image is None:
            print(f"Could not load image from {image_path}")
            sys.exit(1)
    
    # Since we're likely in a headless environment, skip image display
    # but print information about the image instead
    print(f"Image shape: {image.shape}")
    print(f"Image dtype: {image.dtype}")
    print("Image loaded successfully but skipping display in headless environment...")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Save this script with the random filename
    with open(__file__, 'r') as original_file:
        script_content = original_file.read()
    
    with open(random_filename, 'w') as new_file:
        new_file.write(script_content)
    
    print(f"Script saved with random name: {random_filename}")
    
    # Also save the image with a random name
    img_random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + ".jpg"
    cv2.imwrite(img_random_name, image)
    print(f"Image saved with random name: {img_random_name}")

if __name__ == "__main__":
    main()