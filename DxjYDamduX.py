import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager

# Setup Chrome options for headless mode
chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# Setup the Chrome driver with WebDriver Manager and options
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=chrome_options)

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait for a few seconds to see the page (implicitly waits in headless mode too)
    driver.implicitly_wait(5)

    # Generate a random filename
    random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.py'
    print(f"Saving test script as: {random_filename}")
    # Save the current script content to the random filename
    # This part is omitted in the saved file to prevent infinite recursion

finally:
    # Close the browser
    driver.quit()
