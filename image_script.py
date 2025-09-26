import cv2
import numpy as np
import os

# Load an image from the workspace or create a dummy one if not found
image_path = '/workspace/lena.png' # Common test image, might not exist
if os.path.exists(image_path):
    image = cv2.imread(image_path)
else:
    # Create a dummy image if the file doesn't exist
    print(f"Image file {image_path} not found. Creating a dummy image.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Green square

# Save the image to a new file with a random name
import random
import string
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
output_path = f'/workspace/{random_name}.png'
cv2.imwrite(output_path, image)
print(f"Image created and saved as {output_path}")
