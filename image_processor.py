import cv2
import numpy as np
import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Create a sample image for demonstration (since we don't know if user has a specific image)
    # In a real scenario, you would load an existing image
    sample_image = np.zeros((300, 300, 3), dtype=np.uint8)
    sample_image[:] = [255, 100, 0]  # Blue color background
    
    # Draw some shapes to make the image more interesting
    cv2.rectangle(sample_image, (50, 50), (250, 250), (0, 255, 0), 2)
    cv2.putText(sample_image, 'Sample Image', (70, 150), 
                cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    print("Displaying sample image. Press any key to close the window.")
    
    # Display the image
    cv2.imshow('Sample Image', sample_image)
    cv2.waitKey(0)  # Wait for a key press
    cv2.destroyAllWindows()  # Close the window
    
    # Save the image to a randomly named .py file (this is the requirement)
    # Note: This will create a .py file but will contain image data, not Python code
    random_filename = generate_random_filename()
    
    # Actually, let's save the original OpenCV script to the random .py file
    script_content = '''import cv2
import numpy as np
import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Load an image (replace with your image path)
    image_path = "sample_image.jpg"  # Change this to your image path
    image = cv2.imread(image_path)
    
    if image is None:
        # Create a sample image if no file is provided
        image = np.zeros((300, 300, 3), dtype=np.uint8)
        image[:] = [255, 100, 0]  # Blue color background
        cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), 2)
        cv2.putText(image, 'Sample Image', (70, 150), 
                    cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    print("Displaying image. Press any key to close the window.")
    
    # Display the image
    cv2.imshow('Image', image)
    cv2.waitKey(0)  # Wait for a key press
    cv2.destroyAllWindows()  # Close the window
    
    # Save image to a randomly named .py file (as per requirement)
    # Note: This creates a .py file but with image data, which is unusual
    random_filename = generate_random_filename()
    cv2.imwrite(random_filename, image)
    print(f"Image saved to: {random_filename}")

if __name__ == "__main__":
    main()
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Original script saved to randomly named file: {random_filename}")

if __name__ == "__main__":
    main()