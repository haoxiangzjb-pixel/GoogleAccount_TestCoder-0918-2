#!/usr/bin/env python3
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
    
    print("\nScraping completed!")
