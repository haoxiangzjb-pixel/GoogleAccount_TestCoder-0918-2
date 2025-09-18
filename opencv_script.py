import cv2
import numpy as np
import uuid
import os
import sys

# Create a sample image (black image with a white rectangle and text)
def create_sample_image():
    # Create a black image
    img = np.zeros((400, 400, 3), dtype=np.uint8)
    
    # Draw a white rectangle
    cv2.rectangle(img, (50, 50), (350, 350), (255, 255, 255), 2)
    
    # Add some text
    cv2.putText(img, 'OpenCV Demo', (80, 200), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
    
    return img

# Generate a random filename
def generate_random_filename():
    return f"image_{uuid.uuid4().hex}.jpg"

# Check if we're running in a headless environment
def is_headless():
    # Simple check - if we can't connect to a display, we're likely headless
    try:
        import tkinter
        root = tkinter.Tk()
        root.destroy()
        return False
    except:
        return True

# Main function
def main():
    # Create a sample image
    print("Creating a sample image...")
    img = create_sample_image()
    
    # Save the original image
    original_filename = "sample_image.jpg"
    cv2.imwrite(original_filename, img)
    print(f"Sample image saved as {original_filename}")
    
    # Load the image
    print("Loading the image...")
    loaded_img = cv2.imread(original_filename)
    
    if loaded_img is None:
        print(f"Error: Could not load image {original_filename}")
        return
    
    # Display the image only if not in headless environment
    if not is_headless():
        print("Displaying the image...")
        cv2.imshow('Loaded Image', loaded_img)
        print("Press any key to close the image window...")
        cv2.waitKey(0)  # Wait for a key press
        cv2.destroyAllWindows()  # Close all windows
    else:
        print("Running in headless environment - skipping image display")
    
    # Save the image with a random name
    random_filename = generate_random_filename()
    cv2.imwrite(random_filename, loaded_img)
    print(f"Image saved with random name: {random_filename}")
    
    print("Process completed successfully!")

if __name__ == "__main__":
    main()