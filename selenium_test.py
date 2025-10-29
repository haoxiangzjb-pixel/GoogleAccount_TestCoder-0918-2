import uuid
import os
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager

def create_selenium_test():
    # Create the Selenium test content
    test_content = '''from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
import time

# Setup Chrome driver with WebDriver Manager
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

try:
    # Open Google
    driver.get("https://www.google.com")
    
    # Wait a bit to see the page
    time.sleep(3)
    
    print("Successfully opened Google!")
    
finally:
    # Close the browser
    driver.quit()
'''
    
    # Generate a random filename
    random_filename = f"test_{str(uuid.uuid4())[:8]}.py"
    
    # Write the test content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(test_content)
    
    print(f"Selenium test saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    create_selenium_test()