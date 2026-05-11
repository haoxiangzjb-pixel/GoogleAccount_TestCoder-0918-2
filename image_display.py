import cv2
import random
import string
import os

def generate_random_filename(length=8):
    """Generate a random filename with .py extension."""
    chars = string.ascii_letters + string.digits
    random_name = ''.join(random.choice(chars) for _ in range(length))
    return f"{random_name}.py"

def load_and_display_image(image_path):
    """Load and display an image using OpenCV."""
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return None
    
    print(f"Image loaded successfully!")
    print(f"Image shape: {image.shape}")
    print(f"Image dtype: {image.dtype}")
    
    # Display the image (requires GUI backend)
    # Note: In headless environments, this won't show a window
    cv2.imshow('Image Display', image)
    print("Image displayed. Press any key to close...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    return image

def save_script_to_random_file(script_content):
    """Save the script content to a randomly named .py file."""
    filename = generate_random_filename()
    filepath = os.path.join(os.getcwd(), filename)
    
    with open(filepath, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {filepath}")
    return filepath

# Get the current script content
current_script_path = __file__
with open(current_script_path, 'r') as f:
    script_content = f.read()

# Save this script to a randomly named file
save_script_to_random_file(script_content)

# Example usage - replace with your image path
# image = load_and_display_image('path/to/your/image.jpg')
print("\nTo use this script, uncomment the last line and provide an image path.")
