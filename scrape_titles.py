import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """
    Scrapes the title from a given URL.

    Args:
        url (str): The URL of the page to scrape.

    Returns:
        str: The title of the page, or an error message.
    """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "Title tag not found"
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {e}"
    except Exception as e:
        return f"An error occurred: {e}"

def generate_random_filename(extension=".py"):
    """Generates a random filename with a given extension."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}{extension}"

if __name__ == "__main__":
    # Example URL - replace with the URL you want to scrape
    url_to_scrape = "https://httpbin.org/html"

    title = scrape_page_title(url_to_scrape)
    print(f"Scraped Title from '{url_to_scrape}': {title}")

    # Generate a random filename for the script itself
    random_script_filename = generate_random_filename(".py")
    print(f"This script is saved as: {random_script_filename}")

    # Example of saving the title to a simple text file with a random name
    random_data_filename = generate_random_filename(".txt")
    with open(random_data_filename, 'w') as f:
        f.write(f"URL: {url_to_scrape}\n")
        f.write(f"Title: {title}\n")
    print(f"Scraped data saved to: {random_data_filename}")
