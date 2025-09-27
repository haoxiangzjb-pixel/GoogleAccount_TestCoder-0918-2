from selenium import webdriver
from selenium.webdriver.chrome.options import Options

# Set up Chrome options (optional, for headless mode or other settings)
chrome_options = Options()
# chrome_options.add_argument("--headless") # Uncomment to run headless

# Initialize the Chrome WebDriver
driver = webdriver.Chrome(options=chrome_options)

try:
    # Navigate to Google
    driver.get("https://www.google.com")

    # You can add more interactions here if needed

    # Example: Print the title of the page
    print(driver.title)

finally:
    # Close the browser window
    driver.quit()
