import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension=".jpg"):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return random_name + extension

def main():
    # Load an image from file
    image_path = 'sample_image.jpg'
    
    if not os.path.exists(image_path):
        print(f"Error: {image_path} not found. Please create the sample image first.")
        return
    
    img = cv2.imread(image_path)
    
    # Check if image is loaded successfully
    if img is None:
        print("Error: Could not load image.")
        return
    
    print("Original image loaded successfully!")
    print(f"Image shape: {img.shape}")
    
    # Skip display in headless environment
    print("Running in headless environment, skipping display...")
    print("Image loaded successfully but not displayed (no display available)")
    
    # Generate a random filename for saving
    random_filename = generate_random_filename(".jpg")
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, img)
    
    if success:
        print(f"Image saved successfully as: {random_filename}")
    else:
        print("Error: Could not save image.")

if __name__ == "__main__":
    main()