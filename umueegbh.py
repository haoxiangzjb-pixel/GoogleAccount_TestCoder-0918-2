from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options

def test_open_google():
    # Set up Chrome options
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode (no GUI)
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")

    # Initialize the WebDriver
    driver = webdriver.Chrome(options=chrome_options)

    try:
        # Open Google
        driver.get("https://www.google.com")

        # Verify the page title contains "Google"
        assert "Google" in driver.title, f"Expected 'Google' in title, got: {driver.title}"

        print(f"Successfully opened Google. Page title: {driver.title}")

    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()
