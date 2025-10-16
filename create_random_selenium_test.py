import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + ".py"

# Content for the Selenium test
selenium_test_content = '''import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options


class GoogleTest(unittest.TestCase):
    
    def setUp(self):
        # Set up Chrome options
        chrome_options = Options()
        chrome_options.add_argument("--headless")  # Run in headless mode for testing
        self.driver = webdriver.Chrome(options=chrome_options)
        
    def test_open_google(self):
        # Open Google
        self.driver.get("https://www.google.com")
        
        # Verify that the page title contains 'Google'
        self.assertIn("Google", self.driver.title)
        
    def tearDown(self):
        # Close the browser
        self.driver.quit()


if __name__ == "__main__":
    unittest.main()
'''

# Write the content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(selenium_test_content)

print(f"Selenium test saved to randomly named file: {random_filename}")