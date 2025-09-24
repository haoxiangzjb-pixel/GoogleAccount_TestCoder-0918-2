from PIL import Image
import numpy as np

# Create a simple red image for demonstration
width, height = 200, 200
red_color = (255, 0, 0)  # RGB for red
image_array = np.full((height, width, 3), red_color, dtype=np.uint8)
pil_image = Image.fromarray(image_array)
pil_image.save('example.jpg')
print("Created example.jpg")