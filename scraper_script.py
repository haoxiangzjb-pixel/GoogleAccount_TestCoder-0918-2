import requests
from bs4 import BeautifulSoup
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs
    
    Args:
        urls (list): List of URLs to scrape titles from
    
    Returns:
        list: List of tuples containing (url, title)
    """
    results = []
    
    for url in urls:
        try:
            # Send GET request to the URL
            response = requests.get(url)
            response.raise_for_status()  # Raise an exception for bad status codes
            
            # Parse the HTML content
            soup = BeautifulSoup(response.content, 'html.parser')
            
            # Find the title tag
            title_tag = soup.find('title')
            
            if title_tag:
                title = title_tag.get_text().strip()
            else:
                title = "No title found"
            
            results.append((url, title))
            
        except requests.RequestException as e:
            print(f"Error fetching {url}: {e}")
            results.append((url, f"Error: {e}"))
        except Exception as e:
            print(f"Error parsing {url}: {e}")
            results.append((url, f"Error: {e}"))
    
    return results

def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",  # Test page with HTML
        "https://example.com",       # Example domain
        "https://httpbin.org/json"   # JSON test page (no title)
    ]
    
    print("Scraping page titles...")
    results = scrape_page_titles(urls)
    
    print("\nResults:")
    for url, title in results:
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)
    
    # Generate random filename and save results
    random_filename = generate_random_filename()
    
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write("# Scraped page titles\n\n")
        f.write("page_titles = [\n")
        for url, title in results:
            f.write(f"    ('{url}', '{title}'),\n")
        f.write("]\n")
        
    print(f"\nResults saved to: {random_filename}")

if __name__ == "__main__":
    main()