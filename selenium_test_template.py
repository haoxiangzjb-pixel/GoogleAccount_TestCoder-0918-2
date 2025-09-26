from selenium import webdriver
from selenium.webdriver.common.by import By
import time

def test_open_google():
    # Initialize the Chrome WebDriver
    driver = webdriver.Chrome()
    
    try:
        # Navigate to Google
        driver.get("https://www.google.com")
        
        # Optional: Wait for a few seconds to see the page load
        time.sleep(5)
        
        # Example assertion: Check if the title contains 'Google'
        assert "Google" in driver.title
        
        print("Test passed: Successfully opened Google and verified the title.")
        
    finally:
        # Close the browser window
        driver.quit()

if __name__ == "__main__":
    test_open_google()