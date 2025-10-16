import unittest
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
