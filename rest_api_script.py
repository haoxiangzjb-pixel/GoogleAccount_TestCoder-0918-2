#!/usr/bin/env python3
"""
A Python script that demonstrates calling a REST API using the requests library.
This script fetches data from a public API and displays the results.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def call_rest_api():
    """
    Function to call a REST API and process the response.
    Using JSONPlaceholder API as an example public API.
    """
    try:
        # Example API: Get a random post from JSONPlaceholder
        api_url = "https://jsonplaceholder.typicode.com/posts/1"
        
        print(f"Calling REST API: {api_url}")
        
        # Make the GET request
        response = requests.get(api_url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print(f"Success! Status code: {response.status_code}")
            
            # Parse the JSON response
            data = response.json()
            
            print("\nAPI Response:")
            print(json.dumps(data, indent=2))
            
            # Generate a random filename
            random_filename = generate_random_filename()
            
            # Save this script to the randomly named file
            with open(__file__, 'r') as original_file:
                script_content = original_file.read()
            
            with open(random_filename, 'w') as new_file:
                new_file.write(script_content)
            
            print(f"\nThis script has been saved to a randomly named file: {random_filename}")
            
            return data
        else:
            print(f"Error: Received status code {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the request: {e}")
        return None
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return None

def call_multiple_apis():
    """
    Function to demonstrate calling multiple REST APIs
    """
    apis_to_call = [
        "https://jsonplaceholder.typicode.com/users",
        "https://jsonplaceholder.typicode.com/posts",
        "https://jsonplaceholder.typicode.com/albums"
    ]
    
    all_data = {}
    
    for api_url in apis_to_call:
        try:
            print(f"\nCalling: {api_url}")
            response = requests.get(api_url)
            
            if response.status_code == 200:
                # Get just the first item to keep output manageable
                data = response.json()
                if isinstance(data, list) and len(data) > 0:
                    all_data[api_url] = data[0]  # Store first item
                else:
                    all_data[api_url] = data
                    
                print(f"Retrieved data from {api_url}")
            else:
                print(f"Failed to retrieve data from {api_url}, status: {response.status_code}")
                
        except requests.exceptions.RequestException as e:
            print(f"Error calling {api_url}: {e}")
    
    return all_data

if __name__ == "__main__":
    print("Python script using Requests to call REST API")
    print("=" * 50)
    
    # Call the main API function
    result = call_rest_api()
    
    print("\n" + "=" * 50)
    print("Calling multiple APIs...")
    multiple_results = call_multiple_apis()
    
    if multiple_results:
        print("\nSummary of all API calls:")
        for url, data in multiple_results.items():
            print(f"- {url}: Retrieved {type(data).__name__} data")