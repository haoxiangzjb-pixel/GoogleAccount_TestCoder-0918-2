#!/usr/bin/env python3
"""
Scrape page titles from URLs using BeautifulSoup.
"""

import sys
import requests
from bs4 import BeautifulSoup


def scrape_title(url: str) -> str | None:
    """Fetch a URL and return the page title, or None if it fails."""
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
    except requests.RequestException as e:
        print(f"Error fetching {url}: {e}", file=sys.stderr)
        return None

    soup = BeautifulSoup(response.text, "html.parser")
    title_tag = soup.find("title")
    if title_tag and title_tag.string:
        return title_tag.string.strip()
    return None


def main():
    if len(sys.argv) < 2:
        print("Usage: python ybs3qr47.py <url> [<url> ...]")
        sys.exit(1)

    for url in sys.argv[1:]:
        title = scrape_title(url)
        if title:
            print(f"{url} -> {title}")
        else:
            print(f"{url} -> (no title or error)")


if __name__ == "__main__":
    main()
