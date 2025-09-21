import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(length=10):
    """Generate a random filename with .jpg extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return f"{random_name}.jpg"

def main():
    # Create a sample image (black image with a white rectangle)
    image = np.zeros((400, 400, 3), dtype=np.uint8)
    cv2.rectangle(image, (100, 100), (300, 300), (255, 255, 255), -1)
    
    # Add some text to the image
    cv2.putText(image, 'OpenCV Demo', (110, 200), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
    
    # In a headless environment, we skip displaying the image
    # and just save it directly
    
    # Generate a random filename
    output_filename = generate_random_filename()
    
    # Save the image
    success = cv2.imwrite(output_filename, image)
    if success:
        print(f"Image saved as {output_filename}")
    else:
        print("Error saving image")
        
    # Verify the file was created
    if os.path.exists(output_filename):
        print(f"File {output_filename} exists and is {os.path.getsize(output_filename)} bytes")

if __name__ == "__main__":
    main()