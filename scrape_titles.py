import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """Scrapes the title from a given URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "No title tag found"
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {url}: {e}")
        return None
    except Exception as e:
        print(f"An error occurred while scraping {url}: {e}")
        return None

def main():
    # Example URL, replace with the target URL
    url = "https://httpbin.org/html"  # A test page that often has a title
    title = scrape_page_title(url)

    if title:
        print(f"Title of {url} is: {title}")

        # Generate a random filename
        random_filename = "scraped_titles_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"
        print(f"Saving script to {random_filename}...")

        # This script saves *itself* to the random filename as an example.
        # A real scraper might save the *data* (the title) to a file.
        with open(random_filename, 'w') as f:
            f.write('''import requests
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
''')
        print(f"Script saved successfully as {random_filename}!")
    else:
        print("Could not scrape the title.")

if __name__ == "__main__":
    main()
