import cv2
import numpy as np

# Create a sample image with random colors
height, width = 300, 300
image = np.zeros((height, width, 3), dtype=np.uint8)

# Fill the image with some colors to make it visible
for i in range(height):
    for j in range(width):
        image[i, j] = [i % 256, j % 256, (i + j) % 256]

# Save the image
cv2.imwrite('sample_image.jpg', image)
print("Sample image created: sample_image.jpg")