from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Initialize the Chrome WebDriver
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait for a moment to see the page load (optional)
    time.sleep(2)

    # Example interaction: Find the search box (optional)
    search_box = driver.find_element(By.NAME, "q")
    print(f"Found search box on {driver.title}")

    # Save the current script (this code) to the random filename
    with open(random_filename, 'w') as f:
        f.write('# Selenium Test Script\n')
        f.write('# This script opens Google\n')
        f.write('# Randomly generated filename for demonstration\n\n')
        f.write('from selenium import webdriver\n')
        f.write('from selenium.webdriver.common.by import By\n')
        f.write('import time\n\n')
        f.write('driver = webdriver.Chrome()\n')
        f.write('driver.get("https://www.google.com")\n')
        f.write('time.sleep(2)\n')
        f.write('driver.quit()\n')

    print(f"Selenium script saved to {random_filename}")

finally:
    # Close the browser
    driver.quit()
