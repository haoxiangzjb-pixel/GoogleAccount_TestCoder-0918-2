#!/usr/bin/env python3
"""
Script to generate a Python script that scrapes page titles using BeautifulSoup.
The generated script will have a random filename.
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
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for _ in range(10))
    return f"{random_name}{extension}"

def create_scraping_script():
    """
    Creates a Python script that scrapes page titles using BeautifulSoup.
    The script is saved with a random filename.
    """
    script_content = '''#!/usr/bin/env python3
"""
A Python script to scrape page titles from URLs using BeautifulSoup.
This script was randomly generated.
"""

import requests
from bs4 import BeautifulSoup

def scrape_page_title(url):
    """
    Scrape the title from a given URL.
    
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
        
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find the title tag
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {str(e)}"
    except Exception as e:
        return f"Error parsing page: {str(e)}"

def scrape_multiple_pages(urls):
    """
    Scrape titles from multiple URLs.
    
    Args:
        urls (list): List of URLs to scrape
        
    Returns:
        list: List of tuples containing (url, title)
    """
    results = []
    for url in urls:
        title = scrape_page_title(url)
        results.append((url, title))
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)
    
    return results

if __name__ == "__main__":
    # Example URLs to scrape
    urls_to_scrape = [
        "https://httpbin.org/html",  # Test page with HTML
        "https://example.com",       # Example domain
        "https://httpbin.org/json"   # Test page with JSON
    ]
    
    print("Scraping page titles...")
    results = scrape_multiple_pages(urls_to_scrape)
    
    print("\\nScraping completed!")
'''
    
    # Generate a random filename
    random_filename = generate_random_filename(".py")
    
    # Write the script to the randomly named file
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write(script_content)
    
    print(f"Created scraping script: {random_filename}")
    return random_filename

if __name__ == "__main__":
    created_file = create_scraping_script()
    print(f"Successfully created {created_file} with BeautifulSoup scraping functionality.")