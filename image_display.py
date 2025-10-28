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
    # Try to load an image (replace with your image path)
    # For demonstration, I'll create a simple image
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    image[:] = [255, 100, 0]  # Blue background
    
    # Draw some shapes to make the image more interesting
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), 2)
    cv2.putText(image, 'OpenCV Image', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    # Display the image
    cv2.imshow('Display Image', image)
    print("Displaying image. Press any key to continue...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Generate random filename
    random_filename = generate_random_filename()
    
    # Save this script to the randomly named file
    with open(random_filename, 'w') as f:
        f.write('''import cv2
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
    # Try to load an image (replace with your image path)
    # For demonstration, I'll create a simple image
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    image[:] = [255, 100, 0]  # Blue background
    
    # Draw some shapes to make the image more interesting
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), 2)
    cv2.putText(image, 'OpenCV Image', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    # Display the image
    cv2.imshow('Display Image', image)
    print("Displaying image. Press any key to continue...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Generate random filename
    random_filename = generate_random_filename()
    
    # Save this script to the randomly named file
    print(f"Script saved as: {random_filename}")

if __name__ == "__main__":
    main()
''')
    
    print(f"Script saved as: {random_filename}")

if __name__ == "__main__":
    main()