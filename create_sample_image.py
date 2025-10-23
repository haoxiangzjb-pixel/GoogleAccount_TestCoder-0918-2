import cv2
import numpy as np

# Create a sample image using numpy
image = np.zeros((300, 300, 3), dtype=np.uint8)
image[:] = [255, 100, 50]  # Fill with orange color

# Add some shapes to make it more interesting
cv2.rectangle(image, (50, 50), (250, 150), (0, 255, 0), -1)  # Green rectangle
cv2.circle(image, (150, 200), 50, (0, 0, 255), -1)  # Red circle

# Save the sample image
cv2.imwrite('sample_image.jpg', image)
print("Sample image created successfully!")