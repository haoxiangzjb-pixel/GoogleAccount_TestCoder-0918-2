import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension='.jpg'):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return random_name + extension

def main():
    # Load an image from file
    image_path = '/workspace/test_image.jpg'
    
    # Check if the image exists
    if not os.path.exists(image_path):
        print(f"Error: Image not found at {image_path}")
        return
    
    # Load the image using OpenCV
    image = cv2.imread(image_path)
    
    # Check if image was loaded successfully
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {image.shape}")
    
    # Check if we're in a headless environment by checking for display availability
    if os.getenv('DISPLAY'):
        # Display the image in a window
        cv2.imshow('Loaded Image', image)
        
        # Wait for a key press (0 means wait indefinitely)
        print("Press any key to continue...")
        cv2.waitKey(0)
        
        # Close all OpenCV windows
        cv2.destroyAllWindows()
        print("Image displayed successfully")
    else:
        print("Headless environment detected - skipping image display")
        print("Image loaded successfully but not displayed (no display available)")
    
    # Generate a random filename for saving
    random_filename = generate_random_filename('.jpg')
    save_path = f'/workspace/{random_filename}'
    
    # Save the image with the random filename
    success = cv2.imwrite(save_path, image)
    
    if success:
        print(f"Image saved successfully as: {save_path}")
    else:
        print("Error: Could not save the image")

if __name__ == "__main__":
    main()