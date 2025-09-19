import cv2
import numpy as np

# Create a sample image (black background with a white circle)
image = np.zeros((400, 400, 3), dtype=np.uint8)
cv2.circle(image, (200, 200), 100, (255, 255, 255), -1)

# Save the image
cv2.imwrite('sample_image.jpg', image)
print("Sample image created successfully!")