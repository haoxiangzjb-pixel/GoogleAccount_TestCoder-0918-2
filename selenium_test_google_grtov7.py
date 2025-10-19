from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service
from webdriver_manager.firefox import GeckoDriverManager
import time
import os

def test_open_google():
    # Set up Firefox options
    firefox_options = Options()
    firefox_options.add_argument("--headless")  # Run in headless mode (no GUI)
    
    # Set up the Firefox driver with webdriver-manager
    service = Service(GeckoDriverManager().install())
    driver = webdriver.Firefox(service=service, options=firefox_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Verify that the page title contains "Google"
        assert "Google" in driver.title
        print("Successfully opened Google and verified the title")
        
        # Wait a bit to see the page
        time.sleep(2)
        
    except Exception as e:
        print(f"An error occurred: {e}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()