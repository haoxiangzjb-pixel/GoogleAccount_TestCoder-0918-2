import cv2
import numpy as np
import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def process_image(image_path):
    """Load and save an image using OpenCV (without display in headless environment)"""
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    # In a headless environment, we skip the display part
    print("Image loaded successfully (skipping display in headless environment)")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Save the image with a random name (keeping original extension)
    original_ext = os.path.splitext(image_path)[1]
    image_random_name = os.path.splitext(random_filename)[0] + original_ext
    cv2.imwrite(image_random_name, image)
    
    print(f"Image saved as: {image_random_name}")
    
    # Also create a .py file with the OpenCV code
    with open(random_filename, 'w') as f:
        f.write('''import cv2
import numpy as np

# This is a randomly named Python script that uses OpenCV
# Load an image (without display in headless environment)

def load_image(image_path):
    image = cv2.imread(image_path)
    if image is not None:
        print("Image loaded successfully")
        # In a headless environment, we skip the display
        # cv2.imshow functionality would go here in a GUI environment
    else:
        print("Could not load image")

# Example usage would go here
''')
    
    print(f"Random .py script created: {random_filename}")

if __name__ == "__main__":
    # For this example, we'll create a simple image if one doesn't exist
    # Create a sample image to work with
    sample_image = np.zeros((300, 300, 3), dtype=np.uint8)
    sample_image[:] = [255, 100, 0]  # Blue background
    
    # Draw some shapes to make it more interesting
    cv2.rectangle(sample_image, (50, 50), (250, 250), (0, 255, 0), 2)
    cv2.circle(sample_image, (150, 150), 50, (0, 0, 255), -1)
    
    # Save the sample image
    sample_image_path = "sample_image.jpg"
    cv2.imwrite(sample_image_path, sample_image)
    
    print("Processing sample image...")
    process_image(sample_image_path)