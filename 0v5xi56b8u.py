# This script was randomly generated
# It loads, displays, and saves an image using OpenCV

# Load an image from file.
# For demonstration, we'll create a simple synthetic image if a file is not found.
image_path = 'example_image.jpg' # You can change this to your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Image '{image_path}' not found. Creating a sample image...")
    # Create a sample image: a 300x300 blue square
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    image[:] = [255, 0, 0]  # BGR for blue

# Display the image in a window named 'Image'
# cv2.imshow('Image', image)
# cv2.waitKey(0)
# cv2.destroyAllWindows()
