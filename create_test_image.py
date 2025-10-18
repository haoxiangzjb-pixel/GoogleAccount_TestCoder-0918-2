from PIL import Image, ImageDraw, ImageFont
import numpy as np

# Create a simple test image
width, height = 300, 200
image = Image.new('RGB', (width, height), color=(76, 175, 80))  # Green background
draw = ImageDraw.Draw(image)

# Add some text
try:
    font = ImageFont.truetype("arial.ttf", 20)
except:
    font = ImageFont.load_default()

draw.text((width//2, height//2), "Test Image", fill=(255, 255, 255), font=font, anchor="mm")

# Save as JPEG
image.save('/workspace/test_image.jpg')
print("Test image created successfully!")