from selenium import webdriver
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
