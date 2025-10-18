from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Initialize the Chrome driver
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")
    
    # Wait for the page to load
    time.sleep(3)
    
    # Verify that the page title contains 'Google'
    assert "Google" in driver.title
    
    print("Successfully opened Google and verified the page title!")
    
finally:
    # Close the browser
    driver.quit()
