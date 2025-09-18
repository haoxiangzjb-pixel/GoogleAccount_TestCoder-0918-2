import cv2
import numpy as np
import uuid
import os

# Generate a random image (256x256 pixels with 3 color channels)
height, width = 256, 256
image = np.random.randint(0, 256, (height, width, 3), dtype=np.uint8)

# Add some shapes to make it more interesting
# Draw a blue circle
cv2.circle(image, (width//4, height//4), 50, (255, 0, 0), -1)
# Draw a green rectangle
cv2.rectangle(image, (3*width//4-50, 3*height//4-50), (3*width//4+50, 3*height//4+50), (0, 255, 0), -1)
# Draw a red line
cv2.line(image, (0, 0), (width, height), (0, 0, 255), 5)

# Display the image (commented out due to environment limitations)
# cv2.imshow('Random Image with Shapes', image)
# print("Displaying the image. Press any key to continue...")
# cv2.waitKey(0)  # Wait for a key press
# cv2.destroyAllWindows()
# print("Image displayed successfully!")

# Generate a random filename
random_filename = f"{uuid.uuid4().hex}.jpg"

# Save the image
cv2.imwrite(random_filename, image)
print(f"Image saved as {random_filename}")

# Verify the file was saved
if os.path.exists(random_filename):
    print(f"File {random_filename} successfully saved!")
else:
    print("Error saving the file.")