import cv2
import numpy as np
import os

# Load an image from the workspace directory or use a placeholder
image_path = '/workspace/placeholder_image.jpg' # This path is illustrative; adjust as needed.
# For demonstration, we'll create a simple synthetic image if a file isn't found.
if os.path.exists(image_path):
    img = cv2.imread(image_path)
else:
    print("Placeholder image not found. Creating a synthetic test image.")
    img = np.zeros((300, 300, 3), dtype=np.uint8)
    img[:] = [255, 0, 0]  # Blue background
    cv2.rectangle(img, (50, 50), (250, 250), (0, 255, 0), 5)  # Green rectangle
    cv2.putText(img, 'Test Image', (75, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

# Note: Display functionality (cv2.imshow, cv2.waitKey, cv2.destroyAllWindows) 
# is omitted because the environment does not support GUI operations.
print("Processing image...")

# Save the displayed image to a new file with a random name
import random
import string
random_filename = 'output_image_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.jpg'
cv2.imwrite(random_filename, img)
print(f"Image saved as {random_filename}")
