from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time
import random
import string

def create_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Set up Chrome options
    chrome_options = Options()
    # Uncomment the next line if you want to run in headless mode
    # chrome_options.add_argument("--headless")
    
    # Initialize the Chrome driver
    driver = webdriver.Chrome(options=chrome_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for the page to load
        time.sleep(3)
        
        # Verify we're on the correct page
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
    except Exception as e:
        print(f"An error occurred: {e}")
    
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    main()