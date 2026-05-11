#!/usr/bin/env python3
"""
OpenCV Image Viewer Script
Loads and displays an image, and saves itself to a randomly named .py file.
"""

import cv2
import os
import sys
import random
import string


def generate_random_filename(length=8):
    """Generate a random filename with .py extension."""
    characters = string.ascii_letters + string.digits
    random_name = ''.join(random.choice(characters) for _ in range(length))
    return f"{random_name}.py"


def save_self_to_random_file():
    """Save the current script to a randomly named .py file."""
    # Get the current script's content
    current_script_path = os.path.abspath(__file__)
    
    with open(current_script_path, 'r') as f:
        script_content = f.read()
    
    # Generate random filename
    random_filename = generate_random_filename()
    new_file_path = os.path.join(os.path.dirname(current_script_path), random_filename)
    
    # Save to the new file
    with open(new_file_path, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {new_file_path}")
    return new_file_path


def load_and_display_image(image_path):
    """Load and display an image using OpenCV."""
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from '{image_path}'")
        print("Please check if the file exists and is a valid image format.")
        return False
    
    # Display image properties
    print(f"Image loaded successfully!")
    print(f"Dimensions: {image.shape[1]}x{image.shape[0]}")
    if len(image.shape) == 3:
        print(f"Channels: {image.shape[2]}")
    
    # Create a window and display the image
    window_name = "Image Viewer - Press any key to close"
    cv2.namedWindow(window_name, cv2.WINDOW_NORMAL)
    cv2.imshow(window_name, image)
    
    # Wait for a key press (0 means wait indefinitely)
    print("Displaying image... Press any key to close the window.")
    cv2.waitKey(0)
    
    # Close all OpenCV windows
    cv2.destroyAllWindows()
    
    return True


def main():
    """Main function to run the image viewer."""
    print("=" * 50)
    print("OpenCV Image Viewer")
    print("=" * 50)
    
    # Check if image path is provided as command line argument
    if len(sys.argv) > 1:
        image_path = sys.argv[1]
    else:
        # Default image path - change this to your image file
        image_path = "input.jpg"
        print(f"No image path provided. Using default: {image_path}")
        print("Usage: python image_viewer.py <path_to_image>")
    
    # Save this script to a randomly named file
    print("\nSaving script to random file...")
    save_self_to_random_file()
    
    # Load and display the image
    print("\nLoading image...")
    if load_and_display_image(image_path):
        print("\nDone!")
    else:
        print("\nFailed to display image.")
        sys.exit(1)


if __name__ == "__main__":
    main()
