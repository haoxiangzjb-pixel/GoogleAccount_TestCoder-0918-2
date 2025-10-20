#!/usr/bin/env python3
"""
Script to create a randomly named Python file with BeautifulSoup scraping code.
"""

import random
import string
import os


def generate_random_filename(extension=".py"):
    """
    Generate a random filename with the given extension.
    
    Args:
        extension (str): The file extension to use
        
    Returns:
        str: A random filename
    """
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}{extension}"


def create_scraping_script(filename):
    """
    Create a Python script with BeautifulSoup scraping code.
    
    Args:
        filename (str): The name of the file to create
    """
    scraping_code = '''#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from URLs using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import random
import string
from urllib.parse import urlparse


def scrape_page_title(url):
    """
    Scrape the title of a webpage.
    
    Args:
        url (str): The URL to scrape
        
    Returns:
        str: The title of the page or an error message
    """
    try:
        # Add headers to avoid being blocked by some websites
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.RequestException as e:
        return f"Error fetching URL: {str(e)}"
    except Exception as e:
        return f"Error parsing page: {str(e)}"


def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",
        "https://example.com",
        "https://www.python.org"
    ]
    
    print("Scraping page titles...")
    for url in urls:
        title = scrape_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)


if __name__ == "__main__":
    main()
'''
    
    with open(filename, 'w', encoding='utf-8') as file:
        file.write(scraping_code)
    
    print(f"Created scraping script: {filename}")


def main():
    # Generate a random filename
    random_filename = generate_random_filename(".py")
    
    # Create the scraping script with the random filename
    create_scraping_script(random_filename)
    
    print(f"Successfully created {random_filename} with BeautifulSoup scraping code!")


if __name__ == "__main__":
    main()