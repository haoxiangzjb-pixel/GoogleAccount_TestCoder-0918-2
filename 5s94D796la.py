import cv2
import numpy as np

# Create a sample image (since we may not have an image file)
# Creating a colorful gradient image
image = np.zeros((400, 600, 3), dtype=np.uint8)
for i in range(400):
    for j in range(600):
        image[i, j] = [i % 256, j % 256, (i + j) % 256]

# Load and display the image
cv2.imshow('Image Display', image)

print("Image displayed. Press any key to close...")
cv2.waitKey(0)
cv2.destroyAllWindows()

print("Image display closed.")
