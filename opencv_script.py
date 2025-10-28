import cv2
import numpy as np
import random
import string
import os

def load_and_display_image(image_path='sample_image.jpg'):
    """
    Load an image using OpenCV, display it (if possible), and save the script to a randomly named file
    """
    # Try to load the image
    img = cv2.imread(image_path)
    
    # If the image doesn't exist, create a sample image
    if img is None:
        print(f"Image {image_path} not found. Creating a sample image...")
        img = np.zeros((300, 300, 3), dtype=np.uint8)
        img[:] = [255, 100, 0]  # Blue background
        
        # Draw some shapes to make it interesting
        cv2.rectangle(img, (50, 50), (250, 250), (0, 255, 0), 3)
        cv2.circle(img, (150, 150), 50, (0, 0, 255), -1)
        cv2.putText(img, 'Sample Image', (70, 100), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 255, 255), 2)
    
    # Check if we're in a headless environment before trying to display
    # For headless environments, just skip the display functionality
    import os
    display_env_vars = ['DISPLAY', 'WAYLAND_DISPLAY']
    has_display = any(var in os.environ for var in display_env_vars)
    
    if has_display:
        try:
            # Display the image
            cv2.imshow('Loaded Image', img)
            print("Displaying image. Press any key to close the window...")
            cv2.waitKey(0)  # Wait for a key press
            cv2.destroyAllWindows()  # Close the window
        except cv2.error as e:
            print(f"Could not display image due to: {e}")
            print("Image loaded successfully but display not available")
    else:
        print("Running in headless environment, skipping image display")
        print("Image loaded/created successfully")
    
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Read the current script
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Save the script to the randomly named file
    with open(random_name, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to randomly named file: {random_name}")
    
    return img

if __name__ == "__main__":
    # You can specify an image path or use the default sample image creation
    loaded_image = load_and_display_image()