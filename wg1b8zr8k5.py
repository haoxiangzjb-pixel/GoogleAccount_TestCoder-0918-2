#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script uses BeautifulSoup to scrape page titles from URLs.
"""

import requests
from bs4 import BeautifulSoup
import csv
import time
from urllib.parse import urljoin, urlparse
import sys


def scrape_page_title(url):
    """
    Scrape the title from a single webpage.
    
    Args:
        url (str): The URL to scrape
        
    Returns:
        str: The page title or an error message
    """
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
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
    for i, url in enumerate(urls):
        print(f"Scraping {i+1}/{len(urls)}: {url}")
        title = scrape_page_title(url)
        results.append((url, title))
        
        # Be respectful and don't overload the server
        time.sleep(1)
        
    return results


def save_results_to_csv(results, filename="scraped_titles.csv"):
    """
    Save the scraping results to a CSV file.
    
    Args:
        results (list): List of (url, title) tuples
        filename (str): Name of the output CSV file
    """
    with open(filename, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['URL', 'Title'])  # Header row
        writer.writerows(results)
    
    print(f"Results saved to {filename}")


def main():
    # Example URLs to scrape - you can modify this list
    urls = [
        "https://httpbin.org/html",  # Test page with HTML
        "https://example.com",       # Example domain
        "https://httpbin.org/json"   # This will likely not have a title
    ]
    
    print("Starting to scrape page titles...")
    results = scrape_multiple_pages(urls)
    
    print("\nScraping completed. Results:")
    print("-" * 50)
    for url, title in results:
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)
    
    # Save results to CSV
    save_results_to_csv(results)
    
    # Also save to a text file
    with open("scraped_titles.txt", "w", encoding="utf-8") as f:
        for url, title in results:
            f.write(f"URL: {url}\n")
            f.write(f"Title: {title}\n")
            f.write("-" * 50 + "\n")
    
    print("Results also saved to scraped_titles.txt")


if __name__ == "__main__":
    main()