import cv2
import numpy as np
import os

# Load an image from file
# Replace 'path_to_your_image.jpg' with the actual path to your image file
image_path = 'path_to_your_image.jpg'
image = cv2.imread(image_path)

# Check if the image was loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window named 'Image'
    cv2.imshow('Image', image)
    
    # Wait for a key press and close the window
    print("Press any key on the image window to close it and save the script.")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Save this script with a random name
    # Note: This part saves *this* script, not the loaded image.
    # The loaded image can be saved using cv2.imwrite if needed.
    script_content = '''import cv2
import numpy as np
import os

# Load an image from file
# Replace 'path_to_your_image.jpg' with the actual path to your image file
image_path = 'path_to_your_image.jpg'
image = cv2.imread(image_path)

# Check if the image was loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window named 'Image'
    cv2.imshow('Image', image)
    
    # Wait for a key press and close the window
    print("Press any key on the image window to close it and save the script.")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Example: Save the loaded image to a new file
    # Uncomment the next line to save the image as 'output.jpg'
    # cv2.imwrite('output.jpg', image)

'''
    # Generate a random filename for the Python script
    import random
    import string
    random_name = "image_script_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"
    with open(random_name, 'w') as f:
        f.write(script_content)
    print(f"Script saved as {random_name}")
