from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
import tempfile
import os

def test_open_google():
    """A simple Selenium test to open Google."""
    # Setup Chrome options for headless and temporary user data directory
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in background
    chrome_options.add_argument("--no-sandbox") # Bypass OS security model
    chrome_options.add_argument("--disable-dev-shm-usage") # Overcome limited resource problems
    # Create a temporary directory for user data
    temp_user_data_dir = tempfile.mkdtemp()
    chrome_options.add_argument(f"--user-data-dir={temp_user_data_dir}")

    # Specify the path to the ChromeDriver executable if it's installed
    # Otherwise, webdriver_manager will download it
    # For this environment, we assume it's managed by webdriver_manager
    from webdriver_manager.chrome import ChromeDriverManager
    service = Service(ChromeDriverManager().install())
    
    # Explicitly set the path to the Chrome binary if it's not in PATH
    # This path was found using 'find' command in the system
    chrome_options.binary_location = "/root/.cache/ms-playwright/chromium-1187/chrome-linux/chrome"

    driver = webdriver.Chrome(service=service, options=chrome_options)

    try:
        # Navigate to Google
        driver.get("https://www.google.com")
        # Check the title
        assert "Google" in driver.title
        print("Test Passed: Successfully opened Google and verified the title.")
    except Exception as e:
        print(f"Test Failed: {e}")
    finally:
        # Close the browser and clean up the temporary directory
        driver.quit()
        # Note: The temporary user data directory is not automatically deleted here
        # but will be cleaned up by the system eventually.

if __name__ == "__main__":
    test_open_google()
