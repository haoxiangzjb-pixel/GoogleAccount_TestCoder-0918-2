from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import time
import random
import string
import os

def create_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_selenium_test_code():
    """Return the Selenium test code as a string"""
    return '''from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import time

def main():
    # Set up Chrome options
    chrome_options = Options()
    # Uncomment the next line if you want to run in headless mode
    # chrome_options.add_argument("--headless")
    
    # Set up the Chrome driver with ChromeDriverManager
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service, options=chrome_options)
    
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
'''

def main():
    # Generate the random filename
    random_filename = create_random_filename()
    
    # Get the Selenium test code
    selenium_code = create_selenium_test_code()
    
    # Write the code to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(selenium_code)
    
    print(f"Selenium test saved to: {random_filename}")
    
    # Also run the test if desired
    print("Running the Selenium test...")
    exec(selenium_code, {"__name__": "__main__"})

if __name__ == "__main__":
    main()