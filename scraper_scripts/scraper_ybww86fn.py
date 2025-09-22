import requests
from bs4 import BeautifulSoup
import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"scraper_{random_chars}.py"

def scrape_page_title(url):
    """Scrape the title of a webpage"""
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()
        
        soup = BeautifulSoup(response.content, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    except Exception as e:
        return f"Error scraping {url}: {str(e)}"

def save_script_to_random_file():
    """Save this script to a randomly named file"""
    # Get the current script's content
    current_file = os.path.abspath(__file__)
    with open(current_file, 'r') as f:
        content = f.read()
    
    # Generate a random filename
    random_name = generate_random_filename()
    
    # Save to the new file
    with open(random_name, 'w') as f:
        f.write(content)
    
    return random_name

def main():
    # Example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://stackoverflow.com",
        "https://www.wikipedia.org"
    ]
    
    print("Scraping page titles:")
    print("-" * 40)
    
    for url in urls:
        title = scrape_page_title(url)
        print(f"{url}: {title}")
    
    # Save this script to a randomly named file
    random_filename = save_script_to_random_file()
    print(f"\nThis script has been saved to a new file: {random_filename}")

if __name__ == "__main__":
    main()