import cv2
import numpy as np

# Create a simple image (black background with a white rectangle)
image = np.zeros((400, 400, 3), dtype=np.uint8)
cv2.rectangle(image, (100, 100), (300, 300), (255, 255, 255), -1)

# Save the image to a file
filename = 'output_image.png'
cv2.imwrite(filename, image)
print(f"Image saved as {filename}")