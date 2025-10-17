import cv2
import numpy as np
import random
import string

# Create a synthetic image for demonstration
height, width = 300, 300
synthetic_image = np.zeros((height, width, 3), dtype=np.uint8)

# Draw some shapes to make the image interesting
cv2.rectangle(synthetic_image, (50, 50), (250, 100), (0, 255, 0), -1)  # Green rectangle
cv2.circle(synthetic_image, (150, 200), 50, (255, 0, 0), -1)  # Blue circle
cv2.putText(synthetic_image, 'OpenCV Demo', (70, 270), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# Since we're in a headless environment, skip display functionality
print("Running in headless environment. Creating and saving image directly...")

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.jpg'

# Save the image with the random filename
cv2.imwrite(random_filename, synthetic_image)
print(f"Image saved as {random_filename}")