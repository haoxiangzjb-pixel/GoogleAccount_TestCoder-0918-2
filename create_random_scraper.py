#!/usr/bin/env python3
"""
Script to create a randomly named Python file with BeautifulSoup scraper
"""
import random
import string
import os

def generate_random_filename():
    """Generate a random Python filename"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def get_scraper_content():
    """Get the content for the scraper script"""
    return '''#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from URLs using BeautifulSoup.
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
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    except Exception as e:
        return f"Error: {str(e)}"

def generate_random_filename():
    """
    Generate a random Python filename
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    # Example usage
    urls = [
        "https://httpbin.org/html",  # Test URL that returns HTML
        "https://example.com"
    ]
    
    print("Scraping page titles...")
    for url in urls:
        title = scrape_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)
'''

def main():
    """Main function to create the randomly named scraper file"""
    random_filename = generate_random_filename()
    scraper_content = get_scraper_content()
    
    with open(random_filename, 'w') as f:
        f.write(scraper_content)
    
    print(f"Created scraper script: {random_filename}")

if __name__ == "__main__":
    main()