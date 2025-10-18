import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
import time

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Set up Chrome options
chrome_options = Options()
chrome_options.add_argument("--headless")  # Run in headless mode
chrome_options.add_argument("--no-sandbox")  # Bypass OS security model
chrome_options.add_argument("--disable-dev-shm-usage")  # Overcome limited resource problems
chrome_options.add_argument("--disable-gpu")  # Applicable to Windows OS only
chrome_options.add_argument("--remote-debugging-port=9222")  # This is important
chrome_options.binary_location = "/usr/bin/chromium"  # Specify the Chromium binary location

# Set up the Chrome driver with webdriver-manager for Chromium
service = Service(ChromeDriverManager(chrome_type='chromium').install())
driver = webdriver.Chrome(service=service, options=chrome_options)

try:
    # Open Google
    driver.get("https://www.google.com")
    
    # Print title to confirm we're on the right page
    print(f"Page title: {driver.title}")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create a simple test script content
    test_content = f'''# Selenium test to open Google
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
import time

def test_open_google():
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode
    chrome_options.add_argument("--no-sandbox")  # Bypass OS security model
    chrome_options.add_argument("--disable-dev-shm-usage")  # Overcome limited resource problems
    chrome_options.add_argument("--disable-gpu")  # Applicable to Windows OS only
    chrome_options.add_argument("--remote-debugging-port=9222")  # This is important
    chrome_options.binary_location = "/usr/bin/chromium"  # Specify the Chromium binary location
    service = Service(ChromeDriverManager(chrome_type='chromium').install())
    driver = webdriver.Chrome(service=service, options=chrome_options)
    
    try:
        driver.get("https://www.google.com")
        time.sleep(1)  # Shorter wait time
        print(f"Successfully opened Google. Title: {{driver.title}}")
    finally:
        driver.quit()

if __name__ == "__main__":
    test_open_google()
'''
    
    # Write the test content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(test_content)
    
    print(f"Selenium test saved to: {random_filename}")
    
finally:
    # Close the browser
    driver.quit()