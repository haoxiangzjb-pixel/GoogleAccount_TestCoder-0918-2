#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and save the response to a file.
"""

import requests
import random
import string
import json


def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}{extension}"


def call_rest_api(url):
    """Call a REST API and return the response."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None


def save_data_to_file(data, filename):
    """Save data to a file."""
    try:
        with open(filename, 'w', encoding='utf-8') as file:
            if isinstance(data, dict) or isinstance(data, list):
                json.dump(data, file, indent=2)
            else:
                file.write(str(data))
        print(f"Data saved to {filename}")
    except IOError as e:
        print(f"Error saving file: {e}")


def main():
    # Example API - you can change this to any REST API you want to call
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling API: {api_url}")
    
    # Call the API
    api_data = call_rest_api(api_url)
    
    if api_data:
        # Generate a random filename
        random_filename = generate_random_filename(".py")
        
        print(f"Saving API response to: {random_filename}")
        
        # Save the API response to the randomly named file
        save_data_to_file(api_data, random_filename)
        
        print("Script completed successfully!")
    else:
        print("Failed to retrieve data from API")


if __name__ == "__main__":
    main()