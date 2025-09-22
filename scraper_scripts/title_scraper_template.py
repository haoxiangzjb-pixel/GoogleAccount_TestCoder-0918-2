#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script uses BeautifulSoup to scrape titles from web pages.
"""

import random
import string
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse


def generate_random_filename(length=10):
    """Generate a random filename with .py extension"""
    chars = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(chars) for _ in range(length))
    return f"{random_name}.py"


def scrape_page_title(url):
    """Scrape the title of a web page"""
    try:
        # Send GET request to the URL
        response = requests.get(url, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Extract the title
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    except Exception as e:
        return f"Error scraping {url}: {str(e)}"


def main():
    # Generate a random filename for this script
    filename = generate_random_filename()
    print(f"Generated filename: {filename}")
    
    # Example URLs to scrape (you can modify this list)
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://www.stackoverflow.com",
        "https://www.wikipedia.org"
    ]
    
    # Scrape titles from all URLs
    results = {}
    for url in urls:
        print(f"Scraping {url}...")
        title = scrape_page_title(url)
        results[url] = title
        print(f"Title: {title}\n")
    
    # Save results to a file
    with open(f"scraped_titles_{filename[:-3]}.txt", "w") as f:
        f.write("Scraped Page Titles\n")
        f.write("=" * 20 + "\n\n")
        for url, title in results.items():
            f.write(f"URL: {url}\n")
            f.write(f"Title: {title}\n\n")
    
    print(f"Results saved to scraped_titles_{filename[:-3]}.txt")


if __name__ == "__main__":
    main()