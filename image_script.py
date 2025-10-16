import cv2
import numpy as np
import os
import sys
from datetime import datetime
import random
import string

def generate_random_filename():
    """Generate a random filename with timestamp"""
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"opencv_script_{timestamp}_{random_string}.py"

def main():
    # Generate a random filename for this script
    random_filename = generate_random_filename()
    
    # Try to load an image (you'll need to specify the path to an actual image)
    # For demonstration, I'll create a simple synthetic image
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    # Draw a colored rectangle to make the image recognizable
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1)  # Green rectangle
    cv2.putText(image, 'OpenCV Test', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    print("Image created successfully (skipping display in headless environment)")
    # cv2.imshow('Loaded Image', image)  # Skip display in headless environment
    # cv2.waitKey(0)  # Wait for a key press
    # cv2.destroyAllWindows()  # Close the window
    
    # Save the script to the randomly named file
    script_content = '''import cv2
import numpy as np

def main():
    # Create a simple test image
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1)  # Green rectangle
    cv2.putText(image, 'OpenCV Test', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    print("Displaying image...")
    cv2.imshow('Loaded Image', image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Optionally save the image
    cv2.imwrite('output_image.png', image)
    print("Image saved as output_image.png")

if __name__ == "__main__":
    main()
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    
    # Also save the image to verify the script works
    cv2.imwrite('test_output.png', image)
    print("Test image saved as test_output.png")

if __name__ == "__main__":
    main()