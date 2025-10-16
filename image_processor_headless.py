import cv2
import numpy as np
import os
import sys
from datetime import datetime
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"{timestamp}_{random_string}.py"

def main():
    # Create a sample image for demonstration
    # In a real scenario, you would load an actual image file
    sample_image = np.zeros((300, 300, 3), dtype=np.uint8)
    sample_image[:] = [255, 100, 50]  # Blue color background
    
    # Draw some shapes to make the image more interesting
    cv2.rectangle(sample_image, (50, 50), (250, 250), (0, 255, 0), 2)
    cv2.putText(sample_image, 'Sample Image', (70, 150), 
                cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    print("Image loaded and processed successfully (without display).")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Save this script to the randomly named .py file
    script_content = '''import cv2
import numpy as np

def main():
    # Load an image (for this example, we'll create a sample image)
    # In real usage, replace with: image = cv2.imread('path_to_your_image.jpg')
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    image[:] = [255, 100, 50]  # Blue color background
    
    # Draw some shapes to make the image more interesting
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), 2)
    cv2.putText(image, 'Sample Image', (70, 150), 
                cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    print("Image loaded successfully.")
    # Note: Image display is skipped in headless environments

if __name__ == "__main__":
    main()
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to randomly named file: {random_filename}")

if __name__ == "__main__":
    main()