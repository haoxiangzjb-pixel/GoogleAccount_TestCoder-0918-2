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
    
    # Verify we're on Google by checking the title
    assert "Google" in driver.title
    print("Successfully opened Google!")
    
    # Optional: Search for something
    search_box = driver.find_element(By.NAME, "q")
    search_box.send_keys("Selenium test")
    search_box.submit()
    
    # Wait to see results
    time.sleep(3)
    
finally:
    # Close the browser
    driver.quit()