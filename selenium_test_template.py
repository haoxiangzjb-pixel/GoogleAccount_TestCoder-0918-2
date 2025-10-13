from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

def test_open_google():
    """A simple Selenium test to open Google."""
    # Setup the Chrome driver using webdriver_manager
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service)

    try:
        # Navigate to Google
        driver.get("https://www.google.com")
        # Keep the browser open for a few seconds to observe
        import time
        time.sleep(3)
        assert "Google" in driver.title
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()
