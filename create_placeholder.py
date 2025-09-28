import cv2
import numpy as np

# Create a simple placeholder image (512x512 RGB)
placeholder_image = np.random.randint(0, 255, (512, 512, 3), dtype=np.uint8)

# Save it as lena512color.tiff
cv2.imwrite('/workspace/lena512color.tiff', placeholder_image)
print("Placeholder image 'lena512color.tiff' created.")