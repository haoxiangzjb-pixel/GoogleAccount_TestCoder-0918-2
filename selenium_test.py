import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager

# Setup the Chrome driver with WebDriver Manager
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait for a few seconds to see the page
    driver.implicitly_wait(5)

    # Generate a random filename
    random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.py'
    print(f"Saving test script as: {random_filename}")

    # Save the current script content to the random filename
    with open(random_filename, 'w') as f:
        f.write('''import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager

# Setup the Chrome driver with WebDriver Manager
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait for a few seconds to see the page
    driver.implicitly_wait(5)

    # Generate a random filename
    random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.py'
    print(f"Saving test script as: {random_filename}")

    # Save the current script content to the random filename
    # This part is omitted in the saved file to prevent infinite recursion
    print("Test completed and Google page opened successfully!")

finally:
    # Close the browser
    driver.quit()
''')

    print("Test completed and Google page opened successfully!")

finally:
    # Close the browser
    driver.quit()
