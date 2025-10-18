import cv2
import numpy as np

# This is a randomly named copy of the image processing script

def load_and_display_image(image_path):
    """
    Load an image
    """
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {image.shape}")
    
    print("Image processing completed!")

# Example usage
if __name__ == "__main__":
    # You would call load_and_display_image with an appropriate image path
    pass
