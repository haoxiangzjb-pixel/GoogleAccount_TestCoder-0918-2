#!/usr/bin/env python3
"""
A Python script that uses Requests to call a REST API
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def fetch_api_data():
    """Fetch data from a REST API"""
    # Using JSONPlaceholder as a sample API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from API: {e}")
        return None

def save_script_with_random_name():
    """Create and save this script with a random name"""
    # Get the API data
    api_data = fetch_api_data()
    
    if api_data is None:
        print("Failed to fetch API data. Exiting.")
        return
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create the content for the new file
    script_content = f'''#!/usr/bin/env python3
"""
Auto-generated Python script that calls a REST API
Random filename: {random_filename}
API Response:
{json.dumps(api_data, indent=2)}
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
        print(f"Error fetching data from API: {{e}}")
        return None

if __name__ == "__main__":
    data = fetch_api_data()
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to fetch data from API")
'''
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")

if __name__ == "__main__":
    save_script_with_random_name()