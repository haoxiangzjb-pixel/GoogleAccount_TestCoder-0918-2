#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from a list of URLs using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import csv
import time
from urllib.parse import urljoin, urlparse
import random

def scrape_page_title(url):
    """
    Scrape the title of a webpage.
    
    Args:
        url (str): The URL of the webpage to scrape
        
    Returns:
        str: The title of the webpage or an error message
    """
    try:
        # Add headers to mimic a real browser request
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Try to find the title tag
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text().strip()
        else:
            # If no title tag found, return a default message
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
        list: List of dictionaries with URL and title
    """
    results = []
    
    for i, url in enumerate(urls):
        print(f"Scraping {i+1}/{len(urls)}: {url}")
        title = scrape_page_title(url)
        results.append({"url": url, "title": title})
        
        # Add a small delay to be respectful to the servers
        time.sleep(random.uniform(0.5, 1.5))
    
    return results

def save_results_to_csv(results, filename="scraped_titles.csv"):
    """
    Save the scraping results to a CSV file.
    
    Args:
        results (list): List of dictionaries with scraping results
        filename (str): Name of the output CSV file
    """
    with open(filename, mode='w', newline='', encoding='utf-8') as file:
        writer = csv.DictWriter(file, fieldnames=['url', 'title'])
        writer.writeheader()
        for result in results:
            writer.writerow(result)
    
    print(f"Results saved to {filename}")

def main():
    # Example URLs to scrape - replace these with the URLs you want to scrape
    urls_to_scrape = [
        "https://httpbin.org/html",  # Test page with HTML
        "https://example.com",
        "https://httpbin.org/json",  # This won't have a title tag
    ]
    
    print("Starting to scrape page titles...")
    results = scrape_multiple_pages(urls_to_scrape)
    
    print("\nScraping completed! Results:")
    print("-" * 50)
    for result in results:
        print(f"URL: {result['url']}")
        print(f"Title: {result['title']}")
        print("-" * 50)
    
    # Save results to a CSV file
    save_results_to_csv(results)

if __name__ == "__main__":
    main()