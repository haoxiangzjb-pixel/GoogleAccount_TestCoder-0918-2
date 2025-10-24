#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from a given URL using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import sys
import time

def scrape_page_titles(url):
    """
    Scrape page titles from a given URL
    
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
        
        # Send GET request to the URL
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Find the title tag
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching the URL: {e}"
    except Exception as e:
        return f"An error occurred: {e}"

def main():
    """
    Main function to run the scraper
    """
    # Default URL to scrape if no argument is provided
    default_url = "https://httpbin.org/html"  # A test page that returns HTML
    
    # Use command line argument if provided, otherwise use default
    url = sys.argv[1] if len(sys.argv) > 1 else default_url
    
    print(f"Scraping title from: {url}")
    title = scrape_page_titles(url)
    print(f"Page Title: {title}")

if __name__ == "__main__":
    main()