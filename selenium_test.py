import random
import string
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_selenium_test():
    """Create the Selenium test code as a string"""
    test_code = '''from selenium import webdriver
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
'''
    return test_code

# Generate a random filename
random_filename = generate_random_filename()

# Create the Selenium test code
test_content = create_selenium_test()

# Write the test code to the randomly named file
with open(random_filename, 'w') as f:
    f.write(test_content)

print(f"Selenium test saved to: {random_filename}")