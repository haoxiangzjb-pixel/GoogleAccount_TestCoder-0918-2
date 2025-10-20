import cv2
import numpy as np
import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def load_and_display_image(image_path):
    """Load and display an image using OpenCV"""
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return None
    
    # Display the image
    cv2.imshow('Image', img)
    
    # Wait for a key press and then close the window
    print("Press any key to close the image window...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    return img

def main():
    # For this example, we'll create a simple image if one doesn't exist
    # In a real scenario, you would provide an actual image path
    test_image_path = "test_image.jpg"
    
    # Create a sample image if it doesn't exist
    if not os.path.exists(test_image_path):
        # Create a sample image
        sample_img = np.zeros((300, 300, 3), dtype=np.uint8)
        sample_img[:] = [255, 100, 0]  # Blue background
        cv2.rectangle(sample_img, (50, 50), (250, 250), (0, 255, 0), 2)  # Green rectangle
        cv2.putText(sample_img, 'Sample Image', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
        cv2.imwrite(test_image_path, sample_img)
        print(f"Created sample image: {test_image_path}")
    
    # Load and display the image
    img = load_and_display_image(test_image_path)
    
    if img is not None:
        # Generate a random filename
        random_filename = generate_random_filename()
        
        # Save this script with the random filename
        with open(random_filename, 'w') as f:
            f.write('''import cv2
import numpy as np
import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def load_and_display_image(image_path):
    """Load and display an image using OpenCV"""
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return None
    
    # Display the image
    cv2.imshow('Image', img)
    
    # Wait for a key press and then close the window
    print("Press any key to close the image window...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    return img

def main():
    # For this example, we\'ll create a simple image if one doesn\'t exist
    # In a real scenario, you would provide an actual image path
    test_image_path = "test_image.jpg"
    
    # Create a sample image if it doesn\'t exist
    if not os.path.exists(test_image_path):
        # Create a sample image
        sample_img = np.zeros((300, 300, 3), dtype=np.uint8)
        sample_img[:] = [255, 100, 0]  # Blue background
        cv2.rectangle(sample_img, (50, 50), (250, 250), (0, 255, 0), 2)  # Green rectangle
        cv2.putText(sample_img, 'Sample Image', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
        cv2.imwrite(test_image_path, sample_img)
        print(f"Created sample image: {test_image_path}")
    
    # Load and display the image
    img = load_and_display_image(test_image_path)
    
    if img is not None:
        print(f"Image processed successfully!")
    
if __name__ == "__main__":
    main()
''')
        
        print(f"Script saved with random filename: {random_filename}")

if __name__ == "__main__":
    main()