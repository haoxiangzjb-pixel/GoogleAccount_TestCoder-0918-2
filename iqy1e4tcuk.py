from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time

def run_google_test():
    """Open Google with Selenium"""
    # Set up Chrome options
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in background
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    
    # Initialize the driver
    driver = webdriver.Chrome()
    
    try:
        # Navigate to Google
        driver.get("https://www.google.com")
        
        # Wait a bit to ensure the page loads
        time.sleep(2)
        
        # Verify we're on the Google page by checking the title
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    run_google_test()
