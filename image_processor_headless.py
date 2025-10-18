import cv2
import numpy as np
import os
import random
import string
import sys

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def load_display_save_image(image_path):
    """
    Load an image, display it (if possible), and save this script with a random name
    """
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {image.shape}")
    
    # Check if we're in a headless environment before trying to display
    try:
        # Try to check if we can create a display window
        import tkinter
        tk = tkinter.Tk()
        tk.withdraw()
        tk.destroy()
        display_available = True
    except:
        # If tkinter doesn't work, check environment
        display_available = os.environ.get('DISPLAY') is not None or sys.platform == 'darwin'
    
    if display_available:
        try:
            # Display the image
            cv2.imshow('Loaded Image', image)
            print("Displaying image. Press any key in the image window to close it.")
            cv2.waitKey(0)  # Wait for a key press
            cv2.destroyAllWindows()  # Close the image window
        except cv2.error:
            print("Could not display image (possibly in headless environment)")
    else:
        print("Running in headless environment - skipping image display")
    
    # Create the content for our Python script
    script_content = '''import cv2
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
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as: {random_filename}")

# Example usage
if __name__ == "__main__":
    # For demonstration, we'll create a simple test image if no image is provided
    test_image_path = "test_image.jpg"
    
    # Create a test image if it doesn't exist
    if not os.path.exists(test_image_path):
        test_image = np.random.randint(0, 255, (300, 300, 3), dtype=np.uint8)
        cv2.imwrite(test_image_path, test_image)
        print(f"Created test image: {test_image_path}")
    
    load_display_save_image(test_image_path)