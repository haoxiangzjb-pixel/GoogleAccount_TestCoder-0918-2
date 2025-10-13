from selenium import webdriver
from selenium.webdriver.common.by import By
import time

def test_open_google():
    # Initialize the Chrome driver
    driver = webdriver.Chrome()
    try:
        # Open Google
        driver.get("https://www.google.com")
        # Pause to observe the page (optional)
        time.sleep(2)
        print("Successfully opened Google.")
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()