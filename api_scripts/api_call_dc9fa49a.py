#!/usr/bin/env python3
"""
A Python script that demonstrates calling a REST API using the Requests library.
This script fetches data from the JSONPlaceholder API and displays it.
"""

import requests
import json
import sys

def fetch_posts():
    """Fetch posts from JSONPlaceholder API"""
    url = "https://jsonplaceholder.typicode.com/posts"
    
    try:
        # Make GET request to the API
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        # Parse JSON response
        posts = response.json()
        
        return posts
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        return None

def fetch_user(user_id):
    """Fetch a specific user from JSONPlaceholder API"""
    url = f"https://jsonplaceholder.typicode.com/users/{user_id}"
    
    try:
        response = requests.get(url)
        response.raise_for_status()
        user = response.json()
        return user
    except requests.exceptions.RequestException as e:
        print(f"Error fetching user data: {e}")
        return None

def main():
    print("Fetching posts from JSONPlaceholder API...")
    posts = fetch_posts()
    
    if posts is not None:
        print(f"Successfully fetched {len(posts)} posts.")
        print("\\nFirst post:")
        print(json.dumps(posts[0], indent=2))
        
        # Fetch user details for the first post
        user_id = posts[0]['userId']
        print(f"\\nFetching user details for user ID {user_id}...")
        user = fetch_user(user_id)
        
        if user is not None:
            print("User details:")
            print(json.dumps(user, indent=2))
    else:
        print("Failed to fetch posts.")
        sys.exit(1)

if __name__ == "__main__":
    main()