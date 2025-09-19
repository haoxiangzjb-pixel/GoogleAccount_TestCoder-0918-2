from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"test_{random_string}.py"

def test_google_search():
    """Selenium test to open Google"""
    # Initialize the Chrome driver
    driver = webdriver.Chrome()
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(2)
        
        # Verify we're on Google by checking the title
        assert "Google" in driver.title
        
        # Find the search box
        search_box = driver.find_element(By.NAME, "q")
        
        # Print success message
        print("Successfully opened Google and found search box")
        
    except Exception as e:
        print(f"Test failed with exception: {e}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_google_search()