import requests
from bs4 import BeautifulSoup
import uuid

def scrape_page_title(url):
    """Scrapes the title from a given URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No Title Found"
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {url}: {e}")
        return None

if __name__ == "__main__":
    # Example URL; replace with the target URL
    url_to_scrape = input("Enter the URL to scrape the title from: ")
    title = scrape_page_title(url_to_scrape)

    if title:
        # Generate a random filename
        random_filename = f"scraped_title_{uuid.uuid4().hex}.txt"
        with open(random_filename, 'w', encoding='utf-8') as f:
            f.write(title)
        print(f"Page title scraped and saved to {random_filename}")
    else:
        print("Failed to scrape the page title.")
