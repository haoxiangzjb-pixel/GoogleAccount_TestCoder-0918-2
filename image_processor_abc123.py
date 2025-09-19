import cv2
import uuid

# Load an image from file
image = cv2.imread('sample_image.jpg')

# Check if image was loaded successfully
if image is None:
    print("Error: Could not load image. Please check the file path.")
else:
    print("Image loaded successfully.")
    
    # Generate a random filename for saving
    random_filename = str(uuid.uuid4()) + ".jpg"
    
    # Save the image with the random filename
    cv2.imwrite(random_filename, image)
    print(f"Image saved as {random_filename}")