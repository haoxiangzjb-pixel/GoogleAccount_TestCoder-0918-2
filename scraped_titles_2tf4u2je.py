import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """Scrapes the title from a given URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "No title tag found"
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {{url}}: {{e}}")
        return None
    except Exception as e:
        print(f"An error occurred while scraping {{url}}: {{e}}")
        return None

def main():
    url = "https://httpbin.org/html"
    title = scrape_page_title(url)

    if title:
        print(f"Title of {{url}} is: {{title}}")

        random_filename = "scraped_titles_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"
        with open(random_filename, 'w') as f:
            f.write("...") # Simplified for example
        print(f"Script saved as {{random_filename}}")

if __name__ == "__main__":
    main()
