import requests
from bs4 import BeautifulSoup

def scrape_page_title(url):
    """
    Scrapes the title from a given URL.

    Args:
        url (str): The URL of the page to scrape.

    Returns:
        str: The title of the page, or None if not found or on error.
    """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return None
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching the URL: {e}")
        return None
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return None

if __name__ == "__main__":
    # Example usage
    url = "https://www.example.com"
    title = scrape_page_title(url)
    if title:
        print(f"The title of {url} is: {title}")
    else:
        print(f"Could not find the title for {url}")