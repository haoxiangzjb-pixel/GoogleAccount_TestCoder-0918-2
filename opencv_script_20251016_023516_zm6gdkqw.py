import cv2
import numpy as np

def main():
    # Create a simple test image
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1)  # Green rectangle
    cv2.putText(image, 'OpenCV Test', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    print("Displaying image...")
    cv2.imshow('Loaded Image', image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Optionally save the image
    cv2.imwrite('output_image.png', image)
    print("Image saved as output_image.png")

if __name__ == "__main__":
    main()
