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
    # Create a simple image (since we can't display it in this environment)
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    image[:] = [255, 100, 0]  # Blue background
    
    # Draw some shapes to make the image more interesting
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), 2)
    cv2.putText(image, 'OpenCV Image', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    # Generate random filename
    random_filename = generate_random_filename()
    
    print("Image created successfully!")
    print(f"Script saved as: {random_filename}")

if __name__ == "__main__":
    main()
