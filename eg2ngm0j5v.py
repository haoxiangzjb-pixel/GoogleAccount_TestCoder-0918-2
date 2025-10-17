import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension='.jpg'):
    """Generate a random filename with the specified extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return random_name + extension

def load_display_save_image(image_path):
    """
    Load an image, display it, and save it with a random name.
    
    Args:
        image_path (str): Path to the input image
    """
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print("Image loaded successfully (display skipped in this environment)")
    
    # Generate a random filename for saving
    random_filename = generate_random_filename('.jpg')
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, image)
    
    if success:
        print(f"Image saved successfully as: {random_filename}")
    else:
        print("Error: Could not save the image")

# Example usage:
if __name__ == "__main__":
    # For demonstration, we'll create a simple image if no input image is provided
    sample_image = np.zeros((300, 300, 3), dtype=np.uint8)
    sample_image[:] = [255, 100, 0]  # Blue color in BGR
    cv2.rectangle(sample_image, (50, 50), (250, 250), (0, 255, 0), 2)  # Green rectangle
    cv2.putText(sample_image, 'Sample Image', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    # Save the sample image temporarily
    temp_image_path = "temp_sample.jpg"
    cv2.imwrite(temp_image_path, sample_image)
    
    # Load, display, and save with random name
    load_display_save_image(temp_image_path)
    
    # Clean up the temporary image
    if os.path.exists(temp_image_path):
        os.remove(temp_image_path)