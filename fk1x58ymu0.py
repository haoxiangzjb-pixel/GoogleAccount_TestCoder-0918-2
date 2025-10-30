#!/usr/bin/env python3
"""
Auto-generated Python script that calls a REST API
Random filename: fk1x58ymu0.py
API Response:
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
"""

import requests
import json

def fetch_api_data():
    """Fetch data from a REST API"""
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from API: {e}")
        return None

if __name__ == "__main__":
    data = fetch_api_data()
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to fetch data from API")
