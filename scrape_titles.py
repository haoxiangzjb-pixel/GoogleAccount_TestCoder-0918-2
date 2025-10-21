#!/usr/bin/env python3
"""
A Python script to scrape page titles from URLs using BeautifulSoup.
This script can be run directly to scrape titles from a list of URLs.
"""

import requests
from bs4 import BeautifulSoup
import random
import string

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
    
    # Generate a random filename and save results
    random_filename = generate_random_filename(".txt")
    with open(random_filename, 'w', encoding='utf-8') as f:
        for url, title in results:
            f.write(f"URL: {url}\nTitle: {title}\n{'-'*50}\n")
    
    print(f"\nResults saved to {random_filename}")