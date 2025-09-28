import requests
from bs4 import BeautifulSoup

def scrape_page_title(url):
  """Scrapes the title from a given URL."""
  try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for bad status codes

    soup = BeautifulSoup(response.content, 'html.parser')
    title_tag = soup.find('title')

    if title_tag:
      return title_tag.get_text(strip=True)
    else:
      return "Title not found"

  except requests.exceptions.RequestException as e:
    print(f"An error occurred while fetching the page: {e}")
    return None

if __name__ == "__main__":
  # Example URL, replace with the target URL
  url = "https://httpbin.org/html"
  title = scrape_page_title(url)

  if title:
    print(f"The title of the page is: {title}")
  else:
    print("Could not retrieve the page title.")