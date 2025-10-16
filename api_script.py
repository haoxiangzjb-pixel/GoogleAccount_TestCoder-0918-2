import requests
import json
import random
import string

def call_rest_api():
    """
    Calls a REST API and displays the response
    """
    # Using JSONPlaceholder as a sample API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the API call
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(json.dumps(response.json(), indent=2))
        else:
            print(f"API call failed with status code: {response.status_code}")
    
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    call_rest_api()