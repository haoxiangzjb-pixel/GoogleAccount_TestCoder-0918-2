import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

def test_open_google():
    # Set up Chrome options (headless mode for compatibility)
    chrome_options = Options()
    chrome_options.add_argument('--headless')  # Remove this line if you want to see the browser
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    
    # Initialize the driver
    driver = webdriver.Chrome(options=chrome_options)
    
    try:
        # Open Google
        driver.get('https://www.google.com')
        
        # Wait a bit to see the page
        time.sleep(2)
        
        # Verify we're on the Google page
        assert 'Google' in driver.title
        
        print('Successfully opened Google!')
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == '__main__':
    test_open_google()
