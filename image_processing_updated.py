import cv2
import numpy as np
import os
import random
import string

def load_and_display_image(image_path):
    """
    Loads an image, displays it, and saves it with a random name
    """
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    # Try to display the image (this may fail in headless environments)
    try:
        cv2.imshow('Loaded Image', img)
        print("Press any key to continue...")
        cv2.waitKey(0)  # Wait for a key press
        cv2.destroyAllWindows()  # Close the display window
    except cv2.error as e:
        print(f"Could not display image (this may be due to headless environment): {e}")
    
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    output_filename = f"{random_name}.jpg"
    
    # Save the image with the random name
    success = cv2.imwrite(output_filename, img)
    
    if success:
        print(f"Image saved as {output_filename}")
        return output_filename
    else:
        print("Failed to save the image")
        return None

# Example usage
if __name__ == "__main__":
    # For this example, we'll create a simple test image since we don't know if there's an image in the workspace
    test_img = np.zeros((300, 300, 3), dtype=np.uint8)
    test_img[:] = [255, 0, 0]  # Blue background
    
    # Draw a rectangle
    cv2.rectangle(test_img, (50, 50), (250, 250), (0, 255, 0), 3)
    
    # Draw some text
    cv2.putText(test_img, 'Test Image', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    # Save the test image
    test_image_path = "test_image.jpg"
    cv2.imwrite(test_image_path, test_img)
    
    print(f"Created test image: {test_image_path}")
    
    # Now process the test image
    result = load_and_display_image(test_image_path)
    
    if result:
        print(f"Processing completed. Final output saved as: {result}")
    else:
        print("Processing failed.")