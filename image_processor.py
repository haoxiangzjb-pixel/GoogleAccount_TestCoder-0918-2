import cv2
import numpy as np
import os

# Load an image from the current directory. You might need to change this path.
image_path = 'example.jpg'  # Replace with your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
    exit()

# Print a message indicating the image was loaded
print("Image loaded successfully. Proceeding to save a new script file.")

# Save this script with a random name
script_content = '''import cv2
import numpy as np
import os

# Load an image from the current directory. You might need to change this path.
image_path = 'example.jpg'  # Replace with your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
    exit()

# Display the image in a window
cv2.imshow('Loaded Image', image)

# Wait for a key press and close the window
print("Press any key on the image window to close it and save the script.")
cv2.waitKey(0)
cv2.destroyAllWindows()
'''

# Generate a random filename for the Python script
random_filename = f"image_script_{np.random.randint(10000, 99999)}.py"

# Write the script content to the new file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script saved as {random_filename}")
