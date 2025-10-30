#!/usr/bin/env python3
"""
Script to create a randomly named Python file containing the web scraper
"""

import random
import string
import os

# The content of our web scraper
scraper_content = '''#!/usr/bin/env python3
"""
Web scraper to extract page titles from URLs using BeautifulSoup
"""

import requests
from bs4 import BeautifulSoup
import random
import string


def scrape_page_title(url):
    """
    Scrape the title from a given URL
    """
    try:
        # Add headers to avoid being blocked by some websites
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        # Send GET request
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find the title tag
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    
    except requests.RequestException as e:
        return f"Error fetching URL: {str(e)}"
    except Exception as e:
        return f"Error parsing page: {str(e)}"


def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"


def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",
        "https://example.com",
        "https://httpbin.org/robots.txt"  # This won't have a title
    ]
    
    print("Scraping page titles...")
    for url in urls:
        title = scrape_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)
    
    # Example of scraping a specific URL
    target_url = input("Enter a URL to scrape (or press Enter to skip): ").strip()
    if target_url:
        title = scrape_page_title(target_url)
        print(f"\\nTitle of {target_url}:")
        print(title)


if __name__ == "__main__":
    main()
'''

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the scraper content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(scraper_content)
    
    print(f"Web scraper saved to: {random_filename}")

if __name__ == "__main__":
    main()