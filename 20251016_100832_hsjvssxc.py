import cv2
import numpy as np

def main():
    # Load an image (for this example, we'll create a sample image)
    # In real usage, replace with: image = cv2.imread('path_to_your_image.jpg')
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    image[:] = [255, 100, 50]  # Blue color background
    
    # Draw some shapes to make the image more interesting
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), 2)
    cv2.putText(image, 'Sample Image', (70, 150), 
                cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    print("Image loaded successfully.")
    # Note: Image display is skipped in headless environments

if __name__ == "__main__":
    main()
